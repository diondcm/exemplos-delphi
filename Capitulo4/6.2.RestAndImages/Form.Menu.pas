unit Form.Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, Form.RESTGetImage, Form.JSONFromRest, Form.Get.Dados, Form.Notification, Classe.Intent.Email,
  Form.Intents, Form.ListView.WS;

type
  TfrmMenu = class(TForm)
    GridPanelLayout: TGridPanelLayout;
    buttonImagemFromRest: TButton;
    Image1: TImage;
    buttonJSONFromRest: TButton;
    ButtonGetDados: TButton;
    buttonNotifications: TButton;
    buttonIntent: TButton;
    buttonCustomAdapter: TButton;
    procedure buttonImagemFromRestClick(Sender: TObject);
    procedure buttonJSONFromRestClick(Sender: TObject);
    procedure ButtonGetDadosClick(Sender: TObject);
    procedure buttonNotificationsClick(Sender: TObject);
    procedure buttonIntentClick(Sender: TObject);
    procedure buttonCustomAdapterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.fmx}

procedure TfrmMenu.buttonCustomAdapterClick(Sender: TObject);
begin
  TfrmListViewWS.GetInstance.Show;
end;

procedure TfrmMenu.ButtonGetDadosClick(Sender: TObject);
begin
  TfrmGetDados.GetInstance.Show;
end;

procedure TfrmMenu.buttonImagemFromRestClick(Sender: TObject);
begin
//  TfrmRESTGetImage.Create(Application).Show;
  TfrmRESTGetImage.GetInstance.Show;
end;

procedure TfrmMenu.buttonIntentClick(Sender: TObject);
begin
  TfrmIntent.GetInstance.Show;
end;

procedure TfrmMenu.buttonJSONFromRestClick(Sender: TObject);
begin
  TfrmJSONFromRest.GetInstance.Show;
end;

procedure TfrmMenu.buttonNotificationsClick(Sender: TObject);
begin
  TfrmNotifications.GetInstance.Show;
end;

end.
