unit Base.Data.Cadastro;

interface

uses
  System.SysUtils, System.Classes, Base.Data, Data.FMTBcd, Datasnap.Provider, Data.SqlExpr, Data.DB, Datasnap.DBClient,
  System.Rtti, System.Variants;

type
  TMetodoAnonimo = reference to procedure;
  //TMetodoAnonimo = TProc


  TEventoObtemGerador = function(const pNomeGerador: string; pIncremento: Byte): Int64 of object;


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

  TdmdBaseCadastro = class(TdmdBase)
    cdsCadastro: TClientDataSet;
    sqlCadastro: TSQLDataSet;
    dspCadastro: TDataSetProvider;
    procedure cdsCadastroAfterPost(DataSet: TDataSet);
    procedure cdsCadastroBeforePost(DataSet: TDataSet);
    procedure cdsCadastroAfterCancel(DataSet: TDataSet);
    procedure cdsCadastroAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
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
    procedure SalvarRegsitro; virtual;
    procedure CancelarRegistro; virtual;

    // pesquisa

  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdBaseCadastro }

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

procedure TdmdBaseCadastro.cdsCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  ValidarDadosCadastro;
  // SetGerador
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

procedure TdmdBaseCadastro.SalvarRegsitro;
begin

end;

procedure TdmdBaseCadastro.SetCamposGerador;
var
  lType: TRttiType;
  lAttr: TCustomAttribute;
  lGerador: TAtributoGerador;
  lStatusReadOnly: Boolean;
  lValor: Int64;
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
