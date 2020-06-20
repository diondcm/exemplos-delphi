program testePanelObrigatorio;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Classe.Card.Viewer in '..\CardViewer\Classe.Card.Viewer.pas',
  Form.Card.Visualiza.Imagem in '..\CardViewer\Form.Card.Visualiza.Imagem.pas' {frmVisualizaCard};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
