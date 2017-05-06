unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.DateUtils, System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TTransacao = class
  private
    FData: TDateTime;
    FCodigo: Integer;
    FValor: Currency;
  public
    constructor Create(AData: TDateTime; ACodigo: Integer; AValor: Currency);

    function ToString: string; override;

    property Data: TDateTime read FData write FData;
    property Codigo: Integer read FCodigo write FCodigo;
    property Valor: Currency read FValor write FValor;
  end;

  TExibeExtratoMemo = class helper for TMemo
    procedure ListaExtrato(pLista: TObjectList<TTransacao>);
  end;

  TfrmPrincipal = class(TForm)
    memLog: TMemo;
    btnExibeExtrato: TButton;
    fmeTransacoes: TFDMemTable;
    fmeTransacoesDATA: TDateField;
    fmeTransacoesValor: TCurrencyField;
    fmeTransacoesCodigo: TIntegerField;
    btnForDataSet: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure btnExibeExtratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnForDataSetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnExibeExtratoClick(Sender: TObject);
var
  lLista: TObjectList<TTransacao>;
//  lTransacao: TTransacao;
begin
  lLista := TObjectList<TTransacao>.Create;
  lLista.OwnsObjects := True;
  lLista.Add(TTransacao.Create(Now, 0, 0.5));
  lLista.Add(TTransacao.Create(IncHour(Now), 1, 3.5));
  lLista.Add(TTransacao.Create(IncDay(Now), 2, 5000));

//  for lTransacao in lLista do
//  begin
//    memLog.Lines.Add(lTransacao.ToString)
//  end;

  memLog.ListaExtrato(lLista);

  lLista.Free;
end;

{ TTransacao }

constructor TTransacao.Create(AData: TDateTime; ACodigo: Integer;
  AValor: Currency);
begin
  FData := AData;
  FCodigo := ACodigo;
  FValor := AValor;
end;

function TTransacao.ToString: string;
begin
  Result :=
    FCodigo.ToString + ': ' +
      DateTimeToStr(FData) + ' - ' +
        FormatFloat('0.,00', FValor);
end;

{ TExibeExtratoMemo }

procedure TExibeExtratoMemo.ListaExtrato(pLista: TObjectList<TTransacao>);
var
  lTransacao: TTransacao;
begin
  Self.Clear;
  for lTransacao in pLista do
  begin
    Self.Lines.Add(lTransacao.ToString)
  end;
end;

procedure TfrmPrincipal.btnForDataSetClick(Sender: TObject);
var
  i: Integer;
begin
  fmeTransacoes.Open;
  for i:= 0 to 20 do
  begin
    fmeTransacoes.Append;
    fmeTransacoes.FieldByName('DATA').AsDateTime := IncDay(Now, Random(1000));
    fmeTransacoes.FieldByName('VALOR').AsCurrency := Random(1000) + 0.57;
    fmeTransacoes.FieldByName('CODIGO').AsInteger := Random(1000);
    fmeTransacoes.Post;
  end;


  fmeTransacoes.First;
  while not fmeTransacoes.Eof do
  begin
    memLog.Lines.Add(
      fmeTransacoes.FieldByName('Codigo').AsString + ': ' +
      fmeTransacoes.FieldByName('Data').AsString + ' - ' +
      fmeTransacoes.FieldByName('Valor').AsString);

    fmeTransacoes.Next;
  end;


//  fmeTransacoes.ExecutaParaCadaRegistro(
//    procedure (pDataSet: TDataSet)
//    begin
//      memLog.Lines.Add(
//        pDataSet.FieldByName('Codigo').AsString + ': ' +
//        pDataSet.FieldByName('Data').AsString + ' - ' +
//        pDataSet.FieldByName('Valor').AsString);
//    end);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True
end;

end.
