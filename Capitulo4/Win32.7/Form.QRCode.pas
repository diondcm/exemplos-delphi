unit Form.QRCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Imaging.pngimage, System.NetEncoding,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Classe.Gera.QRCode, System.Json, DateUtils;

type
  TfrmQRCode = class(TForm)
    imageQRCode: TImage;
    panelControles: TPanel;
    labelDados: TLabel;
    memoDados: TMemo;
    panelTamanhoQR: TPanel;
    editWidth: TEdit;
    editHeight: TEdit;
    labelPercentualCorrecao: TLabel;
    comboPercentualCorrecao: TComboBox;
    buttonGerarQRCode: TBitBtn;
    labelTamanhoImagem: TLabel;
    panelEncode: TPanel;
    Label1: TLabel;
    panelInfos: TPanel;
    buttonGerarInfos: TButton;
    checkBase64: TCheckBox;
    checkSHA1: TCheckBox;
    procedure buttonGerarQRCodeClick(Sender: TObject);
    procedure buttonGerarInfosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQRCode: TfrmQRCode;

implementation

{$R *.dfm}

procedure TfrmQRCode.buttonGerarInfosClick(Sender: TObject);
var
  lJson: TJSONObject;
begin
  lJson := TJsonObject.Create;
  lJson.AddPair('ID', '43232');
  lJson.AddPair('ProdID', '123123');
  lJson.AddPair('Qtd', '4');
  lJson.AddPair('Created', DateToISO8601(Now, False));
  memoDados.Text := lJson.ToString;
  lJson.Free;
end;

procedure TfrmQRCode.buttonGerarQRCodeClick(Sender: TObject);
var
  lMs: TMemoryStream;
  lPng: TPngImage;
  lWidth: Integer;
  lHeight: Integer;
  lDados: string;
  lEncode: TQRCode.TDataEncodes;
begin
  if Assigned(imageQRCode.Picture) then
  begin
    imageQRCode.Picture := nil;
  end;

  if not TryStrToInt(editWidth.Text, lWidth) then
  begin
    raise Exception.Create('Width informado não é um número válido.');
  end;

  if not TryStrToInt(editHeight.Text, lHeight) then
  begin
    raise Exception.Create('Height informado não é um número válido.');
  end;

  lMs := TMemoryStream.Create;
  lPng := TPngImage.Create;
  try
    if checkBase64.Checked then
    begin
      Include(lEncode, TQRCode.TDataEncode.Base64);
    end;

    if checkSHA1.Checked then
    begin
      Include(lEncode, TQRCode.TDataEncode.SHA1);
    end;

    TQRCode.Gerar(lWidth, lHeight, TQRCode.TErrorCorrection(comboPercentualCorrecao.ItemIndex), lEncode, lDados, lMs);
    if lMs.Size > 0 then
    begin
      lMs.Position := 0;
      lPng.LoadFromStream(lMs);
      imageQRCode.Picture.Assign(lPng);
    end;
  finally
    lMs.Free;
    lPng.Free;
  end;
end;

end.
