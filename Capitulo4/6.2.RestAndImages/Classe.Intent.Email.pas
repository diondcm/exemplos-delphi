unit Classe.Intent.Email;

interface

uses
{$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
{$ENDIF}
  System.SysUtils;

type
  TIntentEmail = class /// Todo: Classe genérica e multi plataforma
    class procedure Enviar(const pDestinatario, pAssunto, pTexto: string);
  end;

implementation

{ TIntentEmail }

class procedure TIntentEmail.Enviar(const pDestinatario, pAssunto, pTexto: string);
{$IFDEF ANDROID}
var
  lIntent: TJIntent;
  lDest: TJavaObjectArray<JString>; // JNI
{$ENDIF}
begin
{$IFDEF ANDROID}
//  lIntent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
//  lDest := TJavaObjectArray<JString>.Create(1);
//  lDest.Items[0] := StringToJString(pDestinatario);
//  lIntent.putExtra(TJIntent.JavaClass.EXTRA_EMAIL, lDest);
//  lIntent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString(pAssunto));
//  lIntent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(pTexto));
//  lIntent.setType(StringToJString('plain/text'));
//  TAndroidHelper.Activity.startActivity(TJIntent.JavaClass.createChooser(lIntent, StrToJCharSequence('Escolha seu App de email:')));
{$ENDIF}
end;

end.
