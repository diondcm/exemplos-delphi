unit Classe.Escritorio;

interface

uses System.SySUtils, Classe.Base, Classe.Patrimonio;

type
  TNoteBook = class(TClasseBase, IPatrimonio)
  private
    FDataCompra: TDateTime;
    procedure SetDataDepreciacao(const Value: TDateTime);
    procedure SetValorCompra(const Value: Currency);

    function GetDataCompra: TDateTime;
    function GetDataDepreciacao: TDateTime;
    function GetValorCompra: Currency;
  public
    property DataCompra: TDateTime read GetDataCompra write FDataCompra;
    property ValorCompra: Currency read GetValorCompra write SetValorCompra;
    property DataDepreciacao: TDateTime read GetDataDepreciacao write SetDataDepreciacao;
  end;

  TMesa = class(TClasseBase, IPatrimonio)
  private
    FDataCompra: TDateTime;
    function GetDataCompra: TDateTime;
    function GetDataDepreciacao: TDateTime;
    function GetValorCompra: Currency;
    procedure SetDataDepreciacao(const Value: TDateTime);
    procedure SetValorCompra(const Value: Currency);
  public
    property DataCompra: TDateTime read GetDataCompra write FDataCompra;
    property ValorCompra: Currency read GetValorCompra write SetValorCompra;
    property DataDepreciacao: TDateTime read GetDataDepreciacao write SetDataDepreciacao;
  end;

  TCadeira = class(TClasseBase, IPatrimonio)
  private
    FDataCompra: TDateTime;
    function GetDataCompra: TDateTime;
    function GetDataDepreciacao: TDateTime;
    function GetValorCompra: Currency;
    procedure SetDataDepreciacao(const Value: TDateTime);
    procedure SetValorCompra(const Value: Currency);
  public
    property DataCompra: TDateTime read GetDataCompra write FDataCompra;
    property ValorCompra: Currency read GetValorCompra write SetValorCompra;
    property DataDepreciacao: TDateTime read GetDataDepreciacao write SetDataDepreciacao;
  end;


implementation

{ TNoteBook }

function TNoteBook.GetDataCompra: TDateTime;
begin
  Result := FDataCompra;
end;

function TNoteBook.GetDataDepreciacao: TDateTime;
begin
  Result := Now + Random(2000);
end;

function TNoteBook.GetValorCompra: Currency;
begin
  Result := Random(10000)/(1+Random(123));
end;

procedure TNoteBook.SetDataDepreciacao(const Value: TDateTime);
begin

end;

procedure TNoteBook.SetValorCompra(const Value: Currency);
begin

end;

{ TMesa }

function TMesa.GetDataCompra: TDateTime;
begin
  Result := FDataCompra;
end;

function TMesa.GetDataDepreciacao: TDateTime;
begin
  Result := Now + Random(10000);
end;

function TMesa.GetValorCompra: Currency;
begin
  Result := Random(10000)/(1+Random(123));
end;

procedure TMesa.SetDataDepreciacao(const Value: TDateTime);
begin

end;

procedure TMesa.SetValorCompra(const Value: Currency);
begin

end;

{ TCadeira }

function TCadeira.GetDataCompra: TDateTime;
begin
  Result := FDataCompra;
end;

function TCadeira.GetDataDepreciacao: TDateTime;
begin
  Result := Now;
end;

function TCadeira.GetValorCompra: Currency;
begin
  Result := Random(10000)/(1+Random(123));
end;

procedure TCadeira.SetDataDepreciacao(const Value: TDateTime);
begin

end;

procedure TCadeira.SetValorCompra(const Value: Currency);
begin

end;

end.
