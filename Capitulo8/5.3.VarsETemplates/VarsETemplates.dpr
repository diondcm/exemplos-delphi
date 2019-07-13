program VarsETemplates;

uses
  Vcl.Forms,
  Form.VarsETemplates in 'Form.VarsETemplates.pas' {frmVarsETemp},
  Data.VarsETemplates in 'Data.VarsETemplates.pas' {dmdVarsETemplate: TDataModule},
  Form.Selecao.Parametros in 'Form.Selecao.Parametros.pas' {frmParametros};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVarsETemp, frmVarsETemp);
  Application.CreateForm(TdmdVarsETemplate, dmdVarsETemplate);
  Application.CreateForm(TfrmParametros, frmParametros);
  Application.Run;
end.
