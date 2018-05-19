program CeT;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.ClassOf in 'Form.ClassOf.pas' {frmClassOf},
  Form.Threads in 'Form.Threads.pas' {frmThreads};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmClassOf, frmClassOf);
  Application.CreateForm(TfrmThreads, frmThreads);
  Application.Run;
end.
