unit Form.Paravras.Reserv;

interface

//type
//  Teste = type integer;

//const
//  TEXTO = '';

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ComObj {, Nome_da_dcu (* Search path- ou da app ou do Delphi, onde esta a dcu *)} ;

threadvar
  T_Valor: Integer;

type
  //IReconheceImagem = interface(IInterface)
  IReconheceImagem = interface
  ['{74CAEFAA-FD70-4D6E-9F15-CD9BBE4B107E}']
    function TemPessoa(pArr: array of Integer{BitMap}): Boolean;
  end;

  TReconheceFaceBook = class(TInterfacedObject, IReconheceImagem)
  public
    function TemPessoa(pArr: array of Integer): Boolean;
  end;

  TReconheceWatson = class(TInterfacedObject, IReconheceImagem)
  public
    function TemPessoa(pArr: array of Integer): Boolean;
  end;

  PfrmPalavras = ^TfrmPalavras;

  MClass = class
  end;

  TfrmPalavras = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    buttonInterface: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure buttonInterfaceClick(Sender: TObject);
  protected
    procedure ActiveChanged; override;
  private
    Fnome: string;
    FSaldo: Integer;
    { Private declarations }
  public
    procedure SomaValores(A: integer; B: Integer = -1);

    procedure ExpandeoCodigo; inline;

    procedure NaoPodeHerdar;
    procedure PodeHerdar_VMT; virtual;// Mais rápido
    procedure PodeHerdar_DMT; dynamic;// Mais memória
//    procedure PodeHerdar_DMT; static;
    class procedure PordeHerdar_Class; static;

    property nome: string read Fnome write Fnome;

  end;

  procedure ExportaCodigo2(pRetorno: Integer); overload; deprecated 'Utilizar o método: ExportarCodigo';
  procedure ExportaCodigo2(pRetorno: Cardinal); overload; platform;


  procedure ExportaCodigo(var pRetorno: Integer); overload;
  procedure ExportaCodigo(var pRetorno: Cardinal); overload;
  procedure ExportaCodigo(var pRetorno: Double); overload;



  function AbortSystemShutdown2: Integer; stdcall; assembler;


  function GetReconheceImagem: IReconheceImagem;

//  exports
//    ExportaCodigo name 'TesteFunc1';

var
  frmPalavras: TfrmPalavras;

implementation

{$R *.dfm}


function GetReconheceImagem: IReconheceImagem;
begin
  //Result := TReconheceFaceBook.Create;
  //Result := TReconheceWatson.Create;
end;


procedure ExportaCodigo2(pRetorno: Integer);
begin

end;

procedure ExportaCodigo2(pRetorno: Cardinal);
begin

end;


procedure ExportaCodigo(var pRetorno: Double);
begin

end;

procedure ExportaCodigo(var pRetorno: Cardinal);
begin

end;

{$WARNINGS OFF}
function AbortSystemShutdown2; external 'MinhaDll' name 'AbortSystemShutdownW' delayed;
{$WARNINGS ON}

function FormataCodigo(pCod: Integer): Integer; forward;

procedure ExportaCodigo(var pRetorno: Integer);
begin
  //raise Exception.Create('Error Message');
  pRetorno := FormataCodigo(-15);

end;

function FormataCodigo(pCod: Integer): Integer;
begin
  Result := pCod;
//  ExportaCodigo(Result);
end;

function CriaObjeto(pCompClass: TComponentClass {pClasse: TClass}): TObject;
begin
  //if pNomeObjeto = TButton.ClassName then
  Result := pCompClass.Create(Application);
end;

procedure teste;
asm
  //
end;

//{$J+}
//const
//  Const_Tip: string = 'Teste';

//{$J+}
const
  const_nao_tip = 'Teste' + 'Valor';
  outras = 'Teste' + const_nao_tip;
  MINUTOS_POR_DIA = 60*24;


var
  var_tip: string = 'Teste';


resourcestring
  STRING_DE_TESTE = 'Teste';

type
  IInterf = dispinterface { Shift - Ctrl - G}
  ['{B5AD3760-0267-495B-9D22-A9E89BEC3384}']
  end;

procedure TfrmPalavras.ActiveChanged;
begin
  inherited;
end;

procedure TfrmPalavras.Button1Click(Sender: TObject);
begin
  AbortSystemShutdown2;
end;

procedure TfrmPalavras.Button2Click(Sender: TObject);
begin
  SomaValores(0, 0);
end;

procedure TfrmPalavras.Button3Click(Sender: TObject);
var
  lStr: string;
  lAnsiStr: AnsiString;
begin
//  with Button2 do
//  begin
//    Caption  := '25';
//    Tag := -1;
//    FormStyle := TFormStyle.fsNormal;
//    DestroyWnd;
//  end;


  Memo1.Clear;
  lStr := 'Teste';

  Memo1.Lines.Add('');
  Memo1.Lines.Add('"' + lStr + '"');
  Memo1.Lines.Add('Size of Char: ' + IntTOStr(SizeOf(lStr[1])));
  Memo1.Lines.Add('Len: ' + IntTOStr(Length(lStr)));
  Memo1.Lines.Add('Tamanho Tot: ' + IntTOStr(Length(lStr) * SizeOf(lStr[1])));

  lAnsiStr := AnsiString(lStr);

  Memo1.Lines.Add('');
  Memo1.Lines.Add('"' + string(lAnsiStr) + '"');
  Memo1.Lines.Add('Size of Char: ' + IntTOStr(SizeOf(lAnsiStr[1])));
  Memo1.Lines.Add('Len: ' + IntTOStr(Length(lAnsiStr)));
  Memo1.Lines.Add('Tamanho Tot: ' + IntTOStr(Length(lAnsiStr) * SizeOf(lAnsiStr[1])));
