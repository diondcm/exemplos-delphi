unit Teste.Download.Imagem;

interface
uses
  DUnitX.TestFramework, System.Sysutils;

type

  [TestFixture]
  TMyTestObject = class(TObject) 
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestaImagem;
  end;

implementation

uses Classe.Download.Imagem;

procedure TMyTestObject.Setup;
begin
end;

procedure TMyTestObject.TearDown;
begin
end;


procedure TMyTestObject.TestaImagem;
var
  lBx: TDownloadImagem;
begin
  lBx := TDownloadImagem.Create;
  if lBx.BaixarImagemCarro then
  begin
    raise Exception.Create('Error Message');
  end else begin

  end;
  lBx.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.
