unit ClasseProdutoResource;

interface

uses
  System.SysUtils, System.Classes, EMS.ResourceAPI, EMS.Services, EMS.ResourceTypes, System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.ConsoleUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  EMS.DataSetResource, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

//[EndpointMethod(TEndpointRequest.TMethod.Get)]

type
  [ResourceName('produto')]
  TProdutoResource = class(TDataModule)
    FDConnection: TFDConnection;
    qryProduto: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;

    [ResourceSuffix('list', '/')]
    [ResourceSuffix('get', '/{idproduto}')]
    [ResourceSuffix('put', '/{idproduto}')]
    [ResourceSuffix('post', '/')]
    [ResourceSuffix('delete', '/{idproduto}')]
    EMSDataSetResourceProduto: TEMSDataSetResource;
    qryProdutoidproduto: TLargeintField;
    qryProdutodescricao: TWideStringField;
    qryProdutogrupo: TWideStringField;
  private
    { Private declarations }
  published
  end;

//var
//  ProdutoResource: TProdutoResource;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure Register;
begin
  RegisterResource(TypeInfo(TProdutoResource));
end;

initialization
  Register;

end.
