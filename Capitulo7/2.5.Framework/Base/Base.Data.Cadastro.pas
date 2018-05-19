unit Base.Data.Cadastro;

interface

uses
  System.SysUtils, System.Classes, Data.Db, System.StrUtils;

type
  TMetodoModificacao = reference to procedure; // = TProc

  TdmdBaseCadastro = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    const
      WHERE_SQL = '/* WHERE */';
      AND_SQL = '/* AND */';
  protected
    FDataSet: TDataSet;
    FSQL: TStringList;
    procedure AtribuiSQL; virtual; abstract;

    procedure ValidarDadosCadastro; virtual; { abstract; }

    procedure SetarDadosNovoRegistro; virtual;

    procedure SetCamposGerador;
    // todo: na sequencia com RTTi

    procedure AbrirCadastroComCondicao(const pCondicao: string);
    procedure AdicionarCondicao(const pCondicao: string);
    procedure AbrirCadastroComModificacao(const pMetodoModificacao: TMetodoModificacao);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
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
    property DataSet: TDataSet read FDataSet write FDataSet;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdBaseCadastro }

procedure TdmdBaseCadastro.AbrirCadastroComCondicao(const pCondicao: string);
var
  lMetodo: TMetodoModificacao;
begin
  lMetodo :=
    procedure
    begin
      AdicionarCondicao(pCondicao);
    end;

  AbrirCadastroComModificacao(lMetodo);
end;

procedure TdmdBaseCadastro.AbrirCadastroComModificacao(const pMetodoModificacao: TMetodoModificacao);
var
  lSQLOriginal: string;
begin
  lSQLOriginal := FSQL.Text;
  try
    pMetodoModificacao;

    FDataSet.Close;
    AtribuiSQL;
    FDataSet.Open;

  finally
    FSQL.Text := lSQLOriginal;
  end;
end;

procedure TdmdBaseCadastro.AdicionarCondicao(const pCondicao: string);
begin
  if pCondicao <> '' then
  begin
    if (Pos(WHERE_SQL, FSQL.Text.ToUpper) > 0) then
    begin
      FSQL.Text := StringReplace(FSQL.Text, WHERE_SQL, ' where (' + pCondicao + ')' + AND_SQL, [rfIgnoreCase]);
    end else if (Pos(AND_SQL, FSQL.Text.ToUpper) > 0) then
    begin
      FSQL.Text := StringReplace(FSQL.Text, AND_SQL, ' and (' + pCondicao + ')' + AND_SQL, [rfIgnoreCase]);
    end;
  end;
end;

procedure TdmdBaseCadastro.AlterarRegistro;
begin
  FDataSet.Edit;
end;

procedure TdmdBaseCadastro.AtualizarDataSet;
begin
  //FDataSet.Refresh;

  FDataSet.Close;
  FDataSet.Open;

  {$MESSAGE HINT 'Tratar abrir com parâmetros'}
  //{$MESSAGE WARN 'Tratar abrir com parâmetros'}
  //{$MESSAGE ERROR 'Tratar abrir com parâmetros'}
end;

procedure TdmdBaseCadastro.CancelarRegistro;
begin
  FDataSet.Cancel;
end;

constructor TdmdBaseCadastro.Create(AOwner: TComponent);
begin
  inherited;
  //FDataset := TDataSet.Create(Self);
  FSQL := TStringList.Create;
end;

procedure TdmdBaseCadastro.DataModuleCreate(Sender: TObject);
begin
  // FDataset := TDataSet.Create(Self)
  // mesmo comportamento que sobreescrever o constructor
end;

destructor TdmdBaseCadastro.Destroy;
begin
  FSQL.Free;
  inherited;
end;

procedure TdmdBaseCadastro.ExcluirRegistro;
begin
  FDataSet.Delete;
end;

procedure TdmdBaseCadastro.InserirRegistro;
begin
  FDataSet.Append;
end;

procedure TdmdBaseCadastro.IrParaAnterior;
begin
  FDataSet.Prior;
end;

procedure TdmdBaseCadastro.IrParaPrimeiro;
begin
  FDataSet.First;
end;

procedure TdmdBaseCadastro.IrParaProximo;
begin
  FDataSet.Next;
end;

procedure TdmdBaseCadastro.IrParaUltimo;
begin
  FDataSet.Last;
end;

procedure TdmdBaseCadastro.OnDataSetAfterCancel(DataSet: TDataSet);
begin
  // todo: executar cancel updates
end;

procedure TdmdBaseCadastro.OnDataSetAfterDelete(DataSet: TDataSet);
begin
  // todo: executar apply updates
end;

procedure TdmdBaseCadastro.OnDataSetAfterPost(DataSet: TDataSet);
begin
  // todo: executar apply updates
end;

procedure TdmdBaseCadastro.OnDataSetBeforePost(DataSet: TDataSet);
begin
  ValidarDadosCadastro;
  SetCamposGerador;
end;

