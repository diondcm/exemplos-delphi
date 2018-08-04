program ConceitosOO;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Classes.Base in 'Classes.Base.pas',
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Frame.Teste in 'Frame.Teste.pas' {Frame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
