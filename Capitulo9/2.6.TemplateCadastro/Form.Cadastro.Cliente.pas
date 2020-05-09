unit Form.Cadastro.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.Cliente, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus;

type
  TfrmCadastroCliente = class(TfrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    GeraClientes1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure GeraClientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  inherited;
  DmdDados := TdmdCliente.Create(Self);
end;

{procedure TfrmCadastroCliente.ButtonSalvarClick(Sender: TObject);
var
  lValor: Extended;
begin
  lValor := dtsDados.DataSet.FieldByName('SALDO').AsCurrency;
  if lValor = 0 then
    raise Exception.Create('Obrigatorio informar o Saldo maior que zero.');

  if lValor < 200 then
  begin
    raise Exception.Create('Saldo deve ser maior que R$ 200,00.');
  end;

  if lValor > 20000 then
  begin
    raise Exception.Create('Soldo deve ser menor que R$20.000,00.');
  end;

  dtsDados.DataSet.Post;

  inherited;

end; }


procedure TfrmCadastroCliente.GeraClientes1Click(Sender: TObject);
var
  lQtdStr: string;
begin
  if InputQuery('Qtd de clientes: ', '10000', lQtdStr) then
    (DmdDados as TdmdCliente).GeraClientes(StrToIntDef(lQtdStr, 10000), False);
end;

end.
