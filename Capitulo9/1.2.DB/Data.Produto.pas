unit Data.Produto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, System.Generics.Collections;

type
  TProduto = class
  private
    FDescricao: string;
    FCodigo: string;
    FID: Integer;
    FDataCadastro: TDateTime;
    FPeso: Double;
  public
    function ToString: string;
    property ID: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property Codigo: string read FCodigo write FCodigo;
    property Peso: Double read FPeso write FPeso;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
  end;

  TListaProduto = class(TDictionary<string, TProduto>)
    function ToString: string;
  end;

  TdmdProduto = class(TDataModule)
    qryProduto: TFDQuery;
    qryProdutoID: TFDAutoIncField;
    qryProdutoDESCRICAO: TWideStringField;
    qryProdutoCODIGO: TWideStringField;
    qryProdutoPESO: TFloatField;
    qryProdutoDATA_CADASTRO: TSQLTimeStampField;
    procedure qryProdutoAfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
//    FProduto: TProduto;
    FListaProduto: TListaProduto;
  public
//    property Produto: TProduto read FProduto write FProduto;
    property ListaProduto: TListaProduto read FListaProduto write FListaProduto;
  end;

var
  dmdProduto: TdmdProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Data.Connection;

{$R *.dfm}

procedure TdmdProduto.DataModuleCreate(Sender: TObject);
begin
  FListaProduto := TListaProduto.Create;
end;

procedure TdmdProduto.DataModuleDestroy(Sender: TObject);
begin
  FListaProduto.Free;
end;

procedure TdmdProduto.qryProdutoAfterOpen(DataSet: TDataSet);
var
  lProduto: TProduto;
//const
//  ID = 0;
begin
  if not qryProduto.IsEmpty then
  begin
    qryProduto.DisableControls;
    try
      // ORM
      // CRUD
      // RAD
      qryProduto.First;
      while not qryProduto.Eof do
      begin
        lProduto := TProduto.Create;
        //lProduto.ID := qryProduto.Fields[0].AsInteger; // Não fazer
        lProduto.ID := qryProduto.FieldByName('ID').AsInteger;
        lProduto.Descricao := qryProdutoDESCRICAO.AsString;
        lProduto.Codigo := qryProdutoCODIGO.AsString;
        lProduto.Peso := qryProdutoPESO.AsFloat;
        lProduto.DataCadastro := qryProdutoDATA_CADASTRO.AsDateTime;

        FListaProduto.Add(qryProdutoCODIGO.AsString, lProduto);

        qryProduto.Next;
      end;
    finally
      qryProduto.First;
      qryProduto.EnableControls;
    end;
  end;
end;

{ TProduto }

function TProduto.ToString: string;
begin
  Result := 'ID: ' + FID.ToString + ', ' + 'Desc. ' + FDescricao;
end;

{ TListaProduto }

function TListaProduto.ToString: string;
var
  lProduto: TProduto;
begin
  for lProduto in dmdProduto.ListaProduto.Values do
  begin
    Result := Result + lProduto.ToString + sLineBreak;
  end;
end;

end.
