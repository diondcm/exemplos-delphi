program MultiView;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Base.MultiView in 'Form.Base.MultiView.pas' {frmBaseMultiView},
  Form.Camera in 'Form.Camera.pas' {frmCamera};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBaseMultiView, frmBaseMultiView);
  Application.CreateForm(TfrmCamera, frmCamera);
  Application.Run;
end.
