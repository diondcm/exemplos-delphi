unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    labelXML: TLabel;
    buttonCalculo: TButton;
    buttonDynamic: TButton;
    procedure buttonCalculoClick(Sender: TObject);
    procedure buttonDynamicClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCalculoMedia = procedure (pVal1, pVal2: Integer; var pVal3: Integer); stdcall;

  procedure CalculaMedia(pVal1, pVal2: Integer; var pVal3: Integer); stdcall;


var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure CalculaMedia(pVal1, pVal2: Integer; var pVal3: Integer); external 'ExemploPacote.bpl' name 'CalculaMediaBPL'; // delayed;


procedure TfrmPrincipal.buttonCalculoClick(Sender: TObject);
var
  lValor: Integer;
begin
  CalculaMedia(4, 5, lValor);
  Caption := IntToStr(lValor);
end;

procedure TfrmPrincipal.buttonDynamicClick(Sender: TObject);
var
  lHModule: Cardinal;
  lPtr: Pointer;
  lCalc: TCalculoMedia;
  lValor: Integer;
begin
  // Para DLL:
  // LoadLibrary
  lHModule := LoadPackage('ExemploPacote.bpl');
  if lHModule <> 0 then
  try
    lPtr := GetProcAddress(lHModule, 'CalculaMediaBPL');
    lCalc := TCalculoMedia(lPtr);

    lCalc(2, 3, lValor);
    Caption := lValor.ToString;
  finally
    UnloadPackage(lHModule);
    //FreeLibrary(HModule);
  end;
end;

end.
