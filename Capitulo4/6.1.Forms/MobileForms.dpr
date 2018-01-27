program MobileForms;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Tabs in 'Form.Tabs.pas' {frmTabs},
  Form.Menus in 'Form.Menus.pas' {frmMenus},
  Form.Lista in 'Form.Lista.pas' {frmLista};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTabs, frmTabs);
  Application.CreateForm(TfrmMenus, frmMenus);
  Application.CreateForm(TfrmLista, frmLista);
  Application.Run;
end.
