unit Form.Principal.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClientModuleUnit1, Vcl.StdCtrls, Classe.Pessoa;

type
  TfrmPrincipal = class(TForm)
    buttonGetPessoa: TButton;
    buttonSetPessoa: TButton;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure buttonGetPessoaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonSetPessoaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.SetPessoa(nil);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.GetCarro(4);
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.GetCarroSemTratamento(4);
end;

procedure TfrmPrincipal.buttonGetPessoaClick(Sender: TObject);
var
  lPessoa: TPessoa;
begin
  lPessoa := ClientModule1.ServerMethods1Client.GetPessoa(3);
//  lPessoa.Free;
end;

procedure TfrmPrincipal.buttonSetPessoaClick(Sender: TObject);
var
  lPess: TPessoa;
begin
  lPess := TPessoa.Create;
  ClientModule1.ServerMethods1Client.SetPessoa(lPess);
  // lPess.Free; >> não fazer, DataSnap destruirá
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
