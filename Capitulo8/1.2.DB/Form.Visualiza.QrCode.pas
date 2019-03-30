unit Form.Visualiza.QrCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Classe.QrCode;

type
  TfrmVIsualizaQrCode = class(TForm)
    PanelDados: TPanel;
    Label1: TLabel;
    MemoDados: TMemo;
    ButtonGerar: TButton;
    ImageQrCode: TImage;
    procedure ButtonGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVIsualizaQrCode: TfrmVIsualizaQrCode;

implementation

{$R *.dfm}

procedure TfrmVIsualizaQrCode.ButtonGerarClick(Sender: TObject);
var
  lMS: TMemoryStream;
  lPng: TPngImage;
begin
  lMS := TMemoryStream.Create;
  lPng := TPngImage.Create;
  try
    TQrCode.Gerar(MemoDados.Text, lMS);
    if lMS.Size > 0 then
    begin
      lMS.Position := 0;
      lPng.LoadFromStream(lMS);
      ImageQrCode.Picture.Assign(lPng);
    end;
  finally
    lMs.Free;
    lPng.Free;
  end;
end;

end.
