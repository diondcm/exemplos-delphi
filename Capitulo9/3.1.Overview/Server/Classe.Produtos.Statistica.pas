unit Classe.Produtos.Statistica;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TItemDTO = class
  private
    FAlias: string;
    FCatId: Integer;
    FCatTitle: string;
    FId: Integer;
    FParentCatId: Integer;
    FParentCatTitle: string;
    FPath: string;
    FSigla: string;
    FTipo: string;
    FTitulo: string;
  published
    property Alias: string read FAlias write FAlias;
    property CatId: Integer read FCatId write FCatId;
    property CatTitle: string read FCatTitle write FCatTitle;
    property Id: Integer read FId write FId;
    property ParentCatId: Integer read FParentCatId write FParentCatId;
    property ParentCatTitle: string read FParentCatTitle write FParentCatTitle;
    property Path: string read FPath write FPath;
    property Sigla: string read FSigla write FSigla;
    property Tipo: string read FTipo write FTipo;
    property Titulo: string read FTitulo write FTitulo;
  end;
  
  TRootDTO = class(TJsonDTO)
  private
    [JSONName('Items')]
    FItemsArray: TArray<TItemDTO>;
    [GenericListReflect]
    FItems: TObjectList<TItemDTO>;
    function GetItems: TObjectList<TItemDTO>;
  published
    property Items: TObjectList<TItemDTO> read GetItems;
    destructor Destroy; override;
  end;
  
implementation

{ TRootDTO }

destructor TRootDTO.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TRootDTO.GetItems: TObjectList<TItemDTO>;
begin
  if not Assigned(FItems) then
  begin
    FItems := TObjectList<TItemDTO>.Create;
    FItems.AddRange(FItemsArray);
  end;
  Result := FItems;
end;

end.
