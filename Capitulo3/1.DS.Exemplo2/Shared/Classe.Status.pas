unit Classe.Status;

interface

type
  TStatus = class
  private
    FErro: string;
  public
    property Erro: string read FErro write FErro;
  end;

implementation

end.
