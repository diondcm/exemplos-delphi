unit Classe.Usuario.Logado;

interface

type
  TUsuarioLogado = class
  private
    FUser: string;
    FEmpresa: string;
  protected class var
    FInstance: TUsuarioLogado;
    FIssoEhUmClassVar: Boolean;
    class function GetUsuarioLogado: TUsuarioLogado; static;
  public
    property User: string read FUser write FUser;
    property Empresa: string read FEmpresa write FEmpresa;
    class destructor Destroy;
    class function EfetuaLogin(const pUsuario, pSenha, pEmpresa: string): string;
    class property UsuarioLogado: TUsuarioLogado read GetUsuarioLogado;
  end;


implementation

{ TUsuarioLogado }

class destructor TUsuarioLogado.Destroy;
begin
  FInstance.Free;
end;

class function TUsuarioLogado.EfetuaLogin(const pUsuario, pSenha,
  pEmpresa: string): string;
begin
  // WS
  if (pUsuario = 'Teste') and (pSenha = '1') then
  begin
    GetUsuarioLogado.User := pUsuario;
    GetUsuarioLogado.Empresa := pEmpresa;
    Result := '';
  end else begin
    Result := 'Usuário inválido';
  end;
end;

class function TUsuarioLogado.GetUsuarioLogado: TUsuarioLogado;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TUsuarioLogado.Create;
  end;

  Result := FInstance;
end;

end.
