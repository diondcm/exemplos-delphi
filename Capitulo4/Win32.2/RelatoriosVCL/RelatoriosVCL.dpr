program RelatoriosVCL;

uses
  Vcl.Forms,
  Base.Form.Ajuda in '..\Base\Base.Form.Ajuda.pas' {frmBaseAjuda},
  Base.Form in '..\Base\Base.Form.pas' {frmBase},
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Ajuda in 'Form.Ajuda.pas' {frmAjuda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TfrmBase.FormAjudaClass := TfrmAjuda;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
