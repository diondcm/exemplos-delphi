program ConceitosWin;

uses
  Vcl.Forms in 'Vcl.Forms.pas',
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Win.Classes in 'Form.Win.Classes.pas' {frmWinClasses},
  Form.Win.CriaClasse in 'Form.Win.CriaClasse.pas' {frmCriaClasse},
  Classe.DirWatch in 'Classe.DirWatch.pas',
  Form.MonitoraDir in 'Form.MonitoraDir.pas' {frmMonitoraDir},
  Form.Parent in 'Form.Parent.pas' {frmParent};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmWinClasses, frmWinClasses);
  Application.CreateForm(TfrmCriaClasse, frmCriaClasse);
  Application.CreateForm(TfrmMonitoraDir, frmMonitoraDir);
  Application.CreateForm(TfrmParent, frmParent);
  Application.Run;
end.
