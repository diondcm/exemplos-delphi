unit Classe.Status;

interface

uses
  Generics.Collections;

type
  TStatus = class
  private
    FErro: string;
  public
    property Erro: string read FErro write FErro;
  end;

  TStatusList<T> = class(TList<T>)
  private
    FErro: string;
  public
    property Erro: string read FErro write FErro;
  end;


implementation

end.
