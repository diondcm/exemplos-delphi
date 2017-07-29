unit Classes.Custom.Adapter;

interface

uses
  FMX.ListView.Adapters.Base, FMX.ListView.Types, System.Classes, FMX.ListView,
  System.Generics.Collections, FMX.Graphics, System.RegularExpressions, System.SyncObjs,
  System.SysUtils;

type
  TcustomAdapter = class(TAbstractListViewAdapter,
    IListViewAdapter,
    IListViewTextProvider,
    IListViewTextButtonProvider)
  private
    FParent: TListViewBase;
    FStrings: TStringList;
    FBitmaps: TDictionary<Integer, TBitmap>;
    FUriRegex: TRegEx;
    FNameRegex: TRegEx;
    FIdRegex: TRegEx;
    FRegexMonitor: TObject;
    FRequests: TList<Integer>;
    FCS: TCriticalSection;
    FSem: TSemaphore;
    FExitRequested: Boolean;
    FIndex: Integer;
    FOnButtonClicked: TNotifyEvent;
    procedure CreateThreads;
    procedure DestroyThreads;

    procedure StringListChanging(Sender: TObject);
    procedure StringListChange(Sender: TObject);
    function GetName(const Index: Integer): string;

    procedure ImagesLoaded;
    procedure MatchView(const pItem: TListItem);
    procedure AddItem(Index: Integer);
    function NextItem: Integer;

    function GetId(Index: Integer): string;
    function GetURI(Index: Integer): string;

    procedure ButtonClicked(Sender: TObject);
    procedure SetOnButtonClicked(const Value: TNotifyEvent);

  public
    { IListViewAdapter }
    function GetCount: Integer;
    function GetItem(const Index: Integer): TListItem;
    function IndexOf(const AItem: TListItem): Integer;
    function GetEnumerator: TEnumerator<TListItem>;
    function GetDefaultViewHeight: Integer;

    { IListViewTextProvider }
    function GetText(const Index: Integer): string;
    function GetIndexTitle(const Index: Integer): string;

    { IListViewTextButtonProvider }
    function GetTextButtonDrawable(const Index: Integer): TListItemTextButton;
  public
    constructor Create(const AParent: TListViewBase; const AStrings: TStringList);
  end;

implementation

{ TcustomAdapter }

procedure TcustomAdapter.AddItem(Index: Integer);
begin
  try
    FCS.Acquire;
    FRequests.Add(Index);
    FSem.Release;
  finally
    FCS.Release;
  end;
end;

procedure TcustomAdapter.ButtonClicked(Sender: TObject);
begin
  if Assigned(FOnButtonClicked) then
  begin
    FOnButtonClicked(Sender);
  end;
end;

constructor TcustomAdapter.Create(const AParent: TListViewBase; const AStrings: TStringList);
begin
  inherited Create;
  FParent := AParent;
  FStrings := AStrings;
  FBitmaps := TDictionary<Integer, TBitmap>.Create;
  FUriRegex := TRegEx.Create('\[(http://.*)\]');

  FNameRegex := TRegEx.Create('\[([A-Za-z+)\]');
  FIdRegex := TRegEx.Create('\[([0-9]+)\]');

  FRegexMonitor := TObject.Create;
  FRequests := TList<Integer>.Create;
  FCS := TCriticalSection.Create;
  FSem := TSemaphore.Create(nil, 0, 1000, '');

  CreateThreads;

  // todo: armazenar evento anterior
  FStrings.OnChanging := StringListChanging;
  Fstrings.OnChange := StringListChange;
end;

procedure TcustomAdapter.CreateThreads;
begin

end;

procedure TcustomAdapter.DestroyThreads;
begin

end;

function TcustomAdapter.GetCount: Integer;
begin
  Result := FStrings.Count;
end;

function TcustomAdapter.GetDefaultViewHeight: Integer;
begin
  Result := 33;
end;

function TcustomAdapter.GetEnumerator: TEnumerator<TListItem>;
begin
  Result := nil;
end;

function TcustomAdapter.GetId(Index: Integer): string;
var
  lMatch: TMatch;
begin
  Result := '';
  lMatch := FIdRegex.Match(FStrings[Index]);
  if lMatch.Success then
  begin
    Result := lMatch.Groups[1].Value;
  end;
end;

function TcustomAdapter.GetIndexTitle(const Index: Integer): string;
begin
  Result := '';
end;

