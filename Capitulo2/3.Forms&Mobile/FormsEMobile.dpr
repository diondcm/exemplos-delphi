program FormsEMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Base.Detalhe in 'Form.Base.Detalhe.pas' {frmBaseDetalhe},
  Form.Location in 'Form.Location.pas' {frmLocation},
  Form.Camera in 'Form.Camera.pas' {frmCamera},
  Form.Acelerometro in 'Form.Acelerometro.pas' {frmAcelerometro},
  Form.Microfone in 'Form.Microfone.pas' {frmMicrofone};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAcelerometro, frmAcelerometro);
  Application.CreateForm(TfrmMicrofone, frmMicrofone);
  Application.Run;
end.
