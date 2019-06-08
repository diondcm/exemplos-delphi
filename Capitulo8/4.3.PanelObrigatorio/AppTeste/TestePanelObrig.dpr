program TestePanelObrig;

uses
  Vcl.Forms,
  Form.Principal.Teste in 'Form.Principal.Teste.pas' {frmPanelTest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPanelTest, frmPanelTest);
  Application.Run;
end.
