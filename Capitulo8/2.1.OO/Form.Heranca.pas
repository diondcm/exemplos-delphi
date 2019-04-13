unit Form.Heranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmHeranca = class(TForm)
    SpeedButton1: TSpeedButton;
    MemoLog: TMemo;
    ButtonClassMethods: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ButtonClassMethodsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHeranca: TfrmHeranca;

implementation

{$R *.dfm}

type
  TMamifero = class
  private
    FPeriodoGestacao: Integer;
  public
    procedure Respirar; virtual; abstract;
    property PeriodoGestacao: Integer read FPeriodoGestacao write FPeriodoGestacao;
  end;

  TBaleia = class(TMamifero)
  public
    procedure Respirar; override;
    procedure Nadar; // não é virtual
  end;

  TBaleiaAzul = class(TBaleia)
  private
    class var
      FTempoMedioVida: Integer;
   //não encerra aki
  private // encerra aki, em ujm novo escopo de visibilidade ou método
    FIdade: Integer;
  public
    procedure Respirar; override;
    procedure Sonar;
    property Idade: Integer read FIdade write FIdade;
    class property TempoMedioVida: Integer read FTempoMedioVida write FTempoMedioVida;
  end;

  TJubarte = class(TBaleia)
  public
    procedure Respirar; override;
  end;

  TMorcego = class(TMamifero)
  public
//    procedure Respirar; override; overload;
    procedure Respirar(pTempo: Integer); reintroduce;// overload;
  end;

procedure TfrmHeranca.ButtonClassMethodsClick(Sender: TObject);
var
  lWilly, lPereira: TBaleiaAzul;
begin
  TBaleiaAzul.TempoMedioVida := 150;

  lWilly := TBaleiaAzul.Create;
  MemoLog.Lines.Insert(0, 'Willy Idade: ' + lWilly.Idade.ToString + ' TempoVida: ' + lWilly.TempoMedioVida.ToString);
  lWilly.Idade := 80;
  MemoLog.Lines.Insert(0, 'Willy Idade: ' + lWilly.Idade.ToString + ' TempoVida: ' + lWilly.TempoMedioVida.ToString);

  lPereira := TBaleiaAzul.Create;
  MemoLog.Lines.Insert(0, 'Pereira Idade: ' + lPereira.Idade.ToString + ' TempoVida: ' + lPereira.TempoMedioVida.ToString);
  lPereira.Idade := 120;
  MemoLog.Lines.Insert(0, 'Pereira Idade: ' + lPereira.Idade.ToString + ' TempoVida: ' + lPereira.TempoMedioVida.ToString);

  // Crisprs - gerado virus

  TBaleiaAzul.TempoMedioVida := 50;
  MemoLog.Lines.Insert(0, 'Pereira Idade: ' + lPereira.Idade.ToString + ' TempoVida: ' + lPereira.TempoMedioVida.ToString);
  MemoLog.Lines.Insert(0, 'Willy Idade: ' + lWilly.Idade.ToString + ' TempoVida: ' + lWilly.TempoMedioVida.ToString);

  lWilly.Free;
  lPereira.Free;
end;

procedure TfrmHeranca.SpeedButton1Click(Sender: TObject);
var
  lMorcegao: TMorcego;
  lBaleia: TBaleia;
begin
  MemoLog.Lines.Insert(0, TBaleia.ClassName);


//  TObject.Create
//  TComponent.Create();

//  TMamifero.Create; // não existe, pois Mamifero é abstrato

  lMorcegao := TMorcego.Create;
  lBaleia := TJubarte.Create;
  MemoLog.Lines.Insert(0, lBaleia.ClassName);


//  lMorcegao.PeriodoGestacao
  lMorcegao.Respirar(2);
  lBaleia.Respirar;
  lBaleia.Nadar;
//  TBaleiaAzul(lBaleia).Sonar;
  //if lBaleia.ClassName = TBaleiaAzul.ClassName then
  if lBaleia is TBaleiaAzul then
  (lBaleia as TBaleiaAzul).Sonar;

  lMorcegao.Free;
  lBaleia.Free;
end;

{ TBaleia }

procedure TBaleia.Nadar;
begin
  frmHeranca.MemoLog.Lines.Insert(0, 'Baleia Nada');
end;

procedure TBaleia.Respirar;
begin
  frmHeranca.MemoLog.Lines.Insert(0, 'Baleia Respira');
end;

{ TMorcego }

procedure TMorcego.Respirar(pTempo: Integer);
begin
  frmHeranca.MemoLog.Lines.Insert(0, 'Morcego respira');
end;

{ TBaleiaAzul }

procedure TBaleiaAzul.Respirar;
begin
  //inherited;
  frmHeranca.MemoLog.Lines.Insert(0, 'Baleia Azul - Respira');
  inherited;
end;

procedure TBaleiaAzul.Sonar;
begin
  frmHeranca.MemoLog.Lines.Insert(0, 'Comunica via sonar');
end;

{ TJubarte }

procedure TJubarte.Respirar;
begin
  inherited;
  frmHeranca.MemoLog.Lines.Insert(0, 'Jubarte respira');
end;

end.
