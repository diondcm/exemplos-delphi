program CubeTest;

uses
  Vcl.Forms,
  Form.Cube in 'Form.Cube.pas' {frmCube},
  Data.Cube in 'Data.Cube.pas' {dmdCube: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCube, frmCube);
  Application.CreateForm(TdmdCube, dmdCube);
  Application.Run;
end.
