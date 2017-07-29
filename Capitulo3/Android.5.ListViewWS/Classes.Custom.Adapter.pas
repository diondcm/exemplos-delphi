unit Classes.Custom.Adapter;

interface

uses
  FMX.ListView.Adapters.Base, FMX.ListView.Types, System.Classes, FMX.ListView,
  System.Generics.Collections, FMX.Graphics, System.RegularExpressions, System.SyncObjs;

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
    procedure CreateThreads;
    procedure StringListChanging(Sender: TObject);
    procedure StringListChange(Sender: TObject);
    function GetName(const Index: Integer): string;
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
begin

end;

function TcustomAdapter.GetText(const Index: Integer): string;
begin
  Result := GetName(Index);
end;

function TcustomAdapter.GetTextButtonDrawable(const Index: Integer): TListItemTextButton;
begin
  Result := TListItemTextButton(TListItem(FStrings.Objects[Index]).View.FindDrawable('button'));
end;

function TcustomAdapter.IndexOf(const AItem: TListItem): Integer;
begin
  Result := -1;
end;

procedure TcustomAdapter.StringListChange(Sender: TObject);
begin

end;

procedure TcustomAdapter.StringListChanging(Sender: TObject);
begin

end;

end.
