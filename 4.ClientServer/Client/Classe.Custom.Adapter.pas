unit Classe.Custom.Adapter;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView, FMX.ListView.Types, FMX.ListView.Adapters.Base, System.SyncObjs,
  FMX.Controls.Presentation, FMX.Layouts, System.Generics.Collections, System.RegularExpressions,
  FMX.Objects, idHTTP;

type
  TAdapterCustomizado = class(TAbstractListViewAdapter,
    IListViewAdapter,
    IListViewTextProvider,
    IListViewTextButtonProvider)
  private const
    THREAD_POOL_SIZE = 4;
  private
    FStrings: TStringList;
    FParent: TListViewBase;

    // meta - programação
    FImagens: TDictionary<Integer, TBitmap>;

    FThreads: TArray<TThread>;
    FRequests: TList<Integer>;
    FBackDropImage: TImage;

    FRegexMonitor: TObject;
    FURiRegex: TRegex;
    FIdRegex: TRegex;
    FNameRegEx: TRegex;

    FOnButtonClick: TNotifyEvent;

    FIndex: Integer;

    FCS: TCriticalSection;
    FSem: TSemaphore;
    FExitRequest: Boolean;

  private
    procedure ImagesLoaded;
    procedure MatchView(const Item: TListItem);
    procedure CreateThreads;
    procedure DestroyThreads;

    procedure AddIndex(Index: Integer);
    function  NextIndex: Integer;

    function GetName(Index: Integer): string;
    function GetId(const Index: Integer): string;
    function GetUri(const Index: Integer): string;

    procedure ButtonClicked(Sender: TObject);
    procedure SetOnButtonClicked(const Value: TNotifyEvent);

    procedure OnStringListChanging(Sender: TObject);
    procedure OnStringListChange(Sender: TObject);

    { IListViewTextProvider }
    function GetText(const Index: Integer): string;
    function GetIndexTitle(const Index: Integer): string;

    { IListViewTextButtonProvider }
    function GetTextButtonDrawable(const Index: Integer): TListItemTextButton;
  protected
    procedure DoCreateNewViews; override;
    procedure DoResetViews(const APurposes: TListItemPurposes); override;
    procedure DoResetView(const Item: TListItem); override;

    function CreateStubItem: TListItem;

    { IListViewAdapter }
    function GetCount: Integer;
    function GetItem(const Index: Integer): TListItem;
    function IndexOf(const AItem: TListItem): Integer;
    function GetEnumerator: System.Generics.Collections.TEnumerator<FMX.ListView.Types.TListItem>;
    function GetDefaultViewHeight: Integer;
  public
    constructor Create(AParent: TListViewBase; AStrings: TStringList);
    destructor Destroy; override;

    property BackdropImage: TImage read FBackdropImage write FBackdropImage;
    property OnButtonClicked: TNotifyEvent read FOnButtonClick write SetOnButtonClicked;
  end;


implementation


{ TAdapterCustomizado }

procedure TAdapterCustomizado.AddIndex(Index: Integer);
begin
  FCS.Acquire;
  try
    FRequests.Add(Index);
    FSem.Release;
  finally
    FCS.Release
  end;
end;

procedure TAdapterCustomizado.ButtonClicked(Sender: TObject);
begin
  if Assigned(FOnButtonClick) then
    FOnButtonClick(Sender);
end;

constructor TAdapterCustomizado.Create(AParent: TListViewBase;
  AStrings: TStringList);
begin
  inherited Create;
  FStrings := AStrings;
  FParent := AParent;

  FImagens := TDictionary<Integer, TBitmap>.Create;
  FUriRegex := TRegEx.Create('\[(http://.*)\]');
  FNameRegex := TRegEx.Create('\[([A-Za-z]+)\]');
  FIdRegex := TRegEx.Create('\[([0-9]+)\]');
  FRegexMonitor := TObject.Create;

  FRequests := TList<Integer>.Create;
  FCS := TCriticalSection.Create;
  FSem := TSemaphore.Create(nil, 0, 1000, '');
  CreateThreads;

  FStrings.OnChanging := OnStringListChanging;
  FStrings.OnChange := OnStringListChange;
