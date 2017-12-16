unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TCalculaICMS = function (pValorBase: Currency; pEstado: Integer): Currency;
  TExibeForm = function: Integer;

  TfrmPrincipal = class(TForm)
    buttonDinamico: TButton;
    buttonExibeForm: TButton;
    buttonViaMetodo: TButton;
    procedure buttonDinamicoClick(Sender: TObject);
    procedure buttonExibeFormClick(Sender: TObject);
    procedure buttonViaMetodoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonDinamicoClick(Sender: TObject);
const
  RS = 0;
  BH = 1;
  SP = 2;

var
  lBpl: Cardinal;
  lCalculaICMS: TCalculaICMS;
  lValorICMS: Currency;
  lMetodo: string;
begin
  lBpl := LoadPackage('C:\Users\Public\Documents\Embarcadero\Studio\18.0\Bpl\pkgForms.bpl');
  try
    lMetodo := 'CalculaICMS'; // CalculaICMS2 >> por exemplo não funciona, não localiza
    lCalculaICMS := TCalculaICMS(GetProcAddress(lBpl, PChar(lMetodo)));
    if Assigned(lCalculaICMS) then
    begin
      lValorICMS := lCalculaICMS(10, SP);
      Caption := TimeToStr(Now) + ' - ' + CurrToStr(lValorICMS);
    end else
      ShowMessage('Método "' + lMetodo + '" não encontrado.');

  finally
    UnloadPackage(lBpl);
  end;
end;

procedure TfrmPrincipal.buttonExibeFormClick(Sender: TObject);
var
  lFrmClass: TPersistentClass;
  lFrm: TForm;
  lBpl: Cardinal;
  lClasse: string;
begin
  lBpl := LoadPackage('C:\Users\Public\Documents\Embarcadero\Studio\18.0\Bpl\pkgForms.bpl');
  try
    lClasse := 'TfrmExibeModal';
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

procedure TfrmPrincipal.buttonViaMetodoClick(Sender: TObject);
var
  lBpl: Cardinal;
  lExibeForm: TExibeForm;
  lMetodo: string;
begin
  lBpl := LoadPackage('C:\Users\Public\Documents\Embarcadero\Studio\18.0\Bpl\pkgForms.bpl');
  try
    lMetodo := 'ExibeForm';
    lExibeForm := TExibeForm(GetProcAddress(lBpl, PChar(lMetodo)));
    if Assigned(lExibeForm) then
    begin
      Caption := TimeToStr(Now) + ' - ' + IntToStr(TModalResult(lExibeForm));
    end else
      ShowMessage('Método "' + lMetodo + '" não encontrado.');

  finally
    UnloadPackage(lBpl);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
