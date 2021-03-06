unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Zip, System.IOUtils;

type
  TfrmPrincipal = class(TForm)
    ButtonTesteDebug: TButton;
    ButtonZip: TButton;
    Button2: TButton;
    Button3: TButton;
    ButtonExtract: TButton;
    procedure ButtonTesteDebugClick(Sender: TObject);
    procedure ButtonZipClick(Sender: TObject);
    procedure ButtonExtractClick(Sender: TObject);
  private
    const
      BASE_PATH = 'C:\Users\Instrutor01\Desktop\ArqRemoteDebug\';
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

 uses Classe.Remote.Debug, Classe.Helper.ZipFile;

procedure TfrmPrincipal.ButtonExtractClick(Sender: TObject);
//var
//  lZip: TZipFile;
begin
//  lZip := TZipFile.Create;
//
//  lZip.Open(BASE_PATH + 'rmtdbg260.zip', zmRead);
//  lZip.ExtractAll(BASE_PATH +'teste\');
//
//  lZip.Free;

  TZipFile.DeszippaArquivos(BASE_PATH + 'rmtdbg260.zip');
end;

procedure TfrmPrincipal.ButtonTesteDebugClick(Sender: TObject);
var
  lVal: Integer;
begin
  lVal  := Random(10000);
  var lVal2: Integer := Random(100);
  var lResultado: Integer := lVal div lVal2;

  Caption := lResultado.ToString;

  ShowMessage(lResultado.ToString);

  for var i: Integer := 0 to 100 do
  begin

  end;
end;

procedure TfrmPrincipal.ButtonZipClick(Sender: TObject);
//var
//  lZip: TZipFile;
begin
//  lZip := TZipFile.Create;
//
//  lZip.Open(BASE_PATH + 'rmtdbg260.zip', zmWrite);
//
//  lZip.Add(BASE_PATH + 'dcc32260.dll');
//  lZip.Add(BASE_PATH + 'comp32x.dll');
//  lZip.Add(BASE_PATH + 'bordbk260.dll');
//  lZip.Add(BASE_PATH + 'bordbk260N.dll');
//  lZip.Add(BASE_PATH + 'bccide.dll');
//  lZip.Add(BASE_PATH + 'rmtdbg260.exe');
//
//  lZip.Close;
//
//  lZip.Free;

  TZipFile.ZippaArquivos(BASE_PATH + 'rmtdbg260.zip',
    [BASE_PATH + 'dcc32260.dll',
     BASE_PATH + 'comp32x.dll',
     BASE_PATH + 'bordbk260.dll',
     BASE_PATH + 'bordbk260N.dll',
     BASE_PATH + 'bccide.dll',
     BASE_PATH + 'rmtdbg260.exe']);

//  Buscar todos arquivos de uma pasta:
//  TDirectory.GetFiles(BASE_PATH)

//  modelo helpers
//  TZipFile.CriaArquivo(pArquivo, Tstrings = lista, Arr[Arquivs..)
//  TzipFile.Descompactar(pArquivo, pCriarPasta: Bool = False)
end;

end.