end;

function TAdapterCustomizado.CreateStubItem: TListItem;
var
  TextDrawable: TListItemText;
begin
  Result := TListItem.Create(FParent.Adapter, FParent);
  Result.Height := GetDefaultViewHeight;
  Result.Index := 0;

  TextDrawable := TListItemText.Create(Result);
  TextDrawable.Text := 'Pull to load data';
end;

procedure TAdapterCustomizado.CreateThreads;
var
  i: Integer;

begin
  SetLength(FThreads, THREAD_POOL_SIZE);
  for i := 0 to Length(FThreads) - 1 do
  begin
    FThreads[i] := TThread.CreateAnonymousThread(
      procedure
      var
        lHttp: TIdHTTP;
        lStream: TBytesStream;
        lBitmap: TBitmap;
        lIndex: Integer;
        lURI: string;
      begin
        lHttp := TIdHTTP.Create(nil);
        lStream := TBytesStream.Create;
        try
          lIndex := NextIndex;
          while (lIndex <> -1) do
          begin
            lURI := GetUri(lIndex);
            try
              lHttp.Get(lURI, lStream);
              TThread.Synchronize(nil,
                procedure
                begin
                  try
                    lBitmap := TBitmap.CreateFromStream(lStream);
                    if (Assigned(lBitmap)) and (lBitmap.Width > 0) and (lBitmap.Height > 0) then
                    begin
                      FImagens.Add(lIndex, lBitmap);
                    end;
                  except
                    // melhorar depois
                  end;
                end);

              if (Assigned(lBitmap)) and (lBitmap.Width > 0) and (lBitmap.Height > 0) then
              begin
                TThread.Queue(nil,
                  procedure
                  begin
                    ImagesLoaded;
                  end);
              end;
            except
              on E: Exception do
              begin
                TThread.Queue(nil,
                  procedure
                  begin
                    TListItemText(TListItem(FStrings.Objects[lIndex]).View.FindDrawable('blurb')).Text := 'Load Error(' + E.ClassName +'), retrying...';
                    ItemsInvalidate;
                  end);
                AddIndex(lIndex);
                TThread.CurrentThread.Sleep(Random(100) + 100);
              end;
            end;

            lIndex := NextIndex;
          end;
        finally
          lStream.Free;
          lHttp.Free;
        end;
      end);
    FThreads[i].FreeOnTerminate := False;
    FThreads[i].Start;
  end;

end;

destructor TAdapterCustomizado.Destroy;
var
  Pair: TPair<Integer, TBitmap>;
  I: Integer;
begin
  DestroyThreads;
  FRequests.Free;
  for Pair in FImagens do
  begin
    Pair.Value.Free;
  end;

  for I := 0 to FStrings.Count - 1 do
  begin
    FStrings.Objects[I].Free;
  end;

  FImagens.Free;
  FRegexMonitor.Free;
  inherited;
end;

procedure TAdapterCustomizado.DestroyThreads;
var
  I: Integer;
begin
  // Controladores de status -> Intelocked Incremet(FStatusCancelaSOlicitacao = 1)
  // todo: interlockedIncrement for Android

  FExitRequest := True;
  FSem.Release(THREAD_POOL_SIZE);
  for I := 0 to High(FThreads) do
  begin
    FThreads[I].WaitFor;
    FThreads[I].Free;
  end;
end;

procedure TAdapterCustomizado.DoCreateNewViews;
begin
  inherited;
end;

procedure TAdapterCustomizado.DoResetView(const Item: TListItem);
var
  BitmapDrawable: TListItemImage;
  BackdropDrawable: TListItemImage;
  TextDrawable: TListItemText;
  TextButton: TListItemTextButton;
