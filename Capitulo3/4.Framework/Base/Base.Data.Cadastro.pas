unit Base.Data.Cadastro;

interface

uses
  System.SysUtils, System.Classes, Base.Data, Data.DB, Datasnap.DBClient,
  Data.FMTBcd, Datasnap.Provider, Data.SqlExpr, System.StrUtils, System.Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TMetodoAnonimo = reference to procedure;


  TdmdBaseCadastroClass = class of TdmdBaseCadastro;

  TdmdBaseCadastro = class(TdmdBase)
    cdsCadastro: TClientDataSet;
    sqlCadastro: TSQLDataSet;
    dspCadastro: TDataSetProvider;
    qryCadastro: TFDQuery;
    qryCadastroID: TIntegerField;
    qryCadastroDESCRICAO: TWideStringField;
    qryCadastroATIVO: TBooleanField;
    procedure cdsCadastroAfterPost(DataSet: TDataSet);
    procedure cdsCadastroAfterDelete(DataSet: TDataSet);
    procedure cdsCadastroAfterCancel(DataSet: TDataSet);
  private const
    WHERE_SQL = '/*where*/';
    AND_SQL = '/*and*/';
  private
    procedure AbrirCadastroComCondicao(const pCondicao: string);
    procedure AdicionarCondicao(const pCondicao: string);
    procedure AbrirCadastroComModificacao(const pMetodo: TMetodoAnonimo);
  protected
    procedure ValidarDadosCadastro; virtual; abstract;
    procedure SetarDadosNovoRegistro; virtual; abstract;
  public
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

    procedure Pesquisar(const pTexto: string);
  end;

//var
//  dmdBase1: TdmdBase1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdBaseCadastro.AbrirCadastroComCondicao(const pCondicao: string);
var
  lMetodo: TMetodoAnonimo;
begin
  {$IFDEF DEBUG}
  lMetodo :=
    procedure
    var
      lStl: TStringList;
    begin
      AdicionarCondicao(pCondicao);
      lStl := TStringList.Create;
      try
        lStl.Text := sqlCadastro.CommandText;
        lStl.SaveToFile(sqlCadastro.Name + '.sql');
      finally
        lStl.Free;
      end;
    end;
  {$ELSE}
  lMetodo :=
    procedure
    begin
      AdicionarCondicao(pCondicao);
    end;
  {$ENDIF}

  AbrirCadastroComModificacao(lMetodo);
end;

procedure TdmdBaseCadastro.AbrirCadastroComModificacao(
  const pMetodo: TMetodoAnonimo);
var
  lSQLOriginal: string;
  lSQLOriginalQry: string;
begin
  lSQLOriginal := sqlCadastro.CommandText;
  lSQLOriginalQry := qryCadastro.SQL.Text;
  try
    pMetodo({parametros se existissem});

    cdsCadastro.Close;
    cdsCadastro.Open;
  finally
    sqlCadastro.CommandText := lSQLOriginal;
    qryCadastro.SQL.Text := lSQLOriginalQry;
  end;
end;

procedure TdmdBaseCadastro.AdicionarCondicao(const pCondicao: string);
begin
  if Pos(WHERE_SQL, sqlCadastro.CommandText) > 0 then
  begin
    sqlCadastro.CommandText := StringReplace(sqlCadastro.CommandText, WHERE_SQL,
      ' where (' + pCondicao + ') ' + AND_SQL, []);

    qryCadastro.SQL.Text := StringReplace(sqlCadastro.CommandText, WHERE_SQL,
      ' where (' + pCondicao + ') ' + AND_SQL, []);
  end else if Pos(AND_SQL, sqlCadastro.CommandText) > 0 then
  begin
    sqlCadastro.CommandText := StringReplace(sqlCadastro.CommandText, AND_SQL,
      'and (' + pCondicao + ') ' + AND_SQL, []);

    qryCadastro.SQL.Text := StringReplace(sqlCadastro.CommandText, AND_SQL,
      'and (' + pCondicao + ') ' + AND_SQL, []);
  end;
end;

procedure TdmdBaseCadastro.AlterarRegistro;
begin
  cdsCadastro.Edit;
end;

procedure TdmdBaseCadastro.CancelarRegistro;
begin
  cdsCadastro.Cancel;
end;

procedure TdmdBaseCadastro.cdsCadastroAfterCancel(DataSet: TDataSet);
begin
  inherited;
  cdsCadastro.CancelUpdates;
end;

procedure TdmdBaseCadastro.cdsCadastroAfterDelete(DataSet: TDataSet);
begin
  inherited;
  cdsCadastro.ApplyUpdates(0);
end;

procedure TdmdBaseCadastro.cdsCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  cdsCadastro.ApplyUpdates(0);
end;

procedure TdmdBaseCadastro.ExcluirRegistro;
begin
  cdsCadastro.Delete;
end;

procedure TdmdBaseCadastro.InserirRegistro;
begin
  cdsCadastro.Append; // cdsCadastro.Insert?
end;

procedure TdmdBaseCadastro.IrParaAnterior;
begin
  cdsCadastro.Prior;
