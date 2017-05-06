unit Data.Categoria;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, Data.FMTBcd,
  Datasnap.Provider, Data.SqlExpr, Data.DB, Datasnap.DBClient, Data.Conexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  [TAtributoGerador('ID', 'GEN_CATEGORIA')]
  TdmdCategoria = class(TdmdBaseCadastro)
    cdsCadastroID: TIntegerField;
    cdsCadastroDESCRICAO: TStringField;
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

uses
  System.Variants;

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
  // Sem fields para configurar
end;

procedure TdmdCategoria.ValidarDadosCadastro;
var
  lErro: string;
  lFocoSetado: Boolean;

  procedure SetaFocus(pField: TField);
  begin
    if not lFocoSetado then
    begin
      pField.FocusControl;
      lFocoSetado := True;
    end;
  end;

begin
  inherited;
  lFocoSetado := False;
  if VarToStr(cdsCadastroDESCRICAO.Value) = '' then // IsNull
  begin
    SetaFocus(cdsCadastroDESCRICAO);
    lErro := sLineBreak + 'Categoria';
    //raise Exception.Create('A Categoria deve ser informada.');
  end;

  if lErro <> '' then
  begin
    raise Exception.Create('Deve ser informado: ' + lErro);
  end;
end;

end.
