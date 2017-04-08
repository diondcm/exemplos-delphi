unit Classe.Login;

interface

uses
  System.SysUtils, System.Generics.Collections, System.IOUtils, Datasnap.DBClient,
  Data.DB;

type
  TUsuario = class;

  TLogin = class
    class function Verifica(pUsuario, pSenha: string): TUsuario;
  end;

  TListaUsuario = class(TList<TUsuario>)
  private const
    ARQ_USUARIOS = 'listaUsuarios.xml';
  private
    class var FListaUsuario: TListaUsuario;
  public
    class function GetIntancia: TListaUsuario;
    class destructor Destroy;
    procedure CarregaUsuarios;
  end;

  TUsuario = class
  private
    FNome: string;
    FSenha: string;
    function GetSenha: string;
    procedure SetSenha(const Value: string);
    class function GeraHash(pSenha: string): string;
  public
    property Nome: string read FNome write FNome;
    property Senha: string read GetSenha write SetSenha;
  end;

implementation

{ TUsuario }

class function TUsuario.GeraHash(pSenha: string): string;
var
  i, lSenha:integer;
begin
  lSenha := 0;
  for i:=1 to length(pSenha) do
    lSenha:=lSenha*$20844 xor byte(pSenha[i]);
  Result := IntToStr(lSenha);
end;

function TUsuario.GetSenha: string;
begin
  Result := FSenha
end;

procedure TUsuario.SetSenha(const Value: string);
begin
  // todo: implementar codificação de senha
  FSenha := Value;
end;

{ TLogin }

class function TLogin.Verifica(pUsuario, pSenha: string): TUsuario;
var
  lUsuario: TUsuario;
  lSenhaHash: string;
begin
  Result := nil;
  lSenhaHash := TUsuario.GeraHash(pSenha);
  for lUsuario in TListaUsuario.GetIntancia do
  begin
    if (CompareStr(pUsuario.ToLower, lUsuario.Nome.ToLower) = 0) //(pUsuario.ToLower = lUsuario.Nome.ToLower) and
      and (CompareStr(lSenhaHash, lUsuario.Senha) = 0) then // and (lSenhaHash = lUsuario.Senha) then
    begin
      // Result := lUsuario; ou isso ou:
      Exit(lUsuario);
      Break;  // ou utilizar while
    end;
  end;
end;

{ TListaUsuario }

procedure TListaUsuario.CarregaUsuarios;
var
  lCds: TClientDataSet;
  lArquivoXML: string;
begin
  // TDirectory.GetCurrentDirectory;
  lArquivoXML := ExtractFilePath(ParamStr(0)) + ARQ_USUARIOS;
  if TFile.Exists(lArquivoXML) then
  begin
    lCds := TClientDataSet.Create(nil);
    try
      lCds.LoadFromFile(lArquivoXML);
      while not lCds.Eof do
      begin
        Add(TUsuario.Create);
        Last.Nome := lCds.FieldByName('Nome').AsString;
        Last.Senha := lCds.FieldByName('parole').AsString;

        lCds.Next;
      end;

    finally
      lCds.Free;
    end;
  end else begin
    lCds := TClientDataSet.Create(nil);
    try
      lCds.FieldDefs.Add('Nome', ftString, 100);
      lCds.FieldDefs.Add('Parole', ftString, 100);
      lCds.CreateDataSet;

      lCds.Append;
      lCds.FieldByName('Nome').AsString := 'Teste';
      lCds.FieldByName('parole').AsString := TUsuario.GeraHash('!@#654');
      lCds.Post;

      lCds.Append;
      lCds.FieldByName('Nome').AsString := 'Teste2';
      lCds.FieldByName('parole').AsString := TUsuario.GeraHash('A');
      lCds.Post;

      lCds.Append;
      lCds.FieldByName('Nome').AsString := 'Teste3';
      lCds.FieldByName('parole').AsString := TUsuario.GeraHash('GG');
      lCds.Post;

      lCds.First;
      while not lCds.Eof do
      begin
        Add(TUsuario.Create);
        Last.Nome := lCds.FieldByName('Nome').AsString;
        Last.Senha := lCds.FieldByName('parole').AsString;

        lCds.Next;
      end;
      lCds.SaveToFile(lArquivoXML);

    finally
      lCds.Free;
    end;
  end;
end;

class destructor TListaUsuario.Destroy;
var
  lUsuario: TObject;
begin
  if Assigned(FListaUsuario) then
  begin
    for lUsuario in FListaUsuario do
    begin
      lUsuario.Free;
    end;
  end;

  FListaUsuario.Free;
end;

class function TListaUsuario.GetIntancia: TListaUsuario;
begin
  if not Assigned(FListaUsuario) then
  begin
    FListaUsuario := TListaUsuario.Create;
    FListaUsuario.CarregaUsuarios;
  end;

  Result := FListaUsuario;
end;

end.
