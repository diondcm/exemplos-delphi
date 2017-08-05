unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, Form.Login, Form.Config, FMX.Layouts, FMX.Edit;

type
  TfrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    btnConfig: TButton;
    GridPanelLayout1: TGridPanelLayout;
    btnLogin: TButton;
    btnEnviarEmail: TButton;
    edtEmail: TEdit;
    procedure btnLoginClick(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure EnviarEmail(const pDestinatario, pAssunto, pTexto: string);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

{$IFDEF ANDROID}
uses
  FMX.Helpers.Android,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText;
{$ENDIF}

procedure TfrmPrincipal.btnConfigClick(Sender: TObject);
begin
  frmConfig.Show;
end;

procedure TfrmPrincipal.btnEnviarEmailClick(Sender: TObject);
begin
  EnviarEmail(edtEmail.Text, 'Teste de Email', 'Gerado via intent.');
end;

procedure TfrmPrincipal.btnLoginClick(Sender: TObject);
begin
  frmLogin.Show;
end;

procedure TfrmPrincipal.EnviarEmail(const pDestinatario, pAssunto,
  pTexto: string);
{$IFDEF ANDROID}
var
  lIntent: JIntent;
  lDestinatarios: TJavaObjectArray<JString>; // JNI
{$ENDIF}
begin
{$IFDEF ANDROID}
  lIntent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  lDestinatarios := TJavaObjectArray<JString>.Create(1);
  lDestinatarios.Items[0] := StringToJString(pDestinatario);
  lIntent.putExtra(TJIntent.JavaClass.EXTRA_EMAIL, lDestinatarios);
  lIntent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString(pAssunto));
  lIntent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(pTexto));
  lIntent.setType(StringToJString('plain/text'));
  TAndroidHelper.Activity.startActivity(
    TJIntent.JavaClass.createChooser(lIntent, StrToJCharSequence('Qual app de email?')));
{$ENDIF}
end;

end.
