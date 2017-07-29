unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects,
  FMX.ListView, Classes.Custom.Adapter, FMX.ListView.Types;

type
  TfrmPrincipal = class(TForm)
    LayoutListView: TLayout;
    tmrLoadImages: TTimer;
    imgBackDrop: TImage;
    procedure tmrLoadImagesTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FTotal: Integer;
    FImagesLoaded: Boolean;
    FListView: TPresentedListView;
    FStrings: TStringList;
    FAdapter: TCustomAdapter;
    procedure ButtonClicked(Sender: TObject);
    procedure PullRefresh(Sender: TObject);
    procedure AddItems(Qtd: Integer);
  public const
    HOST = 'http://i.imgur.com/';
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.AddItems(Qtd: Integer);
const
  Cats: array [0..4] of string =
    ('SpCbHBI.jpg',
     'aMlUpJB.jpg',
     'fmXnXWn.png',
     'IWSnWNt.jpg',
     'QgA69dC.png');

  Names: array [0..9] of string =
    ('Molly', 'Charlie', 'Tigger', 'Poppy', 'Oscar', 'Smudge', 'Millie', 'Daisy', 'Max', 'Jasper');

  function NextItemText: string;
  begin
    Result := Format('[%d] [%s] [%s%s]', [FTotal, Names[FTotal mod Length(Names)], Host, Cats[FTotal mod Length(Cats)]]);
    Inc(FTotal);
  end;

var
  i: Integer;
begin
  for i := 0 to Qtd - 1 do
  begin
    FStrings.Add(NextItemText);
  end;
end;

procedure TfrmPrincipal.ButtonClicked(Sender: TObject);
var
  lBtn: TObject;
  lText: string;
begin
  lBtn := TListItemTextButton(Sender).TagObject;
  lText := TListItemText(TListItem(lBtn).View.FindDrawable('title')).Text;
  ShowMessage(lText + ' says Hi!');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FListView := TPresentedListView.Create(Self);
  FListView.ControlType := TControlType.Platform;

  FStrings := TStringList.Create;

  FAdapter := TCustomAdapter.Create(FListView, FStrings);
  FAdapter.BackDropImage := imgBackDrop;
  FAdapter.OnButtonClicked := ButtonClicked;
  FListView.Adapter := FAdapter;

  FListView.Parent := LayoutListView;
  FListView.Align := TAlignLayout.Client;

  FListView.PullToRefresh := True;
  FListView.PullRefreshWait := True;
  FListView.OnPullRefresh := PullRefresh;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FListView.Adapter := nil;
  FAdapter.Free;
  FListView.Free;
  FStrings.Free;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if not FImagesLoaded then
  begin
    FImagesLoaded := True;
    tmrLoadImages.Enabled := True;
  end;
end;

procedure TfrmPrincipal.PullRefresh(Sender: TObject);
begin
  AddItems(30);
end;

procedure TfrmPrincipal.tmrLoadImagesTimer(Sender: TObject);
begin
  tmrLoadImages.Enabled := False;
  AddItems(30);
end;

end.
