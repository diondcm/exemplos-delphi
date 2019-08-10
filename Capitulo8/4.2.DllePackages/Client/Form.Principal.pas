unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditValor1: TEdit;
    Label2: TLabel;
    EditValor2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    EditGet: TEdit;
    EditSet: TEdit;
    Button7: TButton;
    Button8: TButton;
    EditGlobalGet: TEdit;
    EditGlobalSet: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

  // link stático
  function ValorMax(pValA, pValB: Integer): Integer; stdcall; external 'libValorMaximo.dll' name 'ValorMaximo' delayed;

  function ExibeFormValMax: Boolean; stdcall; external 'libValorMaximo.dll' name 'ExibeFormValMax' delayed;

  function getValorClasse: Integer; stdcall; external 'libValorMaximo.dll' name 'getValorClasse' delayed;
  procedure setValorClasse(pValor: Integer); stdcall; external 'libValorMaximo.dll' name 'setValorClasse' delayed;

  function getValorGlobal: Integer; stdcall; external 'libValorMaximo.dll' name 'getValorGlobal' delayed;
  procedure setValorGlobal(pValor: Integer); stdcall; external 'libValorMaximo.dll' name 'setValorGlobal' delayed;


implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  Caption := 'Máx: ' + IntToStr(ValorMax(StrToIntDef(EditValor1.Text, 0), StrToIntDef(EditValor2.Text, 0)))
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  ExibeFormValMax;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
type
  TValMaxProc = function: Boolean; stdcall;
var
  lhDLL: HMODULE;
  lProc: TValMaxProc;
begin
  lhDLL := LoadLibrary('libValorMaximo.dll');
  //lBpl := LoadPackage(
  try
    lProc := TValMaxProc(GetProcAddress(lhDLL, 'ExibeFormValMax'));

    if Assigned(lProc) then
    begin
      lProc;
    end;

  finally
    FreeLibrary(lhDLL);
    //UnloadPackage(
  end;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
var
  lFrmClass: TPersistentClass;
  lFrm: TForm;
  lBpl: Cardinal;
  lClasse: string;
begin
  lBpl := LoadPackage('pkgValorMin.bpl');
  try
    lClasse := 'TfrmValorMin';
    lFrmClass := GetClass(lClasse);
    if Assigned(lFrmClass) then
    begin
      lFrm := TForm(TComponentClass(lFrmClass).Create(Application));
      lFrm.ShowModal;
      lFrm.Free;
    end else begin
      ShowMessage('Classe ' + lClasse +  ' não localizada.');
    end;
  finally
    UnloadPackage(lBpl);
  end;
end;

procedure TfrmPrincipal.Button5Click(Sender: TObject);
begin
  EditGet.Text := IntToStr(getValorClasse);
end;

procedure TfrmPrincipal.Button6Click(Sender: TObject);
begin
  setValorClasse(StrToInt(EditSet.Text));
end;

procedure TfrmPrincipal.Button7Click(Sender: TObject);
begin
  EditGlobalGet.Text := IntToStr(getValorGlobal);
end;

procedure TfrmPrincipal.Button8Click(Sender: TObject);
begin
  setValorGlobal(StrToInt(EditGlobalSet.Text));
end;

end.
