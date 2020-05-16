unit Classe.Transporte;

interface

uses
  System.Generics.Collections;

type
  TTransporte<T> = class
    sucesso: boolean;
    erro: string;
    instancia: T;
    retorno: string;
  end;

implementation

end.
