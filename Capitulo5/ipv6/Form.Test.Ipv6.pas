unit Form.Test.Ipv6;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.WebBrowser,
  FMX.ScrollBox, FMX.Memo, FMX.TabControl, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Button1: TButton;
    Edit1: TEdit;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    WebBrowser1: TWebBrowser;
    TabItem2: TTabItem;
    Memo1: TMemo;
    IdHTTP1: TIdHTTP;
    Layout2: TLayout;
    buttonIdHttp: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure buttonIdHttpClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses ClientModuleUnit1;

procedure TForm1.Button1Click(Sender: TObject);
begin
  WebBrowser1.Navigate(Edit1.Text);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  lTeste: string;
begin
  try
    Memo1.Lines.Clear;
    ClientModule1.DSRestConnection1.Host := StringReplace(StringReplace(Edit1.Text, 'http://', '', []), ':8080/', '', []);
    lTeste := ClientModule1.ServerMethods1Client.EchoString('teste');
    Memo1.Lines.Add(lTeste);
  except
    on E: Exception do
    begin
      Memo1.Lines.Add('Erro ao acessar ipv6:');
      Memo1.Lines.Add(E.Message);
    end;
  end;

end;

procedure TForm1.buttonIdHttpClick(Sender: TObject);
var
  lStm: TStringStream;
begin
  Memo1.Lines.Clear;
  lStm := TStringStream.Create;
  IdHTTP1.Get(Edit1.Text, lStm);
  lStm.Position := 0;
  Memo1.Lines.LoadFromStream(lStm);
  lStm.Free;
end;

end.
