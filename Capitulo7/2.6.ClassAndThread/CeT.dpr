program CeT;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.ClassOf in 'Form.ClassOf.pas' {frmClassOf},
  Form.Threads in 'Form.Threads.pas' {frmThreads},
  Form.Cidades in 'Form.Cidades.pas' {frmCidades};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmClassOf, frmClassOf);
  Application.CreateForm(TfrmThreads, frmThreads);
  Application.CreateForm(TfrmCidades, frmCidades);
  Application.Run;
end.
