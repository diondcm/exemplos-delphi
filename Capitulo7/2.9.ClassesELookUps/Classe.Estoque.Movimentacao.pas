unit Classe.Estoque.Movimentacao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Forms, Classe.Estoque, Generics.Collections;

type
  TMovimentacao = class
  private class var
    FMovimentacoes: TObjectList<TMovimentacao>;
  private
    FID: Integer;
    FIDEstoque: Integer;
    FEstoque: TEstoque;
    FData: TDateTime;
    class function GetMovimentacoes: TObjectList<TMovimentacao>; static;
    function GetEstoque: TEstoque;
  protected
    class constructor Create;
    class destructor Destroy;
    procedure Carregar(pDts: TDataset);
  public
    constructor Create(pID: Integer);
    property ID: Integer read FID write FID;
    property IDEstoque: Integer read FIDEstoque write FIDEstoque;
    property Estoque: TEstoque read GetEstoque write FEstoque;
    property Data: TDateTime read FData write FData;
    class property Movimentacoes: TObjectList<TMovimentacao> read GetMovimentacoes;
    // Proprio tipo de lista, com tratamentos específicos
  end;

  TdmdMovimentacao = class(TDataModule)
    qryMovimentacao: TFDQuery;
    memMovimentacao: TFDMemTable;
    memMovimentacaoID: TIntegerField;
    memMovimentacaoID_ESTOQUE: TIntegerField;
    memMovimentacaoDATA_MOVIMENTACAO: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  private class var
    FInstancia: TdmdMovimentacao;
  private
    class function GetInstancia: TdmdMovimentacao; static;
  public
    class property Instancia: TdmdMovimentacao read GetInstancia write FInstancia;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdMovimentacao }

procedure TdmdMovimentacao.DataModuleCreate(Sender: TObject);
begin
  memMovimentacao.Open;
end;

class function TdmdMovimentacao.GetInstancia: TdmdMovimentacao;
begin
  if not Assigned(TdmdMovimentacao.FInstancia) then
  begin
    TdmdMovimentacao.FInstancia := TdmdMovimentacao.Create(Application);
  end;

  Result := TdmdMovimentacao.FInstancia;
end;

{ TMovimentacao }

procedure TMovimentacao.Carregar(pDts: TDataset);
begin
  FID := pDts.FieldByName('ID').AsInteger;
  FIDEstoque := pDts.FieldByName('ID_ESTOQUE').AsInteger;
  FData := pDts.FieldByName('DATA').AsDateTime;
end;

class constructor TMovimentacao.Create;
begin
  TMovimentacao.FMovimentacoes := TObjectList<TMovimentacao>.Create;
end;

constructor TMovimentacao.Create(pID: Integer);
begin
  ///  Primeira maneira de lasy-loading
  ///  Não instanciamos o Estoque, será instanciado por singleton
  FEstoque := nil; // não precisa dixar isso para produção, default já é nil

  ///  Segunda maneira de lasy-loading
  ///  Instanciamos, mas não populamos
  FEstoque := TEstoque.Create(0);

  if pID <> 0 then
  begin
    TdmdMovimentacao.GetInstancia.qryMovimentacao.Close;
    TdmdMovimentacao.GetInstancia.qryMovimentacao.ParamByName('id_movimentacao').AsInteger := pID;
    TdmdMovimentacao.GetInstancia.qryMovimentacao.Open;

    // Terceira maneira, sem lasy-loading, carrega direto todas as informações de Estoque
    // Código sentro do Carregar()

    // Quarta maneira, a classe estoque, é quem controla o lasy-loading
    // implementado dentro da classe estoque para exemplo
    if not TdmdMovimentacao.GetInstancia.qryMovimentacao.IsEmpty then
    begin
      Carregar(TdmdMovimentacao.GetInstancia.qryMovimentacao);
    end;
    TdmdMovimentacao.GetInstancia.qryMovimentacao.Close;
  end;
end;

class destructor TMovimentacao.Destroy;
begin
  TMovimentacao.FMovimentacoes.Free;
end;

function TMovimentacao.GetEstoque: TEstoque;
begin
  ///  Primeira maneira de lasy-loading
  if not Assigned(FEstoque) then
  begin
    // classe carrega agora
    FEstoque := TEstoque.Create(FIDEstoque);
  end else begin
    ///  Segunda maneira de lasy-loading, já existe, apenas carrega
    FEstoque.CarregaEstoque(FIDEstoque);
  end;

  // Terceira maneira, SEM lasy-loading, carrega direto todas as informações de Estoque
  // Aqui não faz nada, ja carregou

  // Quarta maneira, a classe estoque, é quem controla o lasy-loading
  // Aqui não faz nada
  Result := FEstoque;
end;

class function TMovimentacao.GetMovimentacoes: TObjectList<TMovimentacao>;
var
  lMov: TFDMemTable;
  lM: TMovimentacao;
begin
  { Invalidar o cache de objetos, caso altere o banco }
  if TMovimentacao.FMovimentacoes.Count = 0 then
  begin
    lMov := TdmdMovimentacao.Instancia.memMovimentacao; { buscar a query no DB }
    lMov.First;
    while not lMov.Eof do
    begin
      lM := TMovimentacao.Create(0 {, Parametro para não carregar quando vem da lista, pois já temos os dados na query } );
      lM.FID := lMov.FieldByName('ID').AsInteger;
      lM.FIDEstoque := lMov.FieldByName('ID_ESTOQUE').AsInteger;
      lM.FData := lMov.FieldByName('DATA').AsDateTime;
      TMovimentacao.FMovimentacoes.Add(lM);

      lMov.Next;
    end;
  end;
end;

end.
