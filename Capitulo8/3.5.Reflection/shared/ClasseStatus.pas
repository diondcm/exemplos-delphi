unit ClasseStatus;

interface

type
  TStatus = class
  private
    Fcodigo: integer;
    FErro: string;
    FMsg: string;
    FPersistido: Boolean;
  public
    property codigo: integer read Fcodigo write Fcodigo;
    property Erro: string read FErro write FErro;
    property Msg: string read FMsg write FMsg;
    property Persistido: Boolean read FPersistido write FPersistido;
  end;


implementation

end.
