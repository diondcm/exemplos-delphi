program DebugRemoto;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Debug.Remoto in 'Debug.Remoto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //TDebugRemoto.Extrair;
  //TDebugRemoto.Executar;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
