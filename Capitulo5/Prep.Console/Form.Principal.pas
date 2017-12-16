unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, // Midaslib,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Generics.Collections, Datasnap.DSClientRest, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient, Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxDBEdit;

type
  TForm1 = class(TForm)
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    FDQuery1Teste: TIntegerField;
    Panel1: TPanel;
    ClientDataSet1: TClientDataSet;
    SpeedButton1: TSpeedButton;
    DataSource2: TDataSource;
    Label3: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    FDQuery2: TFDQuery;
    IntegerField1: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TLocalClass = class

  end;

  TMeuGeneric<T: TLocalClass{class, constructor}> = class
    class function Retorna: T;
  end;

  TLocalClassFilho = class(TLocalClass);


  procedure ChamarNOIni;

var
  Form1: TForm1;


//  procedure Register;

implementation

{$IFDEF DEBUG}
{$R *.dfm}
{$ELSE}
{$R Arq2.dfm}
{$ENDIF}


const
  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

//procedure Register;
//begin
//  RegisterComponents();
//end;

procedure ChamarNOIni;
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  lLst: TList;
  lPInt: PInteger;
  lInt: Integer;
  lLstGen: TList<Integer>;
  lVarProc: TProc;
begin
  //Assert(False, 'Teste');
  //raise TForm.Create(nil);
  // TObject.ClassParent
//   FDQuery1.IsEmpty
//  FDQuery1.State
  try
  //Exit;
  //Abort;
  //Halt;
  finally
//    Exit
    // não quero executar isso aki
  end;

//  try
//    try
//      try
//        raise EConvertError.Create('Error Message');
//      except
//        // raise Exception.Create('Error Message');
//      end;
//
//
//    finally
//      // executa ou não
//    end;
//  except
//    on E: EConvertError do
//    begin
//      //E.InnerException
//      raise;
//    end;
//    on E: Exception do
//    begin
//
//    end;
//  end;



//  lLst := TList.Create;
//  try
//    lPInt := @lInt;
//    lLst.Add(lPInt);
//    Integer(lLst[0]^) := 90;
//
//    Caption := Integer(lLst[0]^).ToString;
//  finally
//    lLst.Free;
//  end;

  //TMeuGeneric<string>.Retorna
  //TMeuGeneric<TObject>.Retorna
//  TMeuGeneric<TLocalClassFilho>.Retorna;
//  TLocalClassFilho



//  lVarProc :=
//    procedure
//    begin
//      Self.Color := clBlue;
//      lInt := 40;
//      Caption := Caption + ' - Teste';
//    end;
//
//  lLstGen := TList<Integer>.Create;
//  try
//    lLstGen.Add(lInt);
//    Caption := Caption + lLstGen[0].ToString;
//  finally
//    lLstGen.Free;
//  end;
//
//  lVarProc;

//  madExcept
//  TInterfacedObject
//  TInterfacedPersistent
end;

{ TMeuGeneric<T> }

class function TMeuGeneric<T>.Retorna: T;
begin
  Exit(nil);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
 // MyArray : array[1..7, 1..24] of String;
  aMyArray : array[0..7, 0..24] of Integer;
  bMyArray : array[1..24, 1..7] of Integer;
  cMyArray : array[1..7, 1..24] of Integer;
begin
  ShowMessage('Teste');


end;

initialization
  ChamarNOIni;

//finalization
//   ChamarNOIni;

end.
