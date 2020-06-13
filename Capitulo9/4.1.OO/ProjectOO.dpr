program ProjectOO;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Classe.Acao in 'Classe.Acao.pas',
  Classe.AcaoDB in 'Classe.AcaoDB.pas',
  Frame.Acao in 'Frame.Acao.pas' {fraAcao: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
