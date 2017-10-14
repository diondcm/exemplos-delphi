unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.BioLife;

type
  TfrmPrincipal = class(TForm)
    buttonCriaObjetos: TButton;
    memoPropriedades: TMemo;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure buttonCriaObjetosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FMamifero: TMamifero;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
//  if Assigned(FMamifero) then
//  begin
    memoPropriedades.Lines.Add('Nome do mamífero: ' + (FMamifero as TCao).Nome);
    FMamifero.ListaPropriedades(memoPropriedades.Lines);
//  end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  lCao: TCao;
begin
//  if Assigned(FMamifero) then
//  begin
    lCao := (FMamifero as TCao);
    lCao.DiasDeGestacao := StrToInt(Edit1.Text);
//  end;
end;

procedure TfrmPrincipal.buttonCriaObjetosClick(Sender: TObject);
var
//  lStr: string;
//  lCodigo: Integer;
//  lCodStr: Integer;
  lMamifero: TMamifero;
  lCao: TCao;
begin
  lMamifero := TMamifero.Create;
  try
    lMamifero.DiasDeGestacao := 0;
    lMamifero.PeriodoAmamentacao := 0;
    lMamifero.ListaPropriedades(memoPropriedades.Lines);
  finally
    lMamifero.Free;
  end;

  lCao := TCao.Create;
  try
//    lCodStr := lCodigo;
//    memoPropriedades.Lines.Add('Valor: ' + lCodStr.ToString);
//    memoPropriedades.Lines.Add('Str: ' + lStr);
//    memoPropriedades.Lines.Add('Dias antes: ' + IntToStr(lCao.DiasDeGestacao));
//    memoPropriedades.Lines.Add(Format('Cão: $%p', [@lCao]));

    lCao.DiasDeGestacao := 4*30;
    lCao.PeriodoAmamentacao := 6*30;
    lCao.Nome := 'Perro';
    lCao.ListaPropriedades(memoPropriedades.Lines);
  finally
    lCao.Free;
  end;

//  lCao.DiasDeGestacao := 400;
//  lCao.ListaPropriedades(memoPropriedades.Lines);


 // if Assigned(FMamifero) then // FMamifero <> nil
 //   FMamifero.Free;

//  FMamifero := TCao.Create;
  (FMamifero as TCao).Nome := 'Teste';
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//  Variant := 1121;
//  OleVariant := Unassigned;

  {$IFDEF DEBUG }
  //if DebugHook > 0 then // Platform - Windows
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  FMamifero := TCao.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FMamifero.Free;
end;

end.
