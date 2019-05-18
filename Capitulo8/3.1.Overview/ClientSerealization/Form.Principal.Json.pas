unit Form.Principal.Json;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Classe.Pessoa, Vcl.StdCtrls, REST.JSon;

type
  TfrmPrincipalJson = class(TForm)
    Button1: TButton;
    MemoJson: TMemo;
    Button2: TButton;
    MemoObj: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalJson: TfrmPrincipalJson;

implementation

{$R *.dfm}

procedure TfrmPrincipalJson.Button1Click(Sender: TObject);
var
  lPessoa: TPessoa;
begin
  lPessoa := TPessoa.Create;
  lPessoa.Nome := 'fads  dsfasdf';
  lPessoa.ID := GetTickCount;
  lPessoa.DataNascimento := Now;
  lPessoa.Credito := Random(23413423);

  MemoJson.Text := TJson.ObjectToJsonString(lPessoa);
end;

procedure TfrmPrincipalJson.Button2Click(Sender: TObject);
var
  lPessoa: TPessoa;
begin
  lPessoa := TJson.JsonToObject<TPessoa>(MemoJson.Text);

  MemoObj.Lines.Add('Nome: ' + lPessoa.Nome);
  MemoObj.Lines.Add('ID: ' + lPessoa.ID.ToString);
  MemoObj.Lines.Add('Dt Nasc: ' + DateTimeToStr(lPessoa.DataNascimento));
  MemoObj.Lines.Add('Credito: ' + CurrToStr(lPessoa.Credito));
end;

end.
