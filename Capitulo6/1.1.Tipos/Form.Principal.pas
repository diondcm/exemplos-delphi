unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Rtti,
  System.Actions, Vcl.ActnList, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components;

type
  TfrmTipos = class(TForm)
    buttonCriaPanel: TButton;
    ActionList1: TActionList;
    actionCriaPanel: TAction;
    buttonExecuta: TButton;
    Button1: TButton;
    Memo1: TMemo;
    BindingsList1: TBindingsList;
    LinkControlToPropertyCaption: TLinkControlToProperty;
    Edit1: TEdit;
    Button2: TButton;
    LinkControlToPropertyCaption2: TLinkControlToProperty;
    procedure FormCreate(Sender: TObject);
    procedure actionCriaPanelExecute(Sender: TObject);
    procedure buttonExecutaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    class var
       FInstancia: TfrmTipos;
    class function GetInstancia: TfrmTipos; static;
  public
    { Singleton - Lazy Loading }
    class property Instancia: TfrmTipos read GetInstancia;
  end;

  TButtonHelper = class helper for TButton
    procedure DesativaOnClick;
  end;


var
  frmTipos: TfrmTipos;

implementation

{$R *.dfm}


procedure TfrmTipos.actionCriaPanelExecute(Sender: TObject);
var
  lInt: Integer;
begin
  buttonExecuta.DesativaOnClick;
//  lInt := 10;
//  Caption := lInt.ToString;
end;

procedure TfrmTipos.Button1Click(Sender: TObject);
begin
  buttonExecutaClick(Sender);
end;

procedure TfrmTipos.buttonExecutaClick(Sender: TObject);
//type
//  Int2 = type integer;
var
  lPanel: TPanel;

  lValorStr: string;
  lFloat: Double;

  lValorInt: Integer;
  lPonter: Pointer;
  lObj: TObject;
//  lVarInt2: Int2;
begin
//  lValorInt := lObj;
//  lVarInt2 := lValorInt;
  Caption := Caption + ' Int: ' + IntToStr(lValorInt) + ' S:"' + lValorStr + '" F: ' + FloatToStr(lFloat);

  //Button1.Enabled := False;

//  TRttiContext.Create
  lPanel := TPanel.Create(buttonExecuta);
  sLeep(800);
  raise Exception.Create('Erro ocorreu');

  // Mov valor ex.
  //lPanel.Parent := Self;

  //lPanel.Free;

  //Button1.Enabled := True;
end;

procedure TfrmTipos.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  //Writeln('Teste'); // Gera erro IO, mas compila
end;

class function TfrmTipos.GetInstancia: TfrmTipos;
begin
  if not Assigned(FInstancia) then
  begin
    FInstancia := TfrmTipos.Create(Application);
  end;

  Result := FInstancia;
end;

{ TButtonHelper }

procedure TButtonHelper.DesativaOnClick;
begin
  Self.Enabled := False;
  try
    try
      try
        try
          Self.Click;
//          raise Exception.Create('Error Message');
        except
          on E: EActionError do
          begin
            ShowMessage('Deu erro de ação...');
          end;
          On E: Exception do
          begin
            ShowMessage('Mensagem: ' + E.Message);
            //raise;
          end;
        end;
      except
        ShowMessage('Algo deu erro');
        // E - silenc, sem info do erro(Desaco)
      end;
//    raise Exception.Create('Error Message');
//    Abort;
//    Exit;
//    Close;
//    Application.Terminate;

//    Halt;
    finally
    end;
  finally
    Self.Enabled := True;
  end;
end;

end.
