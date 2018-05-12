unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Imaging.pngimage, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Classe.QrCode;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    imageQrCode: TImage;
    Label1: TLabel;
    memoDados: TMemo;
    buttonGerar: TButton;
    procedure buttonGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonGerarClick(Sender: TObject);
var
  lMs: TMemoryStream;
  lPng: TPngImage;
begin
  lMs := TMemoryStream.Create;
  lPng := TPngImage.Create;
  try
    TQrCode.Gerar(memoDados.Text, lMS);
    if lMs.Size > 0 then
    begin
      lMs.Position := 0;
      lPng.LoadFromStream(lMs);
      imageQrCode.Picture.Assign(lPng);
    end;
  finally
    lMs.Free;
    lPng.Free;
  end;
end;

end.