begin
  if Item.View.Count = 0 then
  begin
    BitmapDrawable := TListItemImage.Create(Item);
    BitmapDrawable.Name := 'bitmap';
    BitmapDrawable.OwnsBitmap := False;
    BitmapDrawable.Bitmap := nil;
    BitmapDrawable.Align := TListItemAlign.Leading;
    BitmapDrawable.ScalingMode := TImageScalingMode.StretchWithAspect;

    BackdropDrawable := TListItemImage.Create(Item);
    BackdropDrawable.Name := 'backdrop';
    BackdropDrawable.OwnsBitmap := False;
    BackdropDrawable.Bitmap := FbackdropImage.Bitmap;
    BackdropDrawable.VertAlign := TListItemAlign.Trailing;
    BackdropDrawable.Align := TListItemAlign.Trailing;
    BackdropDrawable.ScalingMode := TImageScalingMode.Stretch;
    BackdropDrawable.Opacity := 0.25;
    BackdropDrawable.Height := 65;

    TextDrawable := TListItemText.Create(Item);
    TextDrawable.Name := 'title';
    TextDrawable.Text := GetName(Item.Index).ToUpper;
    TextDrawable.Height := 80;
    TextDrawable.Font.Size := 48;
    TextDrawable.TextColor := TAlphaColorRec.Bisque;
    TextDrawable.SelectedTextColor := TAlphaColorRec.White;
    TextDrawable.PlaceOffset.X := 10;
    TextDrawable.PlaceOffset.Y := 10;

    TextDrawable := TListItemText.Create(Item);
    TextDrawable.Name := 'blurb';
    TextDrawable.Text := GetId(Item.Index);
    TextDrawable.Font.Size := 16;
    TextDrawable.TextColor := TAlphaColorRec.White;
    TextDrawable.SelectedTextColor := TAlphaColorRec.White;
    TextDrawable.Align := TListItemAlign.Trailing;
    TextDrawable.VertAlign := TListItemAlign.Trailing;
    TextDrawable.WordWrap := True;
    TextDrawable.Height := 60;
    TextDrawable.PlaceOffset.X := 10;

    TextButton := TListItemTextButton.Create(Item);
    TextButton.Name := 'button';
    TextButton.Text := '。。。';
    TextButton.Align := TListItemAlign.Trailing;
    TextButton.VertAlign := TListItemAlign.Trailing;
    TextButton.Width := 48;
    TextButton.Height := 16;
    TextButton.PlaceOffset.Y := -TextDrawable.Height + TextDrawable.Height/2 - TextButton.Height/2;
    TextButton.PlaceOffset.X := -10;
    TextButton.OnSelect := ButtonClicked;
    TextButton.TagObject := Item; //Owner has been removed, using TagObject to store my parent.

    AddIndex(Item.Index);
  end
  else
    MatchView(Item);
end;

procedure TAdapterCustomizado.DoResetViews(const APurposes: TListItemPurposes);
var
  I: Integer;
begin
  for I := 0 to FStrings.Count - 1 do
    ResetView(TListItem(FStrings.Objects[I]));
  ItemsResize;
end;

function TAdapterCustomizado.GetCount: Integer;
begin
  Result := FStrings.Count;
end;

function TAdapterCustomizado.GetDefaultViewHeight: Integer;
begin
  Result := 33;
end;

function TAdapterCustomizado.GetEnumerator: System.Generics.Collections.TEnumerator<FMX.ListView.Types.TListItem>;
begin
  Result := nil;
end;

function TAdapterCustomizado.GetId(const Index: Integer): string;
var
  M: TMatch;
begin
  Result := string.Empty;
  M := FIdRegex.Match(FStrings[Index]);
  if M.Success then
    Result := M.Groups[1].Value;
end;

function TAdapterCustomizado.GetIndexTitle(const Index: Integer): string;
begin
  Result := '';
end;

function TAdapterCustomizado.GetItem(const Index: Integer): TListItem;

  function CreateItem(pIndex: Integer): TListItem;
  begin
    Result := TListItem.Create(FParent.Adapter, FParent);
    Result.Height := GetDefaultViewHeight;
    Result.Index := pIndex;
  end;

begin
  Result := TListItem(FStrings.Objects[Index]);
  if not Assigned(Result) then
  begin
    Result := CreateItem(Index);
    FStrings.Objects[Index] := Result;
    ResetView(Result);
  end;
end;

