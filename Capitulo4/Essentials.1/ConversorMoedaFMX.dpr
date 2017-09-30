program ConversorMoedaFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  uConversorMoeda in 'uConversorMoeda.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
