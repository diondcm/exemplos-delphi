unit Classe.Email;

interface

uses
  Forms, System.Classes, System.SysUtils, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdReplySMTP, IdAttachment, IdMessageParts, IdEMailAddress, IdAttachmentFile,
  IdAntiFreezeBase, Vcl.IdAntiFreeze;

type
  TEmail = class
  public
    class function Enviar(const pUser, pSenha, pDestinatarios, pAssunto : string; pBody: TStrings = nil; pAttach: TStrings = nil): string;
  end;

  TEmailThread = class(TThread)
  private
    FUser: string;
    FSenha: string;
    FDestinatarios: string;
    FAssunto: string;
    FBody: string;
    FAttach: string;
  protected
    procedure Execute; override;
  public
    constructor Create(const pUser, pSenha, pDestinatarios, pAssunto: string; const pBody: string = ''; const pAttach: string = ''); overload;
  end;

implementation

{ TEmail }

class function TEmail.Enviar(const pUser, pSenha, pDestinatarios, pAssunto: string; pBody, pAttach: TStrings): string;
var
  lSMTP: TidSMTP;
  lAtt: TIdAttachmentFile;
  lMessage: TIdMessage;
  lSSL: TIdSSLIOHandlerSocketOpenSSL;
  lArq: string;
  lAntiFreeze: TIdAntiFreeze;
begin
  Result := '';
  if pSenha = '' then
  begin
    //raise Exception.Create('Informe a senha');
    Exit('Senha não informada.')
  end;

  if pDestinatarios = '' then
  begin
    //raise Exception.Create('Informe o destinatário');
    Exit('Destinatários não informados')
  end;

  if pUser = '' then
  begin
    //raise Exception.Create('Informe o usuário.');
    Exit('Nome de Usuário não informado.');
  end;

  lMessage := TIdMessage.Create(nil);
  lSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  lSMTP := TIdSMTP.Create(nil);
  lAntiFreeze := TIdAntiFreeze.Create(nil);
  try
    lSMTP.IOHandler := lSSL;
    lSMTP.Host := 'smtp.gmail.com';
    lSMTP.Port := 587;
    lSMTP.UseTLS := utUseExplicitTLS;
    lSMTP.Username := pUser;
    lSMTP.Password := pSenha;

    lSSL.Destination := 'smtp.gmail.com:587';
    lSSL.Host := 'smtp.gmail.com';
    lSSL.Port := 587;
    lSSL.SSLOptions.Mode := sslmUnassigned;
    lSSL.SSLOptions.VerifyMode := [];
    lSSL.SSLOptions.VerifyDepth := 0;

    lSMTP.Connect;
    try
      lMessage.From.Address := pUser;
      lMessage.Recipients.EMailAddresses := pDestinatarios;
      lMessage.Subject := pAssunto;

      if Assigned(pBody) then
      begin
        lMessage.Body.Text := pBody.Text;
      end;

      if Assigned(pAttach) then
      begin
        for lArq in pAttach do
        begin
          TIdAttachmentFile.Create(lMessage.MessageParts, lArq);
        end;
      end;

      try
        lSMTP.Send(lMessage);

      except
        on E: EIdSMTPReplyError do
        begin
          Exit('Desativar config no Gmail!' + sLineBreak + sLineBreak + E.Message);
//          raise Exception.Create('Desativar config no Gmail!' +
//            sLineBreak + sLineBreak + E.Message);
        end;
        on E: Exception do
        begin
          Exit(E.Message + '(' + E.QualifiedClassName + ')')
        end
      end;

    finally
      lSMTP.Disconnect;
      //lAtt.Free;
    end;
  finally
    lAntiFreeze.Free;
    lSMTP.Free;
    lSSL.Free;
    lMessage.Free;
  end;
end;

{ TEmailThread }

constructor TEmailThread.Create(const pUser, pSenha, pDestinatarios, pAssunto,
  pBody, pAttach: string);
begin
  FUser := pUser;
  FSenha := pSenha;
  FDestinatarios := pDestinatarios;
  FAssunto := pAssunto;
  FBody := pBody;
  FAttach := pAttach;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TEmailThread.Execute;
var
  lBody: TStringList;
  lAtch: TStringList;
begin
  lBody := nil;
  if FBody <> '' then
  begin
    lBody := TStringList.Create;
    lBody.Text := FBody;
  end;

  lAtch := nil;
  if FAttach <> '' then
  begin
    lAtch := TStringList.Create;
    lAtch.Text := FBody;
  end;

  // não trata retorno, melhoria para futuro
  TEmail.Enviar(FUser, FSenha, FDestinatarios, FAssunto, lBody, lAtch);
end;

end.
