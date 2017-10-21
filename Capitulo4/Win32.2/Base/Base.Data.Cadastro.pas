unit Base.Data.Cadastro;

interface

uses
  System.SysUtils, System.Classes, Base.Data, Data.FMTBcd, Datasnap.Provider, Data.SqlExpr, Data.DB, Datasnap.DBClient,
  System.Rtti, System.Variants, System.StrUtils;

type
  //TMetodoAnonimo = reference to procedure;
  //TMetodoAnonimo = TProc

  TEventoObtemGerador = function(const pNomeGerador: string; pIncremento: Byte): Int64 of object;
  TMetodoModificacao = TProc;

  ///  Exemplo de uso
  ///  [TAtributoGerador('ID_CLIENTE', 'SEQ_CLIENTE')]

  TAtributoGerador = class(TCustomAttribute)
  private
    FNomeField: string;
    FNomeGerador: string;
  public
    constructor Create(const pNomeField, pNomeGerador: string);
    property NomeField: string read FNomeField write FNomeField;
    property NomeGerador: string read FNomeGerador write FNomeGerador;
  end;

  TdmdBaseCadastroClass = class of TdmdBaseCadastro;
  TdmdBaseCadastro = class(TdmdBase)
    cdsCadastro: TClientDataSet;
    sqlCadastro: TSQLDataSet;
    dspCadastro: TDataSetProvider;
    procedure cdsCadastroAfterPost(DataSet: TDataSet);
    procedure cdsCadastroBeforePost(DataSet: TDataSet);
    procedure cdsCadastroAfterCancel(DataSet: TDataSet);
    procedure cdsCadastroAfterDelete(DataSet: TDataSet);
  private const
    WHERE_SQL = '/*WHERE*/';
    AND_SQL = '/*AND*/';
  private
    procedure AbrirCadastroComCondicao(const pCondicao: string);
    procedure AdicionarCondicao(const pCondicao: string);
    procedure AbrirCadastroComModificacao(const pMetodoModificacao: TMetodoModificacao);
  protected
    procedure ValidarDadosCadastro; virtual; abstract;
    procedure SetarDadosNovoRegistro; virtual; abstract; // raise EAbstractError

    procedure SetCamposGerador;

    class var FMetodoGerador: TEventoObtemGerador;
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
    procedure AtualizarDataSet; virtual;


    procedure Pesquisar(const pTexto: string); // TODO: remove Inject SQL

    class property MetodoGerador: TEventoObtemGerador read FMetodoGerador write FMetodoGerador;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdBaseCadastro }

procedure TdmdBaseCadastro.AbrirCadastroComCondicao(const pCondicao: string);
var
  lMetodo: TMetodoModificacao;
begin
  //{$IFDEF DEBUG}
//  {$DEFINE SAVE_SQL}
  {$IFDEF SAVE_SQL}
  lMetodo :=
    procedure
    var
      lStl: TStringList;
    begin
      AdicionarCondicao(pCondicao);

      lStl := TStringList.Create;
      try
        lStl.Text := sqlCadastro.CommandText;
        lStl.SAveToFile(Self.ClassName + '.sql');
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

procedure TdmdBaseCadastro.AbrirCadastroComModificacao(const pMetodoModificacao: TMetodoModificacao);
var
  lSQlOriginal: string;
begin
  lSQlOriginal := sqlCadastro.CommandText;
  try
    pMetodoModificacao; // modifica SQL de acordo com método

    cdsCadastro.Close;
    cdsCadastro.Open;
  finally
    sqlCadastro.CommandText := lSQlOriginal;
  end;
end;

procedure TdmdBaseCadastro.AdicionarCondicao(const pCondicao: string);
begin
  if Pos(WHERE_SQL, sqlCadastro.CommandText) > 0 then
  begin
    sqlCadastro.CommandText := StringReplace(sqlCadastro.CommandText, WHERE_SQL, ' where (' + pCondicao + ')' + AND_SQL, []);
  end else if Pos(AND_SQL, sqlCadastro.CommandText) > 0 then
  begin
    sqlCadastro.CommandText := StringReplace(sqlCadastro.CommandText, AND_SQL, ' and (' + pCondicao + ') ' + AND_SQL, []);
  end;
end;

procedure TdmdBaseCadastro.AlterarRegistro;
begin
  cdsCadastro.Edit;
end;

procedure TdmdBaseCadastro.AtualizarDataSet;
begin
  //cdsCadastro.Refresh;
  cdsCadastro.Close;
  cdsCadastro.Open;
  // todo: tratar abrir com parâmetros
  {$MESSAGE HINT 'Tratar abrir com parâmetros'}
  //{$MESSAGE WARN 'Tratar abrir com parâmetros'}
  //{$MESSAGE ERROR 'Tratar abrir com parâmetros'}
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

procedure TdmdBaseCadastro.cdsCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  ValidarDadosCadastro;
  SetCamposGerador;
end;

procedure TdmdBaseCadastro.ExcluirRegistro;
begin
  cdsCadastro.Delete;
end;

procedure TdmdBaseCadastro.InserirRegistro;
begin
  cdsCadastro.Append;
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

  procedure Teste;
  begin
    // não ve as vars do método Pesquisar;
  end;

