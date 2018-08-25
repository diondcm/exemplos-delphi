program Lista;

uses
  Vcl.Forms,
  Form.Principal.Lista in 'Form.Principal.Lista.pas' {frmLista};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLista, frmLista);
  Application.Run;
end.
