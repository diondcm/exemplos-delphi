unit Base.Form.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.Conexao, Vcl.Buttons, Data.DB, Vcl.Menus, Vcl.Grids, Vcl.DBGrids;

type
  TfrmBasePesquisa = class(TfrmBase)
    pnlPesquisa: TPanel;
    btePesquisa: TButtonedEdit;
    pnlControles: TPanel;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    btnSelecionar: TBitBtn;
    btnCancelar: TBitBtn;
    dbgPesquisa: TDBGrid;
    dtsPesquisa: TDataSource;
    PopupMenu: TPopupMenu;
  private
    FModoSelecao: Boolean;
    procedure AtivarModoSelecao;
  public
    { Public declarations }
  end;

var
  frmBasePesquisa: TfrmBasePesquisa;

implementation

{$R *.dfm}

{ TfrmBasePesquisa }

procedure TfrmBasePesquisa.AtivarModoSelecao;
begin
  FModoSelecao := True;

  /// todo: Actions
  btnSelecionar.Enabled := True;
  btnCancelar.Enabled := True;
end;

end.
