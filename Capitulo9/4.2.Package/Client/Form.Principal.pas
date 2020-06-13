unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Hash;

type
  TGetVal = function: Integer; stdcall;
  TSetVal = procedure (pTkn: Integer); stdcall;
  TVisualizaHash = procedure (pHash: PChar); stdcall;

type
  TfrmPrincipal = class(TForm)
    PanelControles: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    MemoResult: TMemo;
    ButtonHash: TButton;
    OpenDialog: TOpenDialog;
    ButtonDll: TButton;
    ButtonDinâmico: TButton;
    ButtonDLLVar: TButton;
    ButtonVisualiza: TButton;
    ButtonBPLForm: TButton;
    procedure ButtonHashClick(Sender: TObject);
    procedure ButtonDllClick(Sender: TObject);
    procedure ButtonDinâmicoClick(Sender: TObject);
    procedure ButtonDLLVarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonVisualizaClick(Sender: TObject);
    procedure ButtonBPLFormClick(Sender: TObject);
  private
    FDLL: THandle;
  public
    { Public declarations }
  end;

  function GeraHashArquivo(pNomeArq: PChar): PChar; stdcall;
  function GetDLLVersion: Integer; stdcall;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}



// Estático
function GeraHashArquivo; external '..\..\..\dll\Win32\Debug\HashGen.dll' name 'GeraHashArquivo' delayed;
function GetDLLVersion: Integer; external '..\..\..\dll\Win32\Debug\HashGen.dll' name 'GetDLLVersion' delayed;

//function GeraHashArquivo; external 'C:\Users\Public\Documents\Embarcadero\Studio\21.0\Bpl\pkgGeraHash.bpl' name 'GeraHashArquivo'; //delayed;
//function GetDLLVersion: Integer; external 'C:\Users\Public\Documents\Embarcadero\Studio\21.0\Bpl\pkgGeraHash.bpl' name 'GetDLLVersion';// delayed;

procedure TfrmPrincipal.ButtonBPLFormClick(Sender: TObject);
var
  lFrmClass: TPersistentClass;
  lFrm: TForm;
  lBpl: Cardinal;
  lClasse: string;
begin
  lBpl := LoadPackage('C:\Users\Public\Documents\Embarcadero\Studio\21.0\Bpl\pkgGeraHash.bpl');
  try
    lClasse := 'TfrmVisualizaHash';
    lFrmClass := GetClass(lClasse);
    if Assigned(lFrmClass) then
    begin
      lFrm := TForm(TComponentClass(lFrmClass).Create(Application));
      var lbl: TStaticText := TStaticText(lFrm.FindComponent('StaticTextHash'));
      lbl.Caption := GeraHashArquivo(PChar(ParamStr(0)));
      lFrm.ShowModal;
      lFrm.Free;
    end else begin
      ShowMessage('Classe ' + lClasse +  ' não localizada.');
    end;
  finally
    UnloadPackage(lBpl);
  end;
end;

procedure TfrmPrincipal.ButtonDinâmicoClick(Sender: TObject);
type
  TFuncGeraHash = function(pArq: PChar): PChar; stdcall;
var
  hDLL: HMODULE;
  lProc: TFuncGeraHash;
begin
  hDLL := LoadLibrary('..\..\..\dll\Win32\Debug\HashGen.dll');
  //lBpl := LoadPackage(
  try
    lProc := TFuncGeraHash(GetProcAddress(hDLL, 'GeraHashArquivo'));
    if Assigned(lProc) then
    begin
      if OpenDialog.Execute then
      begin
        MemoResult.Lines.Insert(0, string(lProc(PChar(OpenDialog.FileName))));
      end;
    end;

  finally
    FreeLibrary(hDLL);
    //UnloadPackage(
  end;
end;

procedure TfrmPrincipal.ButtonDllClick(Sender: TObject);
begin
  Caption := IntToStr(GetDLLVersion);

  if OpenDialog.Execute then
  begin
    MemoResult.Lines.Insert(0, string(GeraHashArquivo(PChar(OpenDialog.FileName))));
  end;
end;

procedure TfrmPrincipal.ButtonDLLVarClick(Sender: TObject);
//var
//  hDLL: HMODULE;
begin
  MemoResult.Lines.Insert(0, '--');
//  hDLL := LoadLibrary('..\..\..\dll\Win32\Debug\HashGen.dll');
  try
    var getTkn: TGetVal := TGetVal(GetProcAddress(FDLL, 'GetTokenExecucao'));
    var setTkn: TSetVal := TSetVal(GetProcAddress(FDLL, 'SetTokenExecucao'));

    if Assigned(getTkn) and Assigned(setTkn) then
    begin
      var i: Integer := getTkn();
      if i = 0 then
      begin
        i := GetTickCount;
        MemoResult.Lines.Insert(0, 'Gerado tkn: ' + i.ToString);
        setTkn(i);
        MemoResult.Lines.Insert(0, 'Setado tkn: ' + i.ToString);
      end else begin
        MemoResult.Lines.Insert(0, 'tkn: ' + i.ToString);
      end;
    end;
  finally
//    FreeLibrary(hDLL);
  end;
end;

procedure TfrmPrincipal.ButtonHashClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    var stm: TStringStream := TStringStream.Create;
    stm.LoadFromFile(OpenDialog.FileName);

    MemoResult.Lines.Insert(0, THashSHA1.GetHashString(stm.DataString));
    stm.Free;

    MemoResult.Lines.Insert(0, THashSHA1.GetHashStringFromFile(OpenDialog.FileName));
  end;
end;

procedure TfrmPrincipal.ButtonVisualizaClick(Sender: TObject);
begin
//  TVisualizaHash
  var vh: TVisualizaHash := TVisualizaHash(GetProcAddress(FDLL, 'VisualizaHash'));

  if Assigned(vh) then
  begin
    vh(GeraHashArquivo(PChar(ParamStr(0))));
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FDLL := LoadLibrary('..\..\..\dll\Win32\Debug\HashGen.dll');
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeLibrary(FDLL);
end;

end.
