unit Form.Instances;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.AppEvnts;

type
  TfrmInstance = class(TForm)
    Button1: TButton;
    MemoLog: TMemo;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    CheckBoxGeraErro: TCheckBox;
    ApplicationEvents1: TApplicationEvents;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    FButton: TButton;
    { Public declarations }
  end;

var
  frmInstance: TfrmInstance;

implementation

{$R *.dfm}

procedure TfrmInstance.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  // Evitar raise aqui
  MemoLog.Lines.Insert(0, 'AppOnExcept: ' + E.QualifiedClassName + ' - ' + E.Message);
end;

procedure TfrmInstance.Button1Click(Sender: TObject);
var
  lStl: TStringList;
begin
  // try
  // dependency injection framework

//  FButton := TButton.Create(nil);

  FButton := TButton.Create(Self);
  FButton.Parent := Panel1;

  lStl := TStringList.Create;
  try
    try
      try
        //Halt;
        Abort;
        Exit;
        lStl.LoadFromFile('config.txt');
        MemoLog.Text := lStl.Text;

        // TEF
        // operadora, debita 200 de fulano
        // OK
        // // finaliza
      except

      end;
    finally
      //  Close de files
      // Transaction.Commit/Rollback
    end;
  finally
    lStl.Free;
  end;



{  lStl := TStringList.Create;
  try

//  raise Exception.Create('Error Message');



  lStl.LoadFromFile('config.txt');
  MemoLog.Text := lStl.Text;
  except
    on E: Exception do
    begin
      //lStl.Free;
      FreeAndNil(lStl);
      MemoLog.Text := E.Message;
//      raise;
//      raise Exception.Create('Error Message');
//     Abort;
    end;
  end;

  lStl.Free;

}
end;

procedure TfrmInstance.Button2Click(Sender: TObject);
begin
  //FButton.Parent := nil;
  FButton.Free;
end;

procedure TfrmInstance.Button3Click(Sender: TObject);
var
  lStl: TStringList;
  lErro: Boolean;
begin
  lStl := TStringList.Create;
  try
    try
      try
        try
          if CheckBoxGeraErro.Checked then
          begin
            raise Exception.Create('ERROR_SUCCESS');
          end else begin
            Abort;
          end;
        except
          on E: EAbort do
          begin
            // sai em silêncio
          end;
          on E: Exception do
          begin
            MemoLog.Lines.Add(E.Message);
          end;
        end;

//        raise Exception.Create('Error Message');

        try
          raise Exception.Create('Error Message');
          //Abort;
        except
          on E: Exception do
          begin
            MemoLog.Lines.Add('Este não Executa: ' + E.Message);
          end;
        end;

      finally
        //raise Exception.Create('Error Message');
        lStl.SaveToFile('config.txt');
      end;
    finally
      lStl.Free;
    end;
  except
    on E: Exception do
    begin
      MemoLog.Lines.Add(E.Message);
    end;
  end;

//  lStl := TStringList.Create;
//  try
//    try
//
//    except
//      lErro := True;
//      lStl.Free;
//    end;
//  finally
//    if not lErro then
//    begin
//      lStl.Free;
//    end;
//  end;
//
//
//  lStl := TStringList.Create;
//  try
//
//  finally
//    lStl.Free;
//  end;
end;

procedure TfrmInstance.Button4Click(Sender: TObject);
begin
  raise Exception.Create('Teste Erro');
end;

end.