end;

procedure TdmdBaseCadastro.IrParaPrimeiro;
begin
  cdsCadastro.First;
end;

procedure TdmdBaseCadastro.IrParaProximo;
begin
  cdsCadastro.Next;
end;

procedure TdmdBaseCadastro.IrParaUltimo;
begin
  cdsCadastro.Last;
end;

procedure TdmdBaseCadastro.Pesquisar(const pTexto: string);
var
  lInteiro: Int64;
  lValorInteiro: Boolean;
  lValorData: Boolean;
  lData: TDateTime;
  lValorReal: Boolean;
  lReal: Double;
  lWhere: string;
  i: Integer;
  lDataType: TFieldType;

  procedure AdicionarCondicaoPesquisa(pField: Tfield; const pCondicao: string; pIgnoreCase: Boolean = False);
  var
    lCampo: string;
  begin
    if lWhere <> '' then
    begin
      lWhere := lWhere + ' or ';
    end;

//    lCampo := IfThen(pField.Origin <> '', pField.Origin, pField.FieldName); // ? :
    if pField.Origin <> '' then
    begin
      lCampo := pField.Origin;
    end else begin
      lCampo := pField.FieldName;
    end;

    if pIgnoreCase {= True} then
    begin
      lCampo := ' UPPER(' + lCampo + ')'; // todo: multi-db do UPPER()
    end;

    lWhere := lWhere + lCampo + ' ' + pCondicao; // Upper adicionado na chamada
    // Com ifThen: IfThen(pIgnoreCase, UpperCase(pCondicao), pCondicao)
  end;

begin
  lValorInteiro := TryStrToInt64(pTexto, lInteiro);
  lValorData := TryStrToDate(pTexto, lData);
  lValorReal := TryStrToFloat(pTexto, lReal);

  lWhere := '';
  for i := 0 to cdsCadastro.Fields.Count -1 do
  begin
    lDataType := cdsCadastro.Fields[i].DataType;
    if lValorInteiro and (lDataType in [ftInteger, ftByte, ftWord, ftShortint]) then
    begin
      AdicionarCondicaoPesquisa(cdsCadastro.Fields[i], ' = ' + pTexto);
    end else if lValorData and (lDataType in [ftDate, ftDateTime, ftTimeStamp, ftTime]) then
    begin
      AdicionarCondicaoPesquisa(cdsCadastro.Fields[i], ' = ' + QuotedStr(pTexto));
    end else if lValorReal and (lDataType in [ftCurrency, ftFloat, ftSingle, ftExtended, ftBCD]) then
    begin
      AdicionarCondicaoPesquisa(cdsCadastro.Fields[i], ' = ' + pTexto);
    end else if (lDataType in [ftString, ftMemo, ftWideString, ftWideMemo]) then
    begin
      AdicionarCondicaoPesquisa(cdsCadastro.Fields[i], ' like ' + QuotedStr('%' + pTexto.ToUpper + '%'), True);
    end;
  end;

  if cdsCadastro.Fields.Count = 0 then
  begin
    raise Exception.Create('Cds sem fields.');
  end;

  if lWhere <> '' then
  begin
    AbrirCadastroComCondicao(lWhere);
  end;
end;

procedure TdmdBaseCadastro.SalvarRegistro;
begin
  cdsCadastro.Post;
end;

function TdmdBaseCadastro.VerificaAlterarRegistro: Boolean;
begin
  Result := (not VerificaEmEdicao) and (not cdsCadastro.IsEmpty); //cdsCadastro.RecordCount = 0?
end;

function TdmdBaseCadastro.VerificaCancelarRegistro: Boolean;
begin
  Result := VerificaEmEdicao;
end;

function TdmdBaseCadastro.VerificaEmEdicao: Boolean;
begin
  Result := cdsCadastro.State in dsEditModes;
end;

function TdmdBaseCadastro.VerificaExcluirRegistro: Boolean;
begin
  Result := (not VerificaEmEdicao) and (not cdsCadastro.IsEmpty);
end;

function TdmdBaseCadastro.VerificaInserirRegistro: Boolean;
begin
  Result := not VerificaEmEdicao;
end;

function TdmdBaseCadastro.VerificaIrParaAnterior: Boolean;
begin
  Result := VerificaIrParaPrimeiro;
end;

function TdmdBaseCadastro.VerificaIrParaPrimeiro: Boolean;
begin
  Result := VerificaNavegacao and (not cdsCadastro.Bof);
end;

function TdmdBaseCadastro.VerificaIrParaProximo: Boolean;
begin
  Result := VerificaIrParaUltimo;
end;

function TdmdBaseCadastro.VerificaIrParaUltimo: Boolean;
begin
  Result := VerificaNavegacao and (not cdsCadastro.Eof);
end;

function TdmdBaseCadastro.VerificaNavegacao: Boolean;
begin
  Result := (cdsCadastro.State = dsBrowse);
end;

function TdmdBaseCadastro.VerificaSalvarRegistro: Boolean;
begin
  Result := VerificaEmEdicao;
end;

end.
