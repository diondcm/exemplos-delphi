program CodigosEDinamico;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Relatorios in 'Data.Relatorios.pas' {dmdRelatorios: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdRelatorios, dmdRelatorios);
  Application.Run;
end.
