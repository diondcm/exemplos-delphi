unit Data.Produto;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, Data.FMTBcd,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Data.SqlExpr, Datasnap.DBClient,
  Data.Conexao;

type
  [TAtributoGerador('ID', 'GEN_PRODUTO')]
  TdmdProduto = class(TdmdBaseCadastro)
    qryCadastroID: TIntegerField;
    qryCadastroCODIGO: TIntegerField;
    qryCadastroDESCRICAO: TWideStringField;
    qryCadastroCOR: TIntegerField;
    qryCadastroPESO: TIntegerField;
    cdsCadastroID: TIntegerField;
    cdsCadastroCODIGO: TIntegerField;
    cdsCadastroDESCRICAO: TWideStringField;
    cdsCadastroCOR: TIntegerField;
    cdsCadastroPESO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  protected
    procedure ValidarDadosCadastro; override;
    procedure SetarDadosNovoRegistro; override;
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdProduto }

procedure TdmdProduto.DataModuleCreate(Sender: TObject);
begin
  inherited;
  qryCadastro.Connection := dmdConexao.FDConnection;
end;

procedure TdmdProduto.SetarDadosNovoRegistro;
begin
  inherited;


end;

procedure TdmdProduto.ValidarDadosCadastro;
begin
  inherited;

end;

end.
