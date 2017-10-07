unit Form.Client.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClientModuleUnit1, Vcl.StdCtrls, Data.DBXJSONCommon,
  Classe.FileTransfer;

type
  TfrmClient = class(TForm)
    btnAtualizar: TButton;
    procedure btnAtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.dfm}

procedure TfrmClient.btnAtualizarClick(Sender: TObject);
var
  lStatus: TStatusFileTransfer;
  lFile: string;
  lVersion: string;
  lStm: TMemoryStream;
  strFileStream: TStream;
begin
  lFile := 'Arq1.exe';
  lVersion := TStatusFileTransfer.GetFileVersion(lFile);
  lStatus := ClientModule1.ServerMethods1Client.GetVersaoAtual(lFile, lVersion);

  if lVersion = lStatus.Versao then
  begin

  end else begin
    // todo: unir com KillTask do exemplo anterior
    lStatus.Arquivo.Position := 0;
    lStm := TMemoryStream.Create;
    try
      strFileStream := TDBXJSONTools.JSONToStream(lStatus.TesteArr);


      lStm.LoadFromStream(strFileStream);
      lStm.Position := 0;
      lStm.SaveToFile(ExtractFilePath(ParamStr(0)) + lFile);
    finally
      lStm.Free;
    end;
    // todo: se necessário, executa novamente
  end;
end;

end.
