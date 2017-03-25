unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type

//  Modelo antigo, agora sem sigla:
//  TBaralho = (tbCopas = 2, tbEspadas = 5, tbOuros, tbPaus);
  TBaralho = (Copas = 2, Espadas = 5, Ouros, Paus);
  TCartas = set of TBaralho;

//  TData = record
//    Ano: Word;
//    Mes: (Jan, Fev, Mar, Abr, Mai, Jun);
//    Dia: 1..31;
//  end;

  TfrmPrincipal = class(TForm)
    btnExemplos: TButton;
    lbeCalculaDobro: TLabeledEdit;
    btnCalculaDobro: TButton;
    memLog: TMemo;
    procedure btnExemplosClick(Sender: TObject);
    procedure btnCalculaDobroClick(Sender: TObject);
  private
    procedure Teste(Normal: Integer; const NaoPermiteAlt: Integer; var RecebeEEnviaValor: Integer; out SometeSaida: Integer);
    function TesteFunc: Integer;
  public
    // Tipos de parâmetros
    procedure RetornoDobro(var pValor: Integer);
    procedure RetornoDobroOut(out pValor: Integer);
    procedure RetornoDobroFail(pValor: Integer); // Evitar, Ressalva: objetos
    procedure RetornoDobroNaoComp(const pValor: Integer);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCalculaDobroClick(Sender: TObject);
var
  lValor: Integer;
begin
  lValor := StrToInt(lbeCalculaDobro.Text);
//  RetornoDobro(lValor);
//  RetornoDobroOut(lValor);
  RetornoDobroFail(lValor);
  lbeCalculaDobro.Text := IntToStr(lValor);
end;

procedure TfrmPrincipal.btnExemplosClick(Sender: TObject);
var
  lInt: integer;
  lCar: Cardinal;
  lByte: Byte;
  lNatInt: NativeInt;
  lValor: Currency;

  lCr: Char; // 2 Byte(Unicode) -- (Ansi - 1 Byte)
  lTexto: string;//[0: tamanho] [1..]->'AAAAA' // C/C++ -> #0  <-- fim
  lBaralho: TBaralho;
  lCartas: TCartas;

//  lDt: TData;
begin
//  lDt.Ano := 2016;
//  lDt.Mes := Fev;
//  lDt.Dia := 31;

  lBaralho := TBaralho.Copas;
  case lBaralho of
    TBaralho.Copas: memLog.Lines.Add('Copas: ' + IntToStr(Ord(TBaralho.Copas)));
    TBaralho.Espadas: memLog.Lines.Add('Espadas' + IntToStr(Ord(TBaralho.Espadas)));
  end;

  lCartas := [TBaralho.Copas, TBaralho.Espadas];

  lInt := lNatInt.MaxValue; // Deve gerar erro devido a diferença entre NativeInt e Integer em 64 Bits
  lByte := lInt;
  lNatInt := lNatInt.MaxValue;
end;

procedure TfrmPrincipal.RetornoDobro(var pValor: Integer);
begin
  pValor := pValor * 2;
end;

procedure TfrmPrincipal.RetornoDobroFail(pValor: Integer);
begin
  pValor := pValor * 2;
end;

procedure TfrmPrincipal.RetornoDobroNaoComp(const pValor: Integer);
begin

end;

procedure TfrmPrincipal.RetornoDobroOut(out pValor: Integer);
begin
  pValor := pValor * 2;
end;

procedure TfrmPrincipal.Teste;
begin
  Normal := 5;
//  NaoPermiteAlt := 6;

  if RecebeEEnviaValor > 0 then
  begin
    RecebeEEnviaValor := RecebeEEnviaValor * 2;
  end else begin
    RecebeEEnviaValor := -1;
  end;

  SometeSaida := 50;
end;

function TfrmPrincipal.TesteFunc: Integer;
begin
  TesteFunc := 15; // desaconselhado, pode gerar loop infinito
  Result := Result + 5; // result = 20;
end;

end.
