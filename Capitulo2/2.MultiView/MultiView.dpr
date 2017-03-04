program MultiView;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Layout1 in 'Form.Layout1.pas' {frmLayout1},
  Form.Layout2 in 'Form.Layout2.pas' {frmLayout2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
