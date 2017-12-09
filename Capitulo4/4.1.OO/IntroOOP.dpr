program IntroOOP;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrinciapal},
  Classes.Pessoa in '..\4.1.Shared\Classes.Pessoa.pas',
  Classe.Pessoa.Juridica in '..\4.1.Shared\Classe.Pessoa.Juridica.pas',
  Classe.Imovel in '..\4.1.Shared\Classe.Imovel.pas',
  Classe.Base in '..\4.1.Shared\Classe.Base.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrinciapal, frmPrinciapal);
  Application.Run;
end.