function TcustomAdapter.GetItem(const Index: Integer): TListItem;
begin
  Result := TListItem(FStrings.Objects[Index]);
  if not Assigned(Result) then
  begin
    Result := TListItem.Create(FParent.Adapter, FParent);
    Result.Height := GetDefaultViewHeight;
    Result.Index := Index;
    FStrings.Objects[Index] := Result;

    ResetView(Result);
  end;
end;

function TcustomAdapter.GetName(const Index: Integer): string;
var
  lMatches: TMatch;
begin
  Result := string.Empty;// igual a '' // EmptyStr >> evitar usar >> EmptyStr := '0';
  lMatches := FNameRegex.Match(FStrings[Index]);
  if lMatches.Success then
  begin
    Result := lMatches.Groups[1].Value;
  end;
end;

function TcustomAdapter.GetText(const Index: Integer): string;
begin
  Result := GetName(Index);
end;

function TcustomAdapter.GetTextButtonDrawable(const Index: Integer): TListItemTextButton;
begin
  Result := TListItemTextButton(TListItem(FStrings.Objects[Index]).View.FindDrawable('button'));
end;

function TcustomAdapter.GetURI(Index: Integer): string;
var
  lMatch: TMatch;
begin
  TMonitor.Enter(FRegexMonitor);
  Result := '';
  lMatch := FUriRegex.Match(FStrings[Index]);
  if lMatch.Success then
  begin
    Result := lMatch.Groups[0].Value;
    Result := lMatch.Groups[1].Value;
  end;
  TMonitor.Exit(FRegexMonitor);
end;

procedure TcustomAdapter.ImagesLoaded;
var
  lPair: TPair<Integer, TBitmap>;
  lItem: TListItem;
  lBitmapDrawable: TListItemImage;
  lTextDrawable: TListItemText;
begin
  for lPair in FBitmaps do
  begin
    lItem := TListItem(FStrings.Objects[lPair.Key]);
    lBitmapDrawable := TListItemImage(lItem.View.FindDrawable('bitmap'));
    if Assigned(lBitmapDrawable) and (Assigned(lBitmapDrawable.Bitmap)) then
    begin
      lBitmapDrawable.Bitmap := lPair.Value;
    end;

    lTextDrawable := TListItemText(lItem.View.FindDrawable('blurb'));
    if Assigned(lTextDrawable) then
    begin
      lTextDrawable.Text :=
        Format('%s is %dx%d and has ordinal number %d',
        [GetName(lPair.Key), lPair.Value.Width, lPair.Value.Height, lPair.Key]);
    end;

    MatchView(lItem);
  end;

  FParent.StopPullRefresh;
  ItemsResize;
  ItemsInvalidate;
end;

function TcustomAdapter.IndexOf(const AItem: TListItem): Integer;
begin
  Result := -1;
end;

procedure TcustomAdapter.MatchView(const pItem: TListItem);
var
  lBitmapDrawable: TListItemImage;
  lWidth: Single;
  lAspect: Extended;
  lTextDrawable: TListItemText;
  lBackDropImg: TListItemImage;
begin
  lBitmapDrawable := TListItemImage(pItem.View.FindDrawable('bitmap'));
  if Assigned(lBitmapDrawable) and (Assigned(lBitmapDrawable.Bitmap)) then
  begin
    lWidth := FParent.Width - FParent.ItemSpaces.Left - FParent.ItemSpaces.Right;
    lBitmapDrawable.Width := lWidth;
    lAspect := lWidth / lBitmapDrawable.Bitmap.Width;
    pItem.Height := Round(lBitmapDrawable.Bitmap.Height * lAspect + 0.5);

    lTextDrawable := TListItemText(pItem.View.FindDrawable('blurb'));
    lTextDrawable.Width := lWidth - 100;

    lBackDropImg := TListItemImage(pItem.View.FindDrawable('blackdrop'));
    lBackDropImg.Width := lWidth;
    lBackDropImg.PlaceOffset.Y := - 10;
  end;
end;

function TcustomAdapter.NextItem: Integer;
begin
  FSem.Acquire;
  if FExitRequested then
  begin
    // return -1
    Exit(-1);
  end;

  try
    // InterlokedIncrement(FIndex) >> Win32
    // Ele não exejiria Critical section
    FCS.Acquire;
    Result := FIndex;
    Inc(FIndex);
  finally
    FCS.Release;
  end;
end;

procedure TcustomAdapter.SetOnButtonClicked(const Value: TNotifyEvent);
begin
  FOnButtonClicked := Value;
end;

procedure TcustomAdapter.StringListChange(Sender: TObject);
begin

end;

procedure TcustomAdapter.StringListChanging(Sender: TObject);
begin

end;

end.
