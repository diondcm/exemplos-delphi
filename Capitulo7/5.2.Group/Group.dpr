program Group;

uses
  Vcl.Forms,
  Form.Principal.Group in 'Form.Principal.Group.pas' {frmPrincipalGroup},
  Data.Group in 'Data.Group.pas' {dmdGroup: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalGroup, frmPrincipalGroup);
  Application.CreateForm(TdmdGroup, dmdGroup);
  Application.Run;
end.
