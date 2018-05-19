unit Form.ClassOf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  THotelClass = class of THotel;
  THotel = class
  public
    function ToString: string; override;

    class function GetConfig(pHotelClass: THotelClass): string; overload;
    class function GetConfig: string; overload;

  end;

  THotel3Estrelas = class(THotel)
  public
    function ToString: string; override;
  end;

  THotel4Estrelas = class(THotel3Estrelas)
  public
    function ToString: string; override;
  end;

  THotel5Estrelas = class(THotel4Estrelas)
  public
    function ToString: string; override;
  end;



  TfrmClassOf = class(TForm)
    panelControles: TPanel;
    button5Estrelas: TButton;
    button4Estrelas: TButton;
    button3Estrelas: TButton;
    buttonHotel: TButton;
    memoLog: TMemo;
    comboHotel: TComboBox;
    Label1: TLabel;
    procedure buttonHotelClick(Sender: TObject);
    procedure button3EstrelasClick(Sender: TObject);
    procedure button4EstrelasClick(Sender: TObject);
    procedure button5EstrelasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure comboHotelCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClassOf: TfrmClassOf;

implementation

{$R *.dfm}

procedure TfrmClassOf.button3EstrelasClick(Sender: TObject);
//var
//  lHotel: THotel3Estrelas;
begin
  //Sender.ClassType
  memoLog.Text := THotel.GetConfig(THotel3Estrelas);

//  lHotel := THotel3Estrelas.Create;
//  try
//    memoLog.Text := lHotel.ToString;
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmClassOf.button4EstrelasClick(Sender: TObject);
var
  lHotel: THotel;
begin
  lHotel := THotel4Estrelas.Create;
  try
    memoLog.Text := lHotel.ToString;
  finally
    lHotel.Free;
  end;
end;

procedure TfrmClassOf.button5EstrelasClick(Sender: TObject);
var
  lHotel: THotel;
begin
  lHotel := THotel5Estrelas.Create;
  try
    memoLog.Text := lHotel.ToString;
  finally
    lHotel.Free;
  end;
end;

procedure TfrmClassOf.buttonHotelClick(Sender: TObject);
//var
//  lHotel: THotel;
begin
  memoLog.Text := THotel.GetConfig;

//  memoLog.Text := THotel.GetConfig(THotel);

//  lHotel := THotel.Create;
//  try
//    memoLog.Text := lHotel.ToString;
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmClassOf.comboHotelCloseUp(Sender: TObject);
begin
  case comboHotel.ItemIndex of
    0: memoLog.Text := THotel.GetConfig;
    1: memoLog.Text := THotel3Estrelas.GetConfig;
    2: memoLog.Text := THotel4Estrelas.GetConfig;
    3: memoLog.Text := THotel5Estrelas.GetConfig;
  end;
end;

procedure TfrmClassOf.FormCreate(Sender: TObject);
begin
  comboHotel.Items.Add(THotel.ClassName);
  comboHotel.Items.Add(THotel3Estrelas.ClassName);
  comboHotel.Items.Add(THotel4Estrelas.ClassName);
  comboHotel.Items.Add(THotel5Estrelas.ClassName);
end;

{ THotel }

class function THotel.GetConfig(pHotelClass: THotelClass): string;
var
  lH: THotel;
begin
  lH := pHotelClass.Create; {pClass.Create as THotel};
  try
    Result := lH.ToString;
  finally
    lH.Free;
  end;
end;

class function THotel.GetConfig: string;
var
  lH: THotel;
begin
  lH := Self.Create;
  try
    Result := lH.ToString;
  finally
    lH.Free;
  end;
end;

function THotel.ToString: string;
begin
  Result := ClassName + ' - Contém: cama';
end;

{ THotel3Estrelas }

function THotel3Estrelas.ToString: string;
begin
  Result := inherited + ', janta';
end;

{ THotel4Estrelas }

function THotel4Estrelas.ToString: string;
begin
  Result := inherited + ', Serv. Quarto';
end;

{ THotel5Estrelas }

function THotel5Estrelas.ToString: string;
begin
  Result := inherited + ', TV Cabo';
end;

end.