procedure TdmdBaseCadastro.Pesquisar(const pTexto: string);
var
  lWhere: string;
  lValorEhInteiro: Boolean;
  lInt: Int64;
  lDate: TDateTime;
  lValorEhData: Boolean;
  lValorEhFloat: Boolean;
  lFloat: Extended;
  i: Integer;
  lDataType: TFieldType;

  procedure AdicionaCondicaoPesquisa(pField: TField; const pCondicao: string; pIgnoreCase: Boolean = False);
  var
    lCampo: string;
  begin
    if lWhere <> '' then
    begin
      lWhere := lWhere + ' or ';
    end;

    // ? :
    lCampo := ifThen(pField.Origin <> '', pField.Origin, pField.FieldName);
    if pIgnoreCase then { Evitar: = True }
    begin
      // não é multi-banco
      // FB: UPPER
      lCampo := ' UCASE(' + lCampo + ')';
    end;

    lWhere := lWhere + lCampo + ' ' + pCondicao;
  end;

begin
//  Assert(FDataSet.FieldCount = 0, 'DataSet "' + FDataSet.Name + '" sem fields.');
//  ou
  if FDataSet.FieldCount = 0 then
  begin
    raise Exception.Create('DataSet "' + FDataSet.Name + '" sem fields.');
  end;

  if pTexto <> '' then
  begin
  //    NÃO USAR:
  //    try
  //      StrToInt(pTexto);
  //      lValorEhInteiro := True;
  //    except
  //      lValorEhInteiro := False;
  //    end;
    lValorEhInteiro := TryStrToInt64(pTexto, lInt);
    lValorEhData := TryStrToDate(pTexto, lDate);
    lValorEhFloat := TryStrToFloat(pTexto, lFloat);

    for i := 0 to {Pred()}FDataSet.FieldCount -1  do
    begin
      lDataType := FDataSet.Fields[i].DataType;
      if lValorEhInteiro and (lDataType in [ftInteger, ftByte, ftWord, ftShortint]) then
      begin
        AdicionaCondicaoPesquisa(FDataSet.Fields[i], ' = ' + pTexto);
      end else if lValorEhData and (lDataType in [ftDate, ftDateTime, ftTimeStamp, ftTime]) then
      begin
        AdicionaCondicaoPesquisa(FDataSet.Fields[i], ' = ' + QuotedStr(pTexto)); // #39 + pTexto + #39 // '''' + pTexto + '''';
      end else if lValorEhFloat and (lDataType in [ftCurrency, ftFloat, ftSingle, ftExtended, ftBCD]) then
      begin
        AdicionaCondicaoPesquisa(FDataSet.Fields[i], ' = ' + pTexto);
      end else if lDataType in [ftString, ftMemo, ftWideString, ftWideMemo] then
      begin
        AdicionaCondicaoPesquisa(FDataSet.Fields[i], ' like ' + QuotedStr('%' + pTexto + '%'));
      end else begin
        // revalidados tipos, por considerar as conversões também
        if not(lDataType in [ftInteger, ftByte, ftWord, ftShortint, ftDate, ftDateTime, ftTimeStamp, ftTime, ftCurrency, ftFloat, ftSingle, ftExtended, ftBCD, ftString, ftMemo, ftWideString, ftWideMemo]) then
        begin
          raise Exception.Create('Tipo de dado não tratado no field: ' +
            FDataSet.Name + '.' + FDataSet.Fields[i].FieldName + '(' +
              IntToStr(Ord(lDataType)) + ')');
        end;
      end;
    end;
  end;

  AbrirCadastroComCondicao(lWhere);
end;

procedure TdmdBaseCadastro.SalvarRegistro;
begin
  FDataSet.Post;
end;

procedure TdmdBaseCadastro.SetarDadosNovoRegistro;
begin
  // Implementar nos filhos
end;

procedure TdmdBaseCadastro.SetCamposGerador;
begin

end;

procedure TdmdBaseCadastro.ValidarDadosCadastro;
begin
  // Implementado nos filhos
end;

function TdmdBaseCadastro.VerificaAlterarRegistro: Boolean;
begin
  Result := (not VerificaEmEdicao) and (not FDataSet.IsEmpty);
  // RecordCount é uma proc, mais lenta que isEmpty(funciona para closed também)
end;

function TdmdBaseCadastro.VerificaCancelarRegistro: Boolean;
begin
  Result := VerificaEmEdicao;
end;

function TdmdBaseCadastro.VerificaEmEdicao: Boolean;
begin
  Result := (FDataSet.State in dsEditModes);
end;

function TdmdBaseCadastro.VerificaExcluirRegistro: Boolean;
begin
  Result := (not VerificaEmEdicao) and (not FDataSet.IsEmpty);
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
  Result := VerificaNavegacao and (not FDataSet.Bof);
end;

function TdmdBaseCadastro.VerificaIrParaProximo: Boolean;
begin
  Result := VerificaIrParaUltimo;
end;

function TdmdBaseCadastro.VerificaIrParaUltimo: Boolean;
begin
  Result := VerificaNavegacao and (not FDataSet.Eof);
end;

function TdmdBaseCadastro.VerificaNavegacao: Boolean;
begin
  Result := (FDataSet.State = dsBrowse);
end;

function TdmdBaseCadastro.VerificaSalvarRegistro: Boolean;
begin
  Result := VerificaEmEdicao;
end;

end.
