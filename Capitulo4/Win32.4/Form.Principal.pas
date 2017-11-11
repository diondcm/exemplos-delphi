unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Generics.Collections, Vcl.ComCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.DateUtils, Vcl.Grids, Vcl.DBGrids,
  Classe.Helper.DataSet, Classe.Atributo.Serealizacao, System.Rtti, Classe.Atributo.Arquivo, Classe.Serealizador.Objeto;

type
  [TAtrSerealizacaoTabela('TRANSACAO')]
  TTransacao = class
  private
    [TAtrSerealizacaoField('CODIGO')][TAtributoCampoInteger(2, 6)]
    FCodigo: Cardinal;

    [TAtrSerealizacaoField('VALOR')][TAtributoCampo(3, 10, TAlinhamentoCampo.Direita, '0')]
    FValor: Currency;

    [TAtributoCampoString(4, 50)]
    FNroNSU: string;

    [TAtributoCampoInteger(5, 15)]
    FIDTransacao: Int64;

    [TAtributoCampoString(6, 2)]
    FFiller: string;

    [TAtributoCampoInteger(7, 3)]
    FBancoDestino: string;

    [TAtrSerealizacaoField('DATA'), TAtributoCampoData(1, 10)] // TAtributoCampo(1, 10, TAlinhamentoCampo.Esquerda, ' ')
    FData: TDate;
  public
    constructor Create(AData: TDate; ACodigo: Integer; AValor: Currency);

    function ToString: string; override;

    property Data: TDate read FData write FData;
    property Codigo: Cardinal read FCodigo write FCodigo;
    property Valor: Currency read FValor write FValor;
    property NroNSU: string read FNroNSU write FNroNSU;
  end;

  TExibeExtratoMemo = class helper for TMemo
    procedure ImprimeListaTransacoes(pLista: TObjectList<TTransacao>);
  end;

  TfrmPrincipal = class(TForm)
    memoExtrato: TMemo;
    buttonExtrato: TBitBtn;
    buttonAddTransacao: TBitBtn;
    buttonGerarTrs: TBitBtn;
    editCodigo: TEdit;
    editValor: TEdit;
    dateData: TDateTimePicker;
    StatusBar: TStatusBar;
    TimerStatus: TTimer;
    memTransacoes: TFDMemTable;
    memTransacoesDATA: TDateField;
    memTransacoesVALOR: TCurrencyField;
    memTransacoesCODIGO: TIntegerField;
    gridTransacoes: TDBGrid;
    dtsTransacoes: TDataSource;
    buttonAplicar: TBitBtn;
    buttonCarregaObjs: TBitBtn;
    buttomGeraArquivo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure buttonAddTransacaoClick(Sender: TObject);
    procedure buttonExtratoClick(Sender: TObject);
    procedure TimerStatusTimer(Sender: TObject);
    procedure buttonGerarTrsClick(Sender: TObject);
    procedure buttonAplicarClick(Sender: TObject);
    procedure buttonCarregaObjsClick(Sender: TObject);
    procedure buttomGeraArquivoClick(Sender: TObject);
  private
    FTransacoes: TObjectList<TTransacao>;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TTransacao }

constructor TTransacao.Create(AData: TDate; ACodigo: Integer; AValor: Currency);
var
  lGuid: TGUID;
  lBanco: string;
begin
  FData := AData;
  FCodigo := ACodigo;
  FValor := AValor;
  CreateGUID(lGuid);
  FNroNSU := GUIDToString(lGuid);
  FIDTransacao := Random(1000000000);
  lBanco := Random(999).ToString;
  FBancoDestino := StringofChar('0', 3 - lBanco.Length) + lBanco;
end;

function TTransacao.ToString: string;
begin
  Result :=
    FCodigo.ToString + ': ' + DateTimeToStr(FData) + ' - ' + FormatFloat('0.,00', FValor);
end;

procedure TfrmPrincipal.buttomGeraArquivoClick(Sender: TObject);
var
  lTr: TTransacao;
  lStl: TStringList;
begin
//  if FTransacoes.Count = 0 then
//    raise Exception.Create('Primeiro carrega as transações.');

  buttonGerarTrs.Click;
  buttonCarregaObjs.Click;

  lStl := TStringList.Create;
  try
    for lTr in FTransacoes do
    begin
      lStl.Add(TSerealizadorObjeto.AsTexto(lTr));
    end;
    lStl.SaveToFile('Transacoes.txt');
  except
    on E: Exception do
    begin
      lStl.Free;
      raise Exception.Create('Erroao exportar arquivo.' + sLineBreak + E.QualifiedClassName + ' - ' + E.Message);
    end;
  end;

  lStl.Free;
