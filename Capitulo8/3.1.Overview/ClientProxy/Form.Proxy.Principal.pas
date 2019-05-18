unit Form.Proxy.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmProxyPrincipal = class(TForm)
    MemoTexto: TMemo;
    ButtonGet: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure ButtonGetClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProxyPrincipal: TfrmProxyPrincipal;

implementation

{$R *.dfm}

uses ClientModuleUnit1;

procedure TfrmProxyPrincipal.Button1Click(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Data server: ' +
    DateTimeToStr(ClientModule1.SMGeralClient.GetDataServer));
end;

procedure TfrmProxyPrincipal.Button2Click(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Versão: ' +
    ClientModule1.SMGeralClient.GetServerVersion);
end;

procedure TfrmProxyPrincipal.Button3Click(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Custo atual: ' +
    CurrToStr(ClientModule1.SMGeralClient.GetServerCost));
end;

procedure TfrmProxyPrincipal.Button4Click(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Obj: ' +
    ClientModule1.SMGeralClient.GetObject.ToString);
end;

procedure TfrmProxyPrincipal.ButtonGetClick(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Total Instancias: ' +
    ClientModule1.SMGeralClient.GetTotalInstancias.ToString);
end;

procedure TfrmProxyPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
