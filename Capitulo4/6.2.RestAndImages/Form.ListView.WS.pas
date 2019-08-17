unit Form.ListView.WS;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.DialogService,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, Classe.Custom.Adapter,
  FMX.Objects;

type
  TfrmListViewWS = class(TForm)
    ToolBar1: TToolBar;
    buttonVoltar: TButton;
    timerLoadImages: TTimer;
    VertScrollBox1: TVertScrollBox;
    LayoutListView: TLayout;
    imgBackDrop: TImage;
    ImageCarrinho: TImage;
    procedure buttonVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure timerLoadImagesTimer(Sender: TObject);
  private
    FTotal: Integer;
    FImagesLoaded: Boolean;
    FStrings: TStringList;
    FListView: TPresentedListView;
    FAdapter: TCustomAdapter;
    procedure PullRefresh(Sender: TObject);
    procedure ButtonClicked(Sender: TObject);
    procedure ImgClicked(Sender: TObject);
    procedure AddItems(pQtd: Integer);
    class var
      FInstance: TfrmListViewWS;
    const
       HOST = 'http://i.imgur.com/';
  public
    class function GetInstance: TfrmListViewWS;
  end;

implementation

{$R *.fmx}

{ TfrmListViewWS }

procedure TfrmListViewWS.AddItems(pQtd: Integer);
const
  CATS: array [0..4] of string =
    ('SpCbHBI.jpg',
     'aMlUpJB.jpg',
     'fmXnXWn.png',
     'IWSnWNt.jpg',
     'QgA69dC.png');

  NAMES: array [0..9] of string =
    ('Molly', 'Charlie', 'Tigger', 'Poppy', 'Oscar', 'Smudge', 'Millie', 'Daisy', 'Max', 'Jasper');

  function NextItemText: string;
  begin
    Result := Format('[%d] [%s] [%s%s]', [FTotal, Names[FTotal mod Length(Names)], Host, Cats[FTotal mod Length(Cats)]]);
    Inc(FTotal);
  end;

var
  i: Integer;
begin
  for i := 0 to pQtd -1 do
  begin
    FStrings.Add(NextItemText);
  end;
end;

procedure TfrmListViewWS.ButtonClicked(Sender: TObject);
var
  lBtn: TObject;
  lText: string;
begin
  lBtn := TListItemTextButton(Sender).TagObject;
  lText := TListItemText(TListItem(lBtn).View.FindDrawable('title')).Text;
  TDialogService.ShowMessage('Foi selecionado: ' + lText);
end;

procedure TfrmListViewWS.buttonVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListViewWS.FormCreate(Sender: TObject);
begin
  FListView := TPresentedListView.Create(Self);
  FListView.ControlType := TControlType.Platform;
  FStrings := TStringList.Create;

  FAdapter := TCustomAdapter.Create(FListView, FStrings);
  FAdapter.BackDropImage := imgBackDrop;
  FAdapter.ImgCar := ImageCarrinho;
  FAdapter.OnButtonClicked := ButtonClicked;
  FAdapter.OnImgClick := ImgClicked;
  FListView.Adapter := FAdapter;

  FListView.Parent := LayoutListView;
  FListView.Align := TAlignLayout.Client;

  FListView.PullToRefresh := True;
  FListView.PullRefreshWait := True;
  FListView.OnPullRefresh := PullRefresh;
end;

procedure TfrmListViewWS.FormDestroy(Sender: TObject);
begin
  FListView.Adapter := nil;
  FAdapter.Free;
  FListView.Free;
  FStrings.Free;
end;

procedure TfrmListViewWS.FormShow(Sender: TObject);
begin
  ImageCarrinho.Visible := False;

  if not FImagesLoaded then
  begin
    FImagesLoaded := True;
    timerLoadImages.Enabled := True;
  end;
end;

class function TfrmListViewWS.GetInstance: TfrmListViewWS;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TfrmListViewWS.Create(Application);
  end;

  Result := FInstance;
end;

procedure TfrmListViewWS.ImgClicked(Sender: TObject);
begin
  TDialogService.ShowMessage('Carriho Clicado');
end;

procedure TfrmListViewWS.PullRefresh(Sender: TObject);
begin
  AddItems(30);
end;

procedure TfrmListViewWS.timerLoadImagesTimer(Sender: TObject);
begin
  timerLoadImages.Enabled := False;
  AddItems(30);
end;

end.
