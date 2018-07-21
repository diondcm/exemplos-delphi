unit Classe.Resposta;

interface

uses
  Generics.Collections;

type
  TResposta<T> = class
  private
    FErro: string;
    FCorErro: Integer;
    FStatus: Boolean;
    FListaObjetos: TList<T>;
  published
    property Erro: string read FErro write FErro;
    property CodErro: Integer read FCorErro write FCorErro;
    property Status: Boolean read FStatus write FStatus;
    property ListaObjetos: TList<T> read FListaObjetos write FListaObjetos;
  end;

implementation

end.
