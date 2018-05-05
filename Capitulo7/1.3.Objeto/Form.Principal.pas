unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, XPStyleActnCtrls, StdStyleActnCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.Menus,
  Form.Cadastro.Pessoa, Data.DB, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    ActionToolBar1: TActionToolBar;
    BitBtn1: TBitBtn;
    actionCadastroPessoa: TAction;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1teste: TIntegerField;
    procedure actionCadastroPessoaExecute(Sender: TObject);
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

end.
