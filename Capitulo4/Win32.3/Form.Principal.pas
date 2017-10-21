unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  THotelClass = class of THotel;
  THotel = class
    function ToString: string; override;
    class function GetConfig(pHotelClass: THotelClass): string; overload;
    class function GetConfig: string; overload;
  end;

  THotel3Estrelas = class(THotel)
    function ToString: string; override;
  end;

  THotel4Estrelas = class(THotel3Estrelas)
    function ToString: string; override;
  end;

  THotel5Estrelas = class(THotel4Estrelas)
    function ToString: string; override;
  end;

  TfrmPrincipal = class(TForm)
    buttonHotel: TButton;
    memo: TMemo;
    button3Estrelas: TButton;
    button4Estrelas: TButton;
    button5Estrelas: TButton;
    comboHotel: TComboBox;
    Button1: TButton;
    procedure buttonHotelClick(Sender: TObject);
    procedure button3EstrelasClick(Sender: TObject);
    procedure button4EstrelasClick(Sender: TObject);
    procedure button5EstrelasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure comboHotelCloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

class function THotel.GetConfig(pHotelClass: THotelClass): string;
var
  lHotel: THotel;
begin
  lHotel := pHotelClass.Create;
  try
    Result := lHotel.ToString;
  finally
    lHotel.Free;
  end;
end;

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
  Result := ClassName + ' - Contém: cama';
end;

procedure TfrmPrincipal.button5EstrelasClick(Sender: TObject);
//var
//  lHotel: THotel;
begin
//  memo.Lines.Add(THotelClass.GetConfig(THotel5Estrelas));

//  lHotel := THotel5Estrelas.Create;
//  try
//    memo.Lines.Add(lHotel.ToString);
//    memo.Lines.Add('');
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  // Application.OnException // Loop infinito se gerar exceção

  try
    try
      try
        try
          // Halt;   // Ignorantão >> mata a aplicação

          raise Exception.Create('Error Message');
        finally
          memo.Lines.Add('   Fin3');
        end;
      except
        memo.Lines.Add('  Except');// A não ser que de raise >> morre a exceção
        try
          raise;
        except
          // evitar aninhar
        end;

        raise Exception.Create('Novo Erro');
      end;

      memo.Lines.Add('Normal'); //?

    except // ?
      memo.Lines.Add('  ExFin2');
    end;
  finally
    memo.Lines.Add(' Fin1');
  end;
end;

procedure TfrmPrincipal.button3EstrelasClick(Sender: TObject);
//var
//  lHotel: THotel;
begin
//  memo.Lines.Add(THotelClass.GetConfig(THotel3Estrelas));

//  lHotel := THotel3Estrelas.Create;
//  try
//    memo.Lines.Add(lHotel.ToString);
//    memo.Lines.Add('');
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmPrincipal.button4EstrelasClick(Sender: TObject);
//var
//  lHotel: THotel;
begin
//  memo.Lines.Add(THotelClass.GetConfig(THotel4Estrelas));

//  lHotel := THotel4Estrelas.Create;
//  try
//    memo.Lines.Add(lHotel.ToString);
//    memo.Lines.Add('');
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmPrincipal.buttonHotelClick(Sender: TObject);
//var
//  lHotel: THotel;
begin
//  memo.Lines.Add(THotelClass.GetConfig(THotel));

//  lHotel := THotel.Create;
//  try
//    memo.Lines.Add(lHotel.ToString);
//    memo.Lines.Add('');
//  finally
//    lHotel.Free;
//  end;
end;

procedure TfrmPrincipal.comboHotelCloseUp(Sender: TObject);
begin
//  case comboHotel.ItemIndex of
//    0: memo.Lines.Add(THotel.GetConfig(THotel));
//    1: memo.Lines.Add(THotel.GetConfig(THotel3Estrelas));
//    2: memo.Lines.Add(THotel.GetConfig(THotel4Estrelas));
//    3: memo.Lines.Add(THotel.GetConfig(THotel5Estrelas));
//  end;
  case comboHotel.ItemIndex of
    0: memo.Lines.Add(THotel.GetConfig);
    1: memo.Lines.Add(THotel3Estrelas.GetConfig);
    2: memo.Lines.Add(THotel4Estrelas.GetConfig);
    3: memo.Lines.Add(THotel5Estrelas.GetConfig);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  comboHotel.Items.Add(THotel.ClassName);
  comboHotel.Items.Add(THotel3Estrelas.ClassName);
  comboHotel.Items.Add(THotel4Estrelas.ClassName);
  comboHotel.Items.Add(THotel5Estrelas.ClassName);
end;

{ THotel3Estrelas }

function THotel3Estrelas.ToString: string;
begin
  Result := inherited + ', Janta';
end;

{ THotel4Estrelas }

function THotel4Estrelas.ToString: string;
begin
  Result := inherited + ', Serv. Quarto';
end;

{ THotel5Estrelas }

//function teste({sem self}): string;
//begin
//  Self -> X
//end;

function THotel5Estrelas.ToString({Self: THotel5Estrelas, var Result: string}): string;
begin
  // Desaconcelhado:
  // ToString{Result} := 'Teste';

  Result := inherited + ', TV Cabo';
end;

end.
