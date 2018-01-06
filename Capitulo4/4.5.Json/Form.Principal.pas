unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Rtti, Generics.Collections;

type
  TfrmPrincipal = class(TForm)
    buttonSalvar: TButton;
    memoPropriedades: TMemo;
    procedure buttonSalvarClick(Sender: TObject);
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

procedure TfrmPrincipal.buttonSalvarClick(Sender: TObject);
var
  lType: TRttiType;
  lProp: TRttiProperty;
  lDicProps: TDictionary<string, string>;
  lPair: TPair<string, string>;

  function ValueToString(const [Ref] pVal: TValue): string;
  begin
    case pVal.Kind of
      tkUString,
      tkString,
      tkLString,
      tkWString,
      tkChar:
         Result := pVal.AsString;

//      tkMethod,
//      tkProcedure:
//        Result := pVal.AsType<TRttiMethod>.Name;

      tkFloat:
        Result := FloatToStr(pVal.AsExtended);
      tkInteger:
        Result := IntToStr(pVal.AsInteger);

      tkEnumeration: ;
      tkSet: ;
      tkClass: ;
      tkWChar: ;
      tkVariant: ;
      tkArray: ;
      tkRecord: ;
      tkInterface: ;
      tkInt64: ;
      tkDynArray: ;
      tkClassRef: ;
      tkPointer: ;
      tkUnknown: ;
    end;
  end;

begin
  lType := TRttiContext.Create.GetType(Sender.ClassInfo); // Button.ClassInfo
  lDicProps := TDictionary<string, string>.Create;
  try
    try
      for lProp in lType.GetDeclaredProperties do
      begin
        if lProp.IsReadable then
        begin
          lDicProps.Add(lProp.Name, ValueToString(lProp.GetValue(Sender)));
        end;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('Prop: ' + lProp.Name + sLineBreak + E.Message);
      end;
    end;

    memoPropriedades.Lines.Add('{');
    for lPair in lDicProps.ToArray do
    begin
      memoPropriedades.Lines.Add('"' + lPair.Key + '":"' + lPair.Value + '",');
    end;
    memoPropriedades.Lines.Text := Copy(memoPropriedades.Lines.Text, 1, memoPropriedades.Lines.Text.Length -3 {Linebkeak + Última ','});
    memoPropriedades.Lines.Add('}');
  finally
    lDicProps.Free;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
