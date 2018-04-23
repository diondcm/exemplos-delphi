program TipoEObjetosVCL;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmTipos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //TfrmTipos.Instancia.Show;
  Application.CreateForm(TfrmTipos, frmTipos);
  Application.Run;
end.
