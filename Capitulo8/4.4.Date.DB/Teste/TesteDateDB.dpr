program TesteDateDB;

uses
  Vcl.Forms,
  Form.Teste.DateDB in 'Form.Teste.DateDB.pas' {frmTesteDateDB};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTesteDateDB, frmTesteDateDB);
  Application.Run;
end.
