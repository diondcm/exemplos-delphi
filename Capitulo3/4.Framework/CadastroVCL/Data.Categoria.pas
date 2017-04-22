unit Data.Categoria;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, Data.FMTBcd,
  Datasnap.Provider, Data.SqlExpr, Data.DB, Datasnap.DBClient, Data.Conexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdCategoria = class(TdmdBaseCadastro)
    cdsCadastroID: TIntegerField;
    cdsCadastroDESCRICAO: TWideStringField;
    cdsCadastroATIVO: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure ValidarDadosCadastro; override;
    procedure SetarDadosNovoRegistro; override;
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdCategoria }

procedure TdmdCategoria.DataModuleCreate(Sender: TObject);
begin
  inherited;
  qryCadastro.Connection := dmdConexao.FDConnection;
end;

procedure TdmdCategoria.SetarDadosNovoRegistro;
begin
  inherited;

end;

procedure TdmdCategoria.ValidarDadosCadastro;
begin
  inherited;

end;

end.
