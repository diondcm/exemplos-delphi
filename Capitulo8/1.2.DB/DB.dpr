program DB;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  Form.DadosDB in 'Form.DadosDB.pas' {frmDadosDB},
  Form.Objeto in 'Form.Objeto.pas' {frmObjeto},
  Form.Visualiza.QrCode in 'Form.Visualiza.QrCode.pas' {frmVIsualizaQrCode},
  Classe.QrCode in 'Classe.QrCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;


  // não pode passar owner no login


  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmDadosDB, frmDadosDB);
  Application.CreateForm(TfrmObjeto, frmObjeto);
  Application.CreateForm(TfrmVIsualizaQrCode, frmVIsualizaQrCode);
  Application.Run;
end.
