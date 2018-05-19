unit Base.Data.Cadastro;

interface

uses
  System.SysUtils, System.Classes, Data.Db;

type
  TdmdBaseCadastro = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    FDataSet: TDataSet;
    procedure ValidarDadosCadastro; virtual; { abstract; }

    procedure SetarDadosNovoRegistro; virtual;

    procedure SetCamposGerador;
  public
    constructor Create(AOwner: TComponent); override;
    procedure OnDataSetBeforePost(DataSet: TDataSet);
    procedure OnDataSetAfterPost(DataSet: TDataSet);
    procedure OnDataSetAfterCancel(DataSet: TDataSet);
    procedure OnDataSetAfterDelete(DataSet: TDataSet);

    function VerificaEmEdicao: Boolean; virtual;
    function VerificaNavegacao: Boolean; virtual;

    function VerificaIrParaPrimeiro: Boolean; virtual;
    function VerificaIrParaUltimo: Boolean; virtual;
    function VerificaIrParaAnterior: Boolean; virtual;
    function VerificaIrParaProximo: Boolean; virtual;

    function VerificaInserirRegistro: Boolean; virtual;
    function VerificaAlterarRegistro: Boolean; virtual;
    function VerificaExcluirRegistro: Boolean; virtual;
    function VerificaSalvarRegistro: Boolean; virtual;
    function VerificaCancelarRegistro: Boolean; virtual;

    procedure IrParaPrimeiro; virtual;
    procedure IrParaUltimo; virtual;
    procedure IrParaProximo; virtual;
    procedure IrParaAnterior; virtual;

    procedure InserirRegistro; virtual;
    procedure AlterarRegistro; virtual;
    procedure ExcluirRegistro; virtual;
    procedure SalvarRegistro; virtual;
    procedure CancelarRegistro; virtual;

    procedure AtualizarDataSet; virtual;

    procedure Pesquisar(const pTexto: string);

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdBaseCadastro }

procedure TdmdBaseCadastro.AlterarRegistro;
begin

end;

procedure TdmdBaseCadastro.AtualizarDataSet;
begin

end;

procedure TdmdBaseCadastro.CancelarRegistro;
begin

end;

constructor TdmdBaseCadastro.Create(AOwner: TComponent);
begin
  inherited;
  FDataset := TDataSet.Create(Self);
end;

procedure TdmdBaseCadastro.DataModuleCreate(Sender: TObject);
begin
  // FDataset := TDataSet.Create(Self)
  // mesmo comportamento que sobreescrever o constructor
end;

procedure TdmdBaseCadastro.ExcluirRegistro;
begin

end;

procedure TdmdBaseCadastro.InserirRegistro;
begin

end;

procedure TdmdBaseCadastro.IrParaAnterior;
begin

end;

procedure TdmdBaseCadastro.IrParaPrimeiro;
begin

end;

procedure TdmdBaseCadastro.IrParaProximo;
begin

end;

procedure TdmdBaseCadastro.IrParaUltimo;
begin

end;

procedure TdmdBaseCadastro.OnDataSetAfterCancel(DataSet: TDataSet);
begin

end;

procedure TdmdBaseCadastro.OnDataSetAfterDelete(DataSet: TDataSet);
begin

end;

procedure TdmdBaseCadastro.OnDataSetAfterPost(DataSet: TDataSet);
begin

end;

procedure TdmdBaseCadastro.OnDataSetBeforePost(DataSet: TDataSet);
begin

end;

procedure TdmdBaseCadastro.Pesquisar(const pTexto: string);
begin

end;

procedure TdmdBaseCadastro.SalvarRegistro;
begin

end;

procedure TdmdBaseCadastro.SetarDadosNovoRegistro;
begin

end;

procedure TdmdBaseCadastro.SetCamposGerador;
begin

end;

procedure TdmdBaseCadastro.ValidarDadosCadastro;
begin

end;

function TdmdBaseCadastro.VerificaAlterarRegistro: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaCancelarRegistro: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaEmEdicao: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaExcluirRegistro: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaInserirRegistro: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaIrParaAnterior: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaIrParaPrimeiro: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaIrParaProximo: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaIrParaUltimo: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaNavegacao: Boolean;
begin

end;

function TdmdBaseCadastro.VerificaSalvarRegistro: Boolean;
begin

end;

end.
