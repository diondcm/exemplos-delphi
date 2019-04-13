program HerancaVisual;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Base in 'Form.Base.pas' {frmBase},
  Form.Sobre in 'Form.Sobre.pas' {frmSobre},
  Form.Login in 'Form.Login.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
//  Application.CreateForm(TfrmBase, frmBase);
//  Application.CreateForm(TfrmSobre, frmSobre);
//  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
