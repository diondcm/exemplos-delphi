unit Classe.Retorno;

interface

type
  TRetorno = class
  private
    FSucess: Boolean;
    FMsg: string;
  public
    property Sucess: Boolean read FSucess write FSucess;
    property Msg: string read FMsg write FMsg;
  end;

implementation

end.
