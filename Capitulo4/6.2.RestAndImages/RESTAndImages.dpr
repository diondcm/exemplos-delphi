program RESTAndImages;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Menu in 'Form.Menu.pas' {frmMenu},
  Form.RESTGetImage in 'Form.RESTGetImage.pas' {frmRESTGetImage},
  Form.JSONFromRest in 'Form.JSONFromRest.pas' {frmJSONFromRest};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
