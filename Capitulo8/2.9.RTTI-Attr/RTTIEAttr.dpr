program RTTIEAttr;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPincipal, frmPincipal);
  Application.Run;
end.
