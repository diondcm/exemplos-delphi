program CDS;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmCDS},
  Data.CDS in 'Data.CDS.pas' {dmdCDS: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCDS, frmCDS);
  Application.CreateForm(TdmdCDS, dmdCDS);
  Application.Run;
end.
