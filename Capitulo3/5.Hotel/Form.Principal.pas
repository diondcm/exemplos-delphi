unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  THotel = class
  public
    function ToString: string; override;
    class function GetConfig: string;
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

  TfrmPrincipal = class(TForm)
    memLog: TMemo;
    btnHotel: TButton;
    btnHotel3: TButton;
    btnHotel4: TButton;
    btnHotel5: TButton;
    btnClassMethod: TButton;
    cmbClasse: TComboBox;
    procedure btnHotelClick(Sender: TObject);
    procedure btnHotel3Click(Sender: TObject);
    procedure btnHotel4Click(Sender: TObject);
    procedure btnHotel5Click(Sender: TObject);
    procedure btnClassMethodClick(Sender: TObject);
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

{ THotel }

class function THotel.GetConfig: string;
var
  lHotel: THotel;
begin
  lHotel := Self.Create;
  try
    Result := lHotel.ToString;
  finally
    lHotel.Free;
  end;
end;

function THotel.ToString: string;
begin
  Result := ClassName + ' - Contém: Cama';
end;

procedure TfrmPrincipal.btnClassMethodClick(Sender: TObject);
begin
  case cmbClasse.ItemIndex of
    0: memLog.Lines.Text := THotel.GetConfig;
    1: memLog.Lines.Text := THotel3Estrelas.GetConfig;
    2: memLog.Lines.Text := THotel4Estrelas.GetConfig;
    3: memLog.Lines.Text := THotel5Estrelas.GetConfig;
  end;
end;

procedure TfrmPrincipal.btnHotel3Click(Sender: TObject);
//var
//  lHotel: THotel3Estrelas;
begin
//  lHotel := THotel3Estrelas.Create;
//  try
//    memLog.Lines.Text := lHotel.ToString;
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmPrincipal.btnHotel4Click(Sender: TObject);
//var
//  lHotel: THotel4Estrelas;
begin
//  lHotel := THotel4Estrelas.Create;
//  try
//    memLog.Lines.Text := lHotel.ToString;
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmPrincipal.btnHotel5Click(Sender: TObject);
//var
//  lHotel: THotel;
begin
//  lHotel := THotel5Estrelas.Create;
//  try
//    memLog.Lines.Text := lHotel.ToString;
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmPrincipal.btnHotelClick(Sender: TObject);
//var
//  lHotel: THotel;
begin
//  lHotel := THotel.Create;
//  try
//    memLog.Lines.Text := lHotel.ToString;
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  cmbClasse.Items.Clear;
  cmbClasse.Items.Add(THotel.ClassName);
  cmbClasse.Items.Add(THotel3Estrelas.ClassName);
  cmbClasse.Items.Add(THotel4Estrelas.ClassName);
  cmbClasse.Items.Add(THotel5Estrelas.ClassName);
end;

{ THotel3Estrelas }

function THotel3Estrelas.ToString: string;
begin
  Result := inherited ToString + ', Janta';
end;

{ THotel4Estrelas }

function THotel4Estrelas.ToString: string;
begin
  Result := inherited ToString + ', Ser. de Quarto';
end;

{ THotel5Estrelas }

function THotel5Estrelas.ToString: string;
begin
  Result := inherited ToString + ', TV a Cabo';
end;

end.
