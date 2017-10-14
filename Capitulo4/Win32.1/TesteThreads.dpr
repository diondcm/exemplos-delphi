program TesteThreads;

uses
  Vcl.Forms,
  Form.Threads in 'Form.Threads.pas' {frmThreads};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmThreads, frmThreads);
  Application.Run;
end.
