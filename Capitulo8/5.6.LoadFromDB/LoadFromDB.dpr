program LoadFromDB;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Load.FromDB in 'Data.Load.FromDB.pas' {dmdLoadFromDB: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdLoadFromDB, dmdLoadFromDB);
  Application.Run;
end.
