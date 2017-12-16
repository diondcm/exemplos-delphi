unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Rtti, Generics.Collections;

type
  TfrmPrincipal = class(TForm)
    buttonSalvar: TButton;
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

  function ValueToString(const [Ref] pVal: TValue): string;
  begin
    case pVal.Kind of
      tkUString,
      tkString,
      tkLString,
      tkWString,
      tkChar:
         Result := pVal.AsString;

      tkUnknown: ;
      tkInteger: ;
      tkEnumeration: ;
      tkFloat: ;
      tkSet: ;
      tkClass: ;
      tkMethod: ;
      tkWChar: ;
      tkVariant: ;
      tkArray: ;
      tkRecord: ;
      tkInterface: ;
      tkInt64: ;
      tkDynArray: ;
      tkClassRef: ;
      tkPointer: ;
      tkProcedure: ;
    end;
  end;

begin
  lType := TRttiContext.Create.GetType(Sender.ClassInfo); // Button.ClassInfo
  lDicProps := TDictionary<string, string>.Create;
  try
    for lProp in lType.GetProperties do
    begin
      if lProp.IsReadable then
      begin
        lDicProps.Add(lProp.Name, ValueToString(lProp.GetValue(Sender)));
      end;
    end;
  finally
    lDicProps.Free;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
