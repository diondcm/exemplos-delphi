unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Form.Master.Detail, Vcl.Menus, Form.REST, Form.Exportador;

type
  TfrmPrincipal = class(TForm)
    btnMasterDetail: TButton;
    ActionList1: TActionList;
    actMasterDetail: TAction;
    MainMenu1: TMainMenu;
    Exemplos1: TMenuItem;
    MasterDetail1: TMenuItem;
    btnREST: TButton;
    actREST: TAction;
    btnSerealizador: TButton;
    actSerealizador: TAction;
    procedure actMasterDetailExecute(Sender: TObject);
    procedure actRESTExecute(Sender: TObject);
    procedure actSerealizadorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.actMasterDetailExecute(Sender: TObject);
begin
  frmMAsterDetail.Show;
end;

procedure TfrmPrincipal.actRESTExecute(Sender: TObject);
begin
  frmREST.Show;
end;

procedure TfrmPrincipal.actSerealizadorExecute(Sender: TObject);
begin
  frmExportador.Show;
end;

end.