var
  lInt: Int64;
  lValorEhInteiro: Boolean;
  lData: TDateTime;
  lValorEhData: Boolean;
  lFloat: Double;
  lValorEhFloat: Boolean;
  i: Integer;
  lWhere: string;
  lDataType: TFieldType;

  //nested methods
  procedure AdicionarCondicaoPesquisa(pField: TField; const pCondicao: string; pIngnoreCase: Boolean = False);
  var
    lCampo: string;
  begin
    if lWhere <> '' then
    begin
      lWhere := lWhere + ' or ';
    end;

    // System.StrUtils, System.Math >> Integers
    lCampo := IfThen(pField.Origin <> '', pField.Origin, pField.FieldName); // ? :
//    if pField.Origin <> '' then
//    begin
//      lCampo := pField.Origin;
//    end else begin
//      lCampo := pField.FieldName;
//    end;

    if pIngnoreCase then { = True}
    begin
      lCampo := ' UPPER(' + lCampo + ')'; // todo: multi-db tratar UPPER()
    end;

    lWhere := lWhere + lCampo + ' ' + pCondicao;
  end;

begin
  if cdsCadastro.FieldCount = 0 then
  begin
    // Assert();
    raise Exception.Create('Cds Sem fields');
  end;

  lValorEhInteiro := TryStrToInt64(pTexto, lInt);
  lValorEhData := TryStrToDate(pTexto, lData);
  lValorEhFloat := TryStrToFloat(pTexto, lFloat);

  lWhere := '';
  for i := 0 to cdsCadastro.FieldCount -1 do
  begin
    lDataType := cdsCadastro.Fields[i].DataType;
    if lValorEhInteiro and (lDataType in [ftInteger, ftByte, ftWord, ftShortint]) then
    begin
      AdicionarCondicaoPesquisa(cdsCadastro.Fields[i], ' = ' + pTexto);
    end else if lValorEhData and (lDataType in [ftDate, ftDateTime, ftTimeStamp, ftTime]) then
    begin
      AdicionarCondicaoPesquisa(cdsCadastro.Fields[i], ' = ' + QuotedStr(pTexto)); // #39 + pTexto + #39
    end else if lValorEhFloat and (lDataType in [ftCurrency, ftFloat, ftSingle, ftExtended, ftBCD]) then
    begin
      AdicionarCondicaoPesquisa(cdsCadastro.Fields[i], ' = ' + pTexto);
    end else if lDataType in [ftString, ftMemo, ftWideString, ftWideMemo] then
    begin
      AdicionarCondicaoPesquisa(cdsCadastro.Fields[i], ' like ' + QuotedStr('%' + pTexto + '%'), True);
    end else begin
      raise Exception.Create('Tipo de dado não tratado no field: ' + cdsCadastro.Fields[i].FieldName); // lDataType.ToString
    end;
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

procedure TdmdBaseCadastro.SetCamposGerador;
var
  lType: TRttiType;
  lAttr: TCustomAttribute;
  lGerador: TAtributoGerador;
  lStatusReadOnly: Boolean;
  lValor: Int64;
  // lRtti: TRttiContext;
begin
  if cdsCadastro.State = dsInsert then
  begin
    lType := TRttiContext.Create.GetType(Self.ClassInfo);
    for lAttr in lType.GetAttributes do
    begin
      if lAttr is TAtributoGerador then
      begin
        lGerador := TAtributoGerador(lAttr);

        lStatusReadOnly := cdsCadastro.FieldByName(lGerador.NomeField).ReadOnly;
        if cdsCadastro.FieldByName(lGerador.NomeField).ReadOnly then
        begin
          cdsCadastro.FieldByName(lGerador.NomeField).ReadOnly := False;
        end;
        try
          //if VarIsEmpty(cdsCadastro.FieldByName(lGerador.NomeField).Value) or
          //  VarIsNull(cdsCadastro.FieldByName(lGerador.NomeField).Value) then

          if VarToStr(cdsCadastro.FieldByName(lGerador.NomeField).Value) = '' then // cdsCadastro.FieldByName(lGerador.NomeField).IsNull ?!
          begin
            if not Assigned(FMetodoGerador) then
            begin
              raise Exception.Create('Método gerador não encontrado.');
            end;

            lValor := FMetodoGerador(lGerador.NomeGerador, 1);
            if lValor > 0 then // 0 para bancos auto inc
              cdsCadastro.FieldByName(lGerador.NomeField).AsLargeInt := lValor;
          end;
        finally
          cdsCadastro.FieldByName(lGerador.NomeField).ReadOnly := lStatusReadOnly;
        end;
      end;
    end;
  end;
end;

function TdmdBaseCadastro.VerificaAlterarRegistro: Boolean;
begin
  Result := (not VerificaEmEdicao) and (not cdsCadastro.IsEmpty); // cdsCadastro.RecordCount = 0
end;

function TdmdBaseCadastro.VerificaCancelarRegistro: Boolean;
begin
  Result := VerificaEmEdicao;
end;

function TdmdBaseCadastro.VerificaEmEdicao: Boolean;
begin
  Result := (cdsCadastro.State in dsEditModes)
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

{ TAtributoGerador }

constructor TAtributoGerador.Create(const pNomeField, pNomeGerador: string);
begin
  FNomeField := pNomeField;
  FNomeGerador := pNomeGerador;
end;

end.
