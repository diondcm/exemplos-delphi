program Grupos;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Grupo in 'Data.Grupo.pas' {dmdGrupo: TDataModule},
  Form.Exibe.Dados in 'Form.Exibe.Dados.pas' {frmExibeDados};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdGrupo, dmdGrupo);
  Application.CreateForm(TfrmExibeDados, frmExibeDados);
  Application.Run;
end.
