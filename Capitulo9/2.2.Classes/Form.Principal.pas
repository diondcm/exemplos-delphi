unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Form.Instances;

type
  THotelClass = class of THotel;

  THotel = class
  public
    function ToString: string; override;
    class function GetConfigHotel(pClasseHotel: THotelClass): string;
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
    MemoLog: TMemo;
    PanelControles: TPanel;
    ButtonHotel: TButton;
    ButtonClassName: TButton;
    ComboBoxClasse: TComboBox;
    ButtonInstancce: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonHotelClick(Sender: TObject);
    procedure ButtonClassNameClick(Sender: TObject);
    procedure ComboBoxClasseChange(Sender: TObject);
    procedure ButtonInstancceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonClassNameClick(Sender: TObject);
begin
  MemoLog.Lines.Insert(0, THotel5Estrelas.ClassName);
  MemoLog.Lines.Insert(0, THotel4Estrelas.ClassName);
  MemoLog.Lines.Insert(0, THotel3Estrelas.ClassName);
  MemoLog.Lines.Insert(0, THotel.ClassName);
end;

procedure TfrmPrincipal.ButtonHotelClick(Sender: TObject);
begin
  var lHotel: THotel := THotel.Create;
  MemoLog.Lines.Insert(0, lHotel.ToString);
  lHotel.Free;

  var lHotel3: THotel3Estrelas := THotel3Estrelas.Create;
  MemoLog.Lines.Insert(0, lHotel3.ToString);
  lHotel3.Free;

  var lHotel4: THotel4Estrelas := THotel4Estrelas.Create;
  MemoLog.Lines.Insert(0, lHotel4.ToString);
  lHotel4.Free;

  var lHotel5: THotel5Estrelas := THotel5Estrelas.Create;
  MemoLog.Lines.Insert(0, lHotel5.ToString);
  lHotel5.Free;
end;

procedure TfrmPrincipal.ButtonInstancceClick(Sender: TObject);
begin
  frmInstance.Show;
end;

procedure TfrmPrincipal.ComboBoxClasseChange(Sender: TObject);
////var
//  lHotel: THotel;
////  lConfig: string;
begin
  case ComboBoxClasse.ItemIndex of
    0: MemoLog.Lines.Insert(0, THotel.GetConfig);
    1: MemoLog.Lines.Insert(0, THotel3Estrelas.GetConfig);
    2: MemoLog.Lines.Insert(0, THotel4Estrelas.GetConfig);
    3: MemoLog.Lines.Insert(0, THotel5Estrelas.GetConfig);
  end;

//  case ComboBoxClasse.ItemIndex of
//    0: MemoLog.Lines.Insert(0, THotel.GetConfigHotel(THotel));
//    1: MemoLog.Lines.Insert(0, THotel.GetConfigHotel(THotel3Estrelas));
//    2: MemoLog.Lines.Insert(0, THotel.GetConfigHotel(THotel4Estrelas));
//    3: MemoLog.Lines.Insert(0, THotel.GetConfigHotel(THotel5Estrelas));
//  end;

//  lHotel.GetConfigHotel(THotel5Estrelas)

//  lConfig := THotel.GetConfigHotel(ComboBoxClasse.Text);
//  MemoLog.Lines.Insert(0, lConfig);

//  if ComboBoxClasse.Text = 'THotel5Estrelas' then
//  begin
//    lHotel := THotel5Estrelas.Create;
//  end;
//  if ComboBoxClasse.Text = 'THotel4Estrelas' then
//  begin
//    lHotel := THotel4Estrelas.Create;
//  end;
//
//  MemoLog.Lines.Insert(0, lHotel.ToString);
//  lHotel.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  ComboBoxClasse.Items.Add(THotel.ClassName);
  ComboBoxClasse.Items.Add(THotel3Estrelas.ClassName);
  ComboBoxClasse.Items.Add(THotel4Estrelas.ClassName);
  ComboBoxClasse.Items.Add(THotel5Estrelas.ClassName);
end;

{ THotel }

class function THotel.GetConfig: string;
begin
  var lHotel: THotel := Self.Create;
  Result := lHotel.ToString;
  lHotel.Free;
end;

class function THotel.GetConfigHotel(pClasseHotel: THotelClass): string;
var
  lHotel: THotel;
begin
//  if pNomeClasse = 'THotel5Estrelas' then
//  begin
//    lHotel := THotel5Estrelas.Create;
//  end;
//  if pNomeClasse = 'THotel4Estrelas' then
//  begin
//    lHotel := THotel4Estrelas.Create;
//  end;

  lHotel := pClasseHotel.Create;
  Result := lHotel.ToString;
  lHotel.Free;
end;

function THotel.ToString: string;
begin
  Result := ClassName +  ' Contém: Cama';
end;

{ THotel3Estrelas }

function THotel3Estrelas.ToString: string;
begin
  Result := inherited + ', Janta';
end;

{ THotel5Estrelas }

function THotel5Estrelas.ToString: string;
begin
  Result := inherited + ', Tv Cabo';
//  Result := ', Tv Cabo';
end;

{ THotel4Estrelas }

function THotel4Estrelas.ToString: string;
begin
  Result := inherited + ', Serv. Quarto';
end;

end.
