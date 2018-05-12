unit Classe.Cliente;

interface

uses
  WinApi.Windows, System.SysUtils;

type
  TCliente = class
  private
    class var
      FMaxDebitos: Integer;
  public
    function ClienteInadimplente: Boolean;

    constructor Create;
    destructor Destroy; override;

    class constructor Create;
    class destructor Destroy;
    class procedure ClassValidaCliente;
  end;

implementation

var
  FLogAtivo: Boolean = True;

procedure GravaLog(const pTexto: string);
begin
  if FLogAtivo then
  begin
    Writeln(GetTickCount.ToString + ' - ' + pTexto);
  end;
end;

{ TCliente }

function TCliente.ClienteInadimplente: Boolean;
begin
  GravaLog('Cliente inadimplente');
  Result := False;
end;

class constructor TCliente.Create;
begin
  GravaLog('Class Contructor');
end;

constructor TCliente.Create;
begin
  GravaLog('Cria obj');
end;

class destructor TCliente.Destroy;
begin
  GravaLog('Class destructor');
end;

destructor TCliente.Destroy;
begin
  GravaLog('Libera Obj');
end;

class procedure TCliente.ClassValidaCliente;
begin
  GravaLog('Class: Valida Cliente');
end;

initialization
  GravaLog('Initialization');

finalization
  GravaLog('Finalization');

end.
