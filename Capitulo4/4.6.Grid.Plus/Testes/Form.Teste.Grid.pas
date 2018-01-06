unit Form.Teste.Grid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Classe.DB.Grid.Plus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    dtsDados: TDataSource;
    memDados: TFDMemTable;
    memDadosCode: TIntegerField;
    memDadosName: TWideStringField;
    memDadosCapital: TWideStringField;
    memDadosArea: TIntegerField;
    memDadosPopulation: TIntegerField;
    memDadosContinent: TWideStringField;
    memDadosAtivo: TBooleanField;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    DBGridPlus1: TDBGridPlus;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure memDadosCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FImgUnChecked: TBitmap;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  memDados.Close;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
 bitmap : TBitmap;
 fixRect : TRect;
 bmpWidth : integer;

 imgIndex : integer;
begin
// fixRect := Rect;

 // customizing the 'LastName' field


// bitmap := TBitmap.Create;
 try
 //grab the image from the ImageList
 //(using the "Salary" field's value)
//  bitmap.Assign(FImgUnChecked);
 //Fix the bitmap dimensions
// bmpWidth := (Rect.Bottom - Rect.Top);
// fixRect.Right := Rect.Left + bmpWidth;
 //draw the bitmap
// DBGrid1.Canvas.StretchDraw(fixRect,bitmap);
 finally
// bitmap.Free;
 end;

 // reset the output rectangle,
 // add space for the graphics
// fixRect := Rect;
// fixRect.Left := fixRect.Left + bmpWidth;


 //draw default text (fixed position)
// DBGrid1.DefaultDrawColumnCell(
// fixRect,
// DataCol,
// Column,
// State);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  //DBGridPlus1.ClientHeight:= DBGridPlus1.ClientHeight - StatusBar1.Height;

//  FImgUnChecked := Vcl.Graphics.TBitmap.Create;
//  if FileExists('C:\Users\Aluno\Downloads\unchecked.bmp') then
//  begin
//    FImgUnChecked.LoadFromFile('C:\Users\Aluno\Downloads\unchecked.bmp');
//  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//  FImgUnChecked.Free;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
//  Self.Canvas.Draw(10, 10, FImgUnChecked);
end;

procedure TForm1.memDadosCalcFields(DataSet: TDataSet);
begin
  Randomize;
  DataSet.FieldByName('Ativo').AsBoolean := (Random(10) div 3 = 0)
end;

end.