end;

procedure TfrmPalavras.buttonInterfaceClick(Sender: TObject);
var
  lRec: IReconheceImagem;
  lArr: array [0..10] of integer;
begin
  lRec := GetReconheceImagem;
//  {$C-}
  Assert(assigned(lRec), 'Não retornado objeto na interface Rec imagem');

//  if not Assigned(lRec) then
//    raise Exception.Create('Sem interface configurada');

  if lRec.TemPessoa(lArr) then
  begin
    ShowMessage('Pessoa identificada');
  end else begin
    ShowMessage('Sem Pessoa');
  end;
end;

procedure TfrmPalavras.ExpandeoCodigo;
begin
  ExportaCodigo2(0);
  // código aki, não deve ter fors(loops), e será clonado pela aplicação
end;

procedure TfrmPalavras.FormCreate(Sender: TObject {Self:  TfrmPalavras});
  function {nested} Teste: Integer;
  begin
    Result:=Random(100000);
  end;

var
  Val1, Val2: Integer;
  lArr: array [0..5] of Integer;
  lFontVal: TFontStyles;
  lBtn: TButton;
  I: Integer;

type Func = function(X: Integer): Integer;



var
  F: Func;
  P: Pointer;
  N: Integer;

  lVarOle: OleVariant;
begin
//  FreeAndNil();
//  Delete();
//  format

  ExpandeoCodigo;// por todo o código na func
  ExpandeoCodigo;
  ExpandeoCodigo;
//  STRING_DE_TESTE := '';
//  for I := Low(lArr) to High(lArr) do
//    for I := 0 to Pred(lArr){-1} do

//  for I := 0 to 1000 do
//  begin
//    Qual o primeiro valor de I?
//     Depende
//  end;

//  if not True then
//  begin
//    Faz algo;
//    ShowMess;
//  end;
//
//
//
//  if lValor = 9 then CopiaValor(10);
//  ResetaValor(0);

//  if True then
//  begin
//    if True then
//    begin
//      // >>
//    end else
//      Func1;
//  end;
//
//  try
//  Ex1
//  except
//    rasie
//    Ex1
//     Ex2
//  end


//  raise TButton.Create(nil);
//  raise Button1;

//  raise Exception.Create('Error Message') at @self;
//  Exception.Create().InnerException;


//  lVarOle := CreateOleObject('IExplorer');
//  lVarOle.Nome := 'Teste';
//  lVarOle := Unassigned;


//  EmptyStr := 'FF';
//  if EmptyStr = Caption then
//  begin

//  end;

  var_tip := '111';
//  Const_Tip := '111';

  begin
    begin
    end;
  end;
  asm
    mov eax, edx
  end;

//  lBtn := CriaObjeto('TButton' {TNFe TNFSe TCTe}) as TButton;
  lBtn := CriaObjeto(TButton) as TButton;
  lBtn.Parent := Self;
  lBtn.Caption := IntToStr(Teste);

//  lBtn := CriaObjeto(TLabel) as TLabel;
//  lBtn.Parent := Self;
//  lBtn.Caption := IntToStr(Teste);
//

//  F := Func(P);     { Assign procedural value in P to F }
//  Func(P) := F;     { Assign procedural value in F to P }
//  @F := P;          { Assign pointer value in P to F }
//  P := @F;          { Assign pointer value in F to P }
//  N := F(N);        { Call function via F }
//  N := Func(P)(N);  { Call function via P }
// Testar pontero da variável da função: @@N

//  lFontVal := Button1.Font.Style;
//  Insert(fsBold, lFontVal, 0);
//  Button1.Font.Style := lFontVal;

  Val1 := 10;
  Val2 := 5;

//  lArr[Val1] := 9;

  Tag := Val1 xor Val2;


  if Sender is TButton  then
  begin
    TfrmPalavras(Sender).Caption := '';
    (Sender as TButton).Caption;
  end;

  Caption :=  IntToStr(Tag) + '  '#67' Teste '#13' Outro ' + IntToStr(Integer(@Self)) + ' - ' + Format('$%p', [@Self]);  // sLineBreak
  // []
  //(. .)

  (*


  { Tag := $fff; }


  *)
end;

procedure TfrmPalavras.NaoPodeHerdar;
begin

end;

procedure TfrmPalavras.PodeHerdar_DMT;
begin

end;

procedure TfrmPalavras.PodeHerdar_VMT;
begin

end;

class procedure TfrmPalavras.PordeHerdar_Class;
begin

end;

procedure TfrmPalavras.SomaValores;
  function  Valor1: Integer;
  begin
    Result  := -15;
    ShowMessage('1');
  end;

  function Valor2: Integer;
  begin
    Result := 10;
    ShowMessage('2');
  end;

var
  lFloat: Extended;
begin
//  lFloat := 0.5 div 3.1;

 // Da esquerda para a Direita >>>
//  if Valor1 = Valor2 then
//  begin
//    Caption := 'Valores Igais';
//  end;

//  if Min(Valor1, Valor2) > 0 then
//  begin
//    Caption := 'Valores Igais';
//  end;
end;

{ TReconheceFaceBook }

function TReconheceFaceBook.TemPessoa(pArr: array of Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Low(pArr) to High(pArr) do
  begin
    if pArr[i] > 10 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

{ TReconheceWatson }

function TReconheceWatson.TemPessoa(pArr: array of Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Low(pArr) to High(pArr) do
  begin
    if pArr[i] = 55 then
    begin
      Result := True;
      Break;
    end;
  end;
end;

end.
