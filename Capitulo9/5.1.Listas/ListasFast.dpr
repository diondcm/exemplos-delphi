program ListasFast;

uses
  Vcl.Forms,
  Form.Listas in 'Form.Listas.pas' {frmListas},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TfrmListas, frmListas);
  Application.Run;
end.
