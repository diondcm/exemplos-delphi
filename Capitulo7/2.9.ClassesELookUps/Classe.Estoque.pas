unit Classe.Estoque;

interface

uses
  System.SysUtils, System.Classes, Generics.Collections, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Forms;

type
  TEstoque = class
  private class var
    FEstoques: TObjectList<TEstoque>;
  private
    FIDEstoque: Integer;
    FCarregado: Boolean;
    FID: Integer;
    FNome: string;
    class function GetEstoques: TObjectList<TEstoque>; static;
    function GetID: Integer;
    function GetNome: string;
  protected
    class constructor Create;
    class destructor Destroy;
    procedure CarregaEstoque(pDts: TDataset); overload;
  public
    procedure CarregaEstoque(pID: Integer); overload;
    constructor Create(pID: Integer);
    property ID: Integer read GetID write FID;
    property Nome: string read GetNome write FNome;
    class property Estoques: TObjectList<TEstoque> read GetEstoques;
    // Proprio tipo de lista, com tratamentos específicos
  end;

  TdmdEstoque = class(TDataModule)
    qryEstoque: TFDQuery;
    memEstoque: TFDMemTable;
    memEstoqueID: TIntegerField;
    memEstoqueNome: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private class var
    FInstancia: TdmdEstoque;
  private
    class function GetInstancia: TdmdEstoque; static;
  public
    class property Instancia: TdmdEstoque read GetInstancia write FInstancia;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TEstoque }

procedure TEstoque.CarregaEstoque(pDts: TDataset);
begin
  // Esta parte, fica dinâmica com ORM,
  FID := pDts.FieldByName('ID').AsInteger;
  FNome := pDts.FieldByName('NOME').AsString;
end;

procedure TEstoque.CarregaEstoque(pID: Integer);
begin
  // Sem lasy-loading:
  TdmdEstoque.GetInstancia.qryEstoque.Close;
  TdmdEstoque.GetInstancia.qryEstoque.ParamByName('id_estoque').AsInteger := pID;
  TdmdEstoque.GetInstancia.qryEstoque.Open;
  if not TdmdEstoque.GetInstancia.qryEstoque.IsEmpty then
  begin
    CarregaEstoque(TdmdEstoque.GetInstancia.qryEstoque);
  end;
  TdmdEstoque.GetInstancia.qryEstoque.Close;
end;

constructor TEstoque.Create(pID: Integer);
begin
  if pID <> 0 then
  begin
    // Com lasy-loading implementado nesta classe:
    FIDEstoque := pID;
    FCarregado := False;

    CarregaEstoque(pID);
  end;
end;

class constructor TEstoque.Create;
begin
  FEstoques := TObjectList<TEstoque>.Create;
end;

class destructor TEstoque.Destroy;
begin
  FEstoques.Free;
end;

class function TEstoque.GetEstoques: TObjectList<TEstoque>;
var
  lEstoque: TFDMemTable;
  lEst: TEstoque;
begin
  { Invalidar o cache de objetos, caso altere o banco }
  if TEstoque.FEstoques.Count = 0 then
  begin
    lEstoque := TdmdEstoque.Instancia.memEstoque; { buscar a query no DB }
    lEstoque.First;
    while not lEstoque.Eof do
    begin
      lEst := TEstoque.Create(0 {, Parametro para não carregar quando vem da lista, pois já temos os dados na query } );
      lEst.FID := lEstoque.FieldByName('ID').AsInteger;
      lEst.FNome := lEstoque.FieldByName('NOME').AsString;
      TEstoque.FEstoques.Add(lEst);

      lEstoque.Next;
    end;
  end;
end;


function TEstoque.GetID: Integer;
begin
  if not FCarregado then
  begin
    CarregaEstoque(FIDEstoque);
  end;

  Result := FID;
end;

function TEstoque.GetNome: string;
begin
  if not FCarregado then
  begin
    CarregaEstoque(FIDEstoque);
  end;

  Result := FNome;
end;

procedure TdmdEstoque.DataModuleCreate(Sender: TObject);
begin
  memEstoque.Open;
end;

class function TdmdEstoque.GetInstancia: TdmdEstoque;
begin
  if not Assigned(TdmdEstoque.FInstancia) then
  begin
    TdmdEstoque.FInstancia := TdmdEstoque.Create(Application);
  end;

  Result := TdmdEstoque.FInstancia;
end;

end.
