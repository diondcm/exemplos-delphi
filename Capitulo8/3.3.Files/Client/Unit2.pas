unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ClientModuleUnit1, Vcl.Imaging.pngimage, Vcl.ExtDlgs;

type
  TForm2 = class(TForm)
    PanelDownLoad: TPanel;
    Panel1: TPanel;
    ButtonGetImagem: TButton;
    Button1: TButton;
    ImageLogo: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    ImageUpLoad: TImage;
    Label2: TLabel;
    Panel3: TPanel;
    Button2: TButton;
    OpenPictureDialog: TOpenPictureDialog;
    procedure ButtonGetImagemClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  lOut: Int64;
begin
  ImageLogo.Picture.LoadFromStream(ClientModule1.ServerMethods1Client.GetFile('LOGO_CLIENTE', lOut));
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  lStrStm: TStringStream;
begin
  if OpenPictureDialog.Execute then
  begin
    ImageUpLoad.Picture.LoadFromFile(OpenPictureDialog.FileName);
    lStrStm := TStringStream.Create;
    ImageUpLoad.Picture.SaveToStream(lStrStm);

    if ClientModule1.ServerMethods1Client.SetFile('LOGO_CLIENTE', 'normal', lStrStm) > 0 then
    begin
      ShowMessage('Enviado com sucesso!');
    end;
  end;
end;

procedure TForm2.ButtonGetImagemClick(Sender: TObject);
var
  lStm: TStream;
  lOut: Int64;
  lStrStm: TStringStream;
  lImg: string;
  lPng: TPngImage;
begin
  lStrStm := TStringStream.Create;
  lPng := TPngImage.Create;
  try
    lImg := ExtractFilePath(ParamStr(0)) + 'logo_local.png';
    System.SysUtils.DeleteFile(lImg);

    lStm := ClientModule1.ServerMethods1Client.GetFile('LOGO_CLIENTE', lOut);

    lPng.LoadFromStream(lStm);
    ImageLogo.Picture.Assign(lPng);

//  lStrStm.LoadFromStream(lStm);
//  lStrStm.Position := 0;
//  lStrStm.SaveToFile(lImg);
//  lPng.LoadFromFile(lImg);
//  ImageLogo.Picture.Assign(lPng);
  except
    // Nope -> ShowMessage('Deu erro');
    // nunca sem tratar
  end;

  lStrStm.Free;
  lPng.Free;
end;

end.
