program CadastroTurbo;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Cadastro.Paises in 'Form.Cadastro.Paises.pas' {frmCadPaises},
  Data.Paises in 'Data.Paises.pas' {dmdPaises: TDataModule},
  Form.Consulta.Paises in 'Form.Consulta.Paises.pas' {frmConsultaPaises};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmdPaises, dmdPaises);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadPaises, frmCadPaises);
  Application.CreateForm(TfrmConsultaPaises, frmConsultaPaises);
  Application.Run;
end.
