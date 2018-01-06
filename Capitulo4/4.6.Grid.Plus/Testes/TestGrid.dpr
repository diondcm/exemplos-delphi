program TestGrid;

uses
  Vcl.Forms,
  Form.Teste.Grid in 'Form.Teste.Grid.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
