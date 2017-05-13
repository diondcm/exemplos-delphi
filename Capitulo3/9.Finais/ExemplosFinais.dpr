program ExemplosFinais;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Master.Detail in 'Form.Master.Detail.pas' {frmMAsterDetail},
  Form.REST in 'Form.REST.pas' {frmREST},
  Form.Exportador in 'Form.Exportador.pas' {frmExportador},
  Classe.Atributo.Campo in 'Classe.Atributo.Campo.pas',
  Classe.Exportador.Arquivo in 'Classe.Exportador.Arquivo.pas',
  Classe.Serealizador.Objeto in 'Classe.Serealizador.Objeto.pas',
  Form.NASA.API in 'Form.NASA.API.pas' {frmNASAAPI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmMAsterDetail, frmMAsterDetail);
  Application.CreateForm(TfrmREST, frmREST);
  Application.CreateForm(TfrmExportador, frmExportador);
  Application.CreateForm(TfrmNASAAPI, frmNASAAPI);
  Application.Run;
end.
