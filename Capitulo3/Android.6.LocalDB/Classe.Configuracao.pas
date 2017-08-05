unit Classe.Configuracao;

interface

uses
  System.Generics.Collections;

type
  TConfiguracao = class
  private
    FID: Integer;
    FDescricao: string;
    FNomeConfig: string;
    FValorConfig: string;
    FUsuario: string;
    FEmpresa: string;
  public
    property ID: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property NomeConfig: string read FNomeConfig write FNomeConfig;
    property ValorConfig: string read FValorConfig write FValorConfig;
    property Usuario: string read FUsuario write FUsuario;
    property Empresa: string read FEmpresa write FEmpresa;
  end;

implementation

end.

