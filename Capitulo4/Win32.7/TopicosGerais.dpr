program TopicosGerais;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.QRCode in 'Form.QRCode.pas' {frmQRCode},
  Classe.Gera.QRCode in 'Classe.Gera.QRCode.pas',
  Form.Maps in 'Form.Maps.pas' {frmMaps},
  Form.Error in 'Form.Error.pas' {frmError},
  Classe.Erro.Custom in 'Classe.Erro.Custom.pas',
  Classe.Mensagem in 'Classe.Mensagem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmQRCode, frmQRCode);
  Application.CreateForm(TfrmMaps, frmMaps);
  Application.CreateForm(TfrmError, frmError);
  Application.Run;
end.
