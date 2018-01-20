program MasterDetail;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Master.Detail in 'Form.Master.Detail.pas' {frmMasterDetail},
  Data.DBDemos in 'Data.DBDemos.pas' {dmdDBDemos: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
