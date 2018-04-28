program AcessoDB;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Cadastro.Usuario in 'Form.Cadastro.Usuario.pas' {frmUsuario},
  Data.Usuario in 'Data.Usuario.pas' {dmdUsuario: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdUsuario, dmdUsuario);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmUsuario, frmUsuario);
  Application.Run;
end.
