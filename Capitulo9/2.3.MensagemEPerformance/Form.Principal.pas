unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Diagnostics, System.DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Mensagem, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Classe.Performance;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ExecutaFor(pNome: string);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
//var
//  lMensagem: TMensagem;
begin
  TMensagem.Aviso('Classe de mensagem');

//  lMensagem := TMensagem.Create;
//  try
//    lMensagem.Aviso('Classe de mensagem');
//  finally
//    lMensagem.Free;
//  end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  if TMensagem.Confirmacao('Confirme?') then
  begin
    TMensagem.Erro('Cancelado pelo usuário', True);
  end;

  TMensagem.Aviso('Não Confirmado');
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
var
  i: Integer;
  lStopCounter: TStopwatch;
  lTotalMS: Int64;
  lTime: TTime;
begin
  lStopCounter := TStopwatch.StartNew;

  { Simula várias linhas lentas }
  for i := 0 to 10 do
  begin
    Sleep(500)
  end;
  { -- }

  lTotalMS := lStopCounter.ElapsedMilliseconds;
  lTime := IncMilliSecond(0, lTotalMS);
  TMensagem.Aviso('Tempo: ' + TimeToStr(lTime));
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  TPerformance.RegistraPeriodo('ButtonClick');

  ExecutaFor('Qry');

  ExecutaFor('Chama Ws');

  ExecutaFor('Gera Arquivo');

  ExecutaFor('Salva DB');

  TMensagem.Aviso(TPerformance.Tempos);
end;

procedure TfrmPrincipal.ExecutaFor(pNome: string);
var
  i: Integer;
  lMax: Integer;
begin
  TPerformance.RegistraPeriodo('Loop - ' + pNome);

  Randomize;
  lMax := Random(10);
  for i := 0 to lMax do
  begin
    Sleep(500);
  end;
end;

end.