end;

procedure TfrmPrincipal.buttonAddTransacaoClick(Sender: TObject);
begin
  FTransacoes.Add(TTransacao.Create(dateData.Date, StrToInt(editCodigo.Text), StrToCurr(editValor.Text)));
  StatusBar.Panels[0].Text := 'Adicionada';
  TimerStatus.Enabled := True;
end;

procedure TfrmPrincipal.buttonAplicarClick(Sender: TObject);
begin
  (*  for mem Trasacao + 5%  *)

//  memTransacoes.ForEach (applica 5 %);
  memTransacoes.ForEach(
    procedure (pDataSet: TDataSet)
    begin
      pDataSet.Edit;
      pDataSet.FieldByName('VALOR').AsCurrency := pDataSet.FieldByName('VALOR').AsCurrency * 1.05;
      pDataSet.Post;
    end);

//  memTransacoes.First;
//  for i := 0 to memTransacoes.RecordCount -1 do
//  begin
    // delete
//  end;

//  memTransacoes.First; // em comum
//  while not memTransacoes.Eof do
//  begin
    // obrigado next
//    memTransacoes.Next;
//  end;
end;

procedure TfrmPrincipal.buttonCarregaObjsClick(Sender: TObject);
var
  lTTr: TTransacao;
  lType: TRttiType;
  lField: TRttiField;
  lAtr: TCustomAttribute;
  lVal: TValue;
begin
  lType := TRttiContext.Create.GetType(TTransacao.ClassInfo);

  memTransacoes.First;
  while not memTransacoes.Eof do
  begin
      lTTr:= TTransacao.Create(0, 0, 0);
      // todo: dictionary para armazenar referencias dos fields
      for lField in lType.GetDeclaredFields do
      begin
        for lAtr in lField.GetAttributes do
        begin
          if lAtr is TAtrSerealizacaoField then
          begin
            case memTransacoes.FieldByName(TAtrSerealizacaoField(lAtr).Field).DataType of
              ftCurrency: lVal := memTransacoes.FieldByName(TAtrSerealizacaoField(lAtr).Field).AsCurrency;
              ftDate, ftDateTime: lVal := memTransacoes.FieldByName(TAtrSerealizacaoField(lAtr).Field).AsDateTime;
              ftInteger: lVal := memTransacoes.FieldByName(TAtrSerealizacaoField(lAtr).Field).AsInteger;
            end;

            lField.SetValue(lTTr, lVal);
          end;
        end;
      end;
      FTransacoes.Add(lTTr);

    memTransacoes.Next;
  end;

end;

procedure TfrmPrincipal.buttonExtratoClick(Sender: TObject);
//var
//  lTr: TTransacao;
begin
  memoExtrato.ImprimeListaTransacoes(FTransacoes);

//  memoExtrato.Lines.Clear;
//  for lTr in FTransacoes do
//  begin
//     transações acima de 200 - negrito
//     transações de 20 dias atrás, fica em cinza claro
//
//    memoExtrato.Lines.Add(lTr.ToString);
//    memoExtrato.Lines.Add('');
//  end;
end;

procedure TfrmPrincipal.buttonGerarTrsClick(Sender: TObject);
var
  i: Integer;
begin
  memTransacoes.Open;

  for i := 0 to 99 do
  begin
    memTransacoes.Append;
    memTransacoesDATA.Value := IncDay(Now, Random(10));
    memTransacoesCODIGO.Value := Random(100000);
    memTransacoesVALOR.Value := Random(10000)/(Random(10000) + 1);
    memTransacoes.Post;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FTransacoes := TObjectList<TTransacao>.Create;
  FTransacoes.OwnsObjects := True;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FTransacoes.Free;
end;

procedure TfrmPrincipal.TimerStatusTimer(Sender: TObject);
begin
  TimerStatus.Enabled := False;
  StatusBar.Panels[0].Text := '';
end;

{ TExibeExtratoMemo }

procedure TExibeExtratoMemo.ImprimeListaTransacoes(pLista: TObjectList<TTransacao>);
var
  lTr: TTransacao;
begin
  Self.Clear;
  for lTr in pLista do
  begin
    // transações acima de 200 - negrito
    // transações de 20 dias atrás, fica em cinza claro

    Self.Lines.Add(lTr.ToString);
    Self.Lines.Add('');
  end;
end;

end.
