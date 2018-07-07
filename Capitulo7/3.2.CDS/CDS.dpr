program CDS;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmCDS},
  Data.CDS in 'Data.CDS.pas' {dmdCDS: TDataModule},
  Form.Historico in 'Form.Historico.pas' {frmHistorico},
  Form.Client.DS2010 in 'Form.Client.DS2010.pas' {frmClientDS2010},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCDS, frmCDS);
  Application.CreateForm(TdmdCDS, dmdCDS);
  Application.CreateForm(TfrmHistorico, frmHistorico);
  Application.CreateForm(TfrmClientDS2010, frmClientDS2010);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
