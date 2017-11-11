unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Form.QRCode, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Form.Maps, Form.Error;

type
  TfrmPrincipal = class(TForm)
    ActionList: TActionList;
    ExibeQRCode: TAction;
    PopupMenu: TPopupMenu;
    MainMenu: TMainMenu;
    buttonQRCode: TBitBtn;
    Cadastros1: TMenuItem;
    QRCode1: TMenuItem;
    QRCode2: TMenuItem;
    ExibeMapas: TAction;
    buttonMapas: TBitBtn;
    Mapas1: TMenuItem;
    Maps1: TMenuItem;
    ExibeError: TAction;
    buttonErrorTypes: TBitBtn;
    ErrorTypes1: TMenuItem;
    ErrorTypes2: TMenuItem;
    procedure ExibeQRCodeExecute(Sender: TObject);
    procedure ExibeMapasExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExibeErrorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ExibeErrorExecute(Sender: TObject);
begin
  frmError.Show;
end;

procedure TfrmPrincipal.ExibeMapasExecute(Sender: TObject);
begin
  frmMaps.Show;
end;

procedure TfrmPrincipal.ExibeQRCodeExecute(Sender: TObject);
begin
  frmQRCode.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
