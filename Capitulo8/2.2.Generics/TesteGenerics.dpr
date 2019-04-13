program TesteGenerics;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmGenerics};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGenerics, frmGenerics);
  Application.Run;
end.