function TAdapterCustomizado.GetName(Index: Integer): string;
var
  M: TMatch;
begin
  Result := string.Empty;
  M := FNameRegex.Match(FStrings[Index]);
  if M.Success then
    Result := M.Groups[1].Value;
end;

function TAdapterCustomizado.GetText(const Index: Integer): string;
begin
  Result := GetName(Index);
end;

function TAdapterCustomizado.GetTextButtonDrawable(
  const Index: Integer): TListItemTextButton;
begin
  Result := TListItemTextButton(TListItem(FStrings.Objects[Index]).View.FindDrawable('button'));
end;

function TAdapterCustomizado.GetUri(const Index: Integer): string;
var
  M: TMatch;
begin
  TMonitor.Enter(FRegexMonitor);
  Result := string.Empty;
  M := FUriRegex.Match(FStrings[Index]);
  if M.Success then
  begin
    Result := M.Groups[0].Value;
    Result := M.Groups[1].Value;
  end;
  TMonitor.Exit(FRegexMonitor);
end;

procedure TAdapterCustomizado.ImagesLoaded;
var
  lPair: TPair<Integer, TBitmap>;
  lItem: TListItem;
  BitmapDrawable: TListItemImage;
  TextDrawable: TListItemText;
begin
  for lPair in FImagens do
  begin
    lItem := TListItem(FStrings.Objects[lPair.Key]);
    BitmapDrawable := TListItemImage(lItem.View.FindDrawable('bitmap'));
    if (BitmapDrawable <> nil) and (BitmapDrawable.Bitmap = nil) then
      BitmapDrawable.Bitmap := lPair.Value;

    TextDrawable := TListItemText(lItem.View.FindDrawable('blurb'));
    if TextDrawable <> nil then
    begin
      TextDrawable.Text :=
        Format('%s is %dx%d and has ordinal number %d', [GetName(lPair.Key), lPair.Value.Width, lPair.Value.Height, lPair.Key]);
    end;

    MatchView(lItem);
  end;

  FParent.StopPullRefresh;

  ItemsResize;
  ItemsInvalidate;
end;

function TAdapterCustomizado.IndexOf(const AItem: TListItem): Integer;
begin
  Result := -1;
end;

procedure TAdapterCustomizado.MatchView(const Item: TListItem);
var
  BitmapDrawable: TListItemImage;
  BackdropDrawable: TListItemImage;
  TextDrawable: TListItemText;
  Aspect: Single;
  Width: Single;
begin
  BitmapDrawable := TListItemImage(Item.View.FindDrawable('bitmap'));
  if (BitmapDrawable <> nil) and (BitmapDrawable.Bitmap <> nil) then
  begin
    Width := FParent.Width - FParent.ItemSpaces.Left - FParent.ItemSpaces.Right;
    BitmapDrawable.Width := Width;
    Aspect := Width / BitmapDrawable.Bitmap.Width;
    Item.Height := Round(BitmapDrawable.Bitmap.Height * Aspect + 0.5);

    TextDrawable := TListItemText(Item.View.FindDrawable('blurb'));
    TextDrawable.Width := Width - 100;

    BackdropDrawable := TListItemImage(Item.View.FindDrawable('backdrop'));
    BackdropDrawable.Width := Width;
    BackdropDrawable.PlaceOffset.Y := -10;
  end;
end;

function TAdapterCustomizado.NextIndex: Integer;
begin
  FSem.Acquire;
  if FExitRequest then
    Exit(-1);

  //todo: Intelocked Increment : FIndex

  FCS.Acquire;
  try
    Result := FIndex;
    Inc(FIndex);
  finally
    FCS.Release
  end;
end;

procedure TAdapterCustomizado.OnStringListChange(Sender: TObject);
begin
  ItemsCouldHaveChanged;
  ItemsResize;
  ItemsInvalidate;
end;

procedure TAdapterCustomizado.OnStringListChanging(Sender: TObject);
begin
  ItemsMayChange;
end;

procedure TAdapterCustomizado.SetOnButtonClicked(const Value: TNotifyEvent);
begin
  FOnButtonClick := Value;
end;

end.
