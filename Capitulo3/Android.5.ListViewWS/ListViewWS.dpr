program ListViewWS;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Types,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Menu in 'Form.Menu.pas' {frmMenu},
  Classes.Custom.Adapter in 'Classes.Custom.Adapter.pas',
  Form.Imagem in 'Form.Imagem.pas' {frmImagem};

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmImagem, frmImagem);
  //  VKAutoShowMode := TVKAutoShowMode.Always;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
