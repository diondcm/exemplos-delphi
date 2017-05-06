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
    cdsCadastroDESCRICAO: TStringField;
    cdsCadastroID: TIntegerField;
    cdsCadastroID_CATEGORIA: TIntegerField;
    cdsCadastroCATEGORIA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
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

{ TdmdProduto }

procedure TdmdProduto.DataModuleCreate(Sender: TObject);
begin
  inherited;
  qryCadastro.Connection := dmdConexao.FDConnection;
end;

procedure TdmdProduto.SetarDadosNovoRegistro;
begin
  inherited;
  // Sem campos para preencher;
end;

procedure TdmdProduto.ValidarDadosCadastro;
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
  if VarToStr(cdsCadastroID_CATEGORIA.Value) = '' then // IsNull
  begin
    SetaFocus(cdsCadastroDESCRICAO);
    lErro := sLineBreak + 'Categoria';
    //raise Exception.Create('A Categoria deve ser informada.');
  end;

  if VarToStr(cdsCadastroDESCRICAO.Value) = '' then // IsNull
  begin
    SetaFocus(cdsCadastroDESCRICAO);
    lErro := lErro + slineBreak + 'Descrição';
    //raise Exception.Create('A Descrição deve ser informada.');
  end;

  if lErro <> '' then
  begin
    raise Exception.Create('Deve ser informado: ' + lErro);
  end;
end;

end.
