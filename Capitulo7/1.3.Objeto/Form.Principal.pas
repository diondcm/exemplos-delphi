unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, XPStyleActnCtrls, StdStyleActnCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.Menus,
  Form.Cadastro.Pessoa, Data.DB, Datasnap.DBClient, Form.REST;

type
  TfrmPrincipal = class(TForm)
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    ActionToolBar1: TActionToolBar;
    BitBtn1: TBitBtn;
    actionCadastroPessoa: TAction;
    buttonREST: TButton;
    actionREST: TAction;
    procedure actionCadastroPessoaExecute(Sender: TObject);
    procedure actionRESTExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.actionCadastroPessoaExecute(Sender: TObject);
begin
  frmCadastroPessoa.Show;
end;

procedure TfrmPrincipal.actionRESTExecute(Sender: TObject);
begin
  frmREST.Show;

end;

end.
