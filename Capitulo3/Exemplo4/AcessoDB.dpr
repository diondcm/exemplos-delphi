program AcessoDB;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Cores in 'Data.Cores.pas' {dmdCores: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmdCores, dmdCores);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
