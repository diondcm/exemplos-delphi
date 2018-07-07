unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.Json, Rest.Json,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Data.CDS, Vcl.Menus, Form.Historico, Form.Client.DS2010;

type
  TMarketPrice = class
  private
    status: string;
    name: string;
    period: string;
    description: string;
  end;

  TfrmCDS = class(TForm)
    panelControles: TPanel;
    panelMoeda: TPanel;
    panelCotacao: TPanel;
    panelGrafico: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    dtsCotacao: TDataSource;
    dtsMoeda: TDataSource;
    buttonCriaDados: TButton;
    buttonSalvarDados: TButton;
    buttonAbreConexao: TButton;
    buttonFecharConexao: TButton;
    timerOpen: TTimer;
    PopupMenu: TPopupMenu;
    ExibirHistrico1: TMenuItem;
    Button1: TButton;
    buttonDS2010: TButton;
    procedure buttonCriaDadosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure timerOpenTimer(Sender: TObject);
    procedure buttonSalvarDadosClick(Sender: TObject);
    procedure ExibirHistrico1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure buttonDS2010Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCDS: TfrmCDS;

implementation

{$R *.dfm}

procedure TfrmCDS.Button1Click(Sender: TObject);
var
  lStl: TStringList;
  lStr: string;
  lJs: TJSONObject;
  i: Integer;
  j: Integer;
  lArr: TJSONArray;
begin
  lStl := TStringList.Create;

  lStl.LoadFromFile('C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo7\market-price.json');
  lJs := TJSONObject.ParseJSONValue(lStl.Text) as TJSONObject;
  for i := 0 to lJs.Count -1 do
  begin
    lStr := lStr + sLineBreak + lJs.Pairs[i].JsonValue.Value + ': ' + lJs.Pairs[i].JsonString.Value;

    if (lJs.Pairs[i].JsonString.Value = 'values') then
    begin
      lArr := TJSONArray(lJs.Pairs[i]);
      for j := 0 to lArr.Count -1 do
      begin
        lArr.Items[j].ToJSON;
      end;
    end;
  end;

  ShowMessage(lStr);


  ShowMessage(lJs.Value);



  lStl.Free;





//  lMk := TMarketPrice.Create;
//  lMk.status := 'Status';
//  lMk.name := 'name';
//  lMk.period := 'perion';
//  lStr := TJson.ObjectToJsonString(lmk);
//
//
//  lStl := TStringList.Create;
//
//  lStl.LoadFromFile('C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo7\market-price.json');
  //lJs := TJson.JsonToObject<TMarketPrice>(lStl.Text);
//  lStr := lStl.Text;
//  FreeAndNil(lMk);
//  lMk := TJson.JsonToObject<TMarketPrice>(lStr);
//  Caption := lMk.description;
//
//  lStl.Free;
end;

procedure TfrmCDS.buttonCriaDadosClick(Sender: TObject);
begin
  dmdCDS.CriarDados;
end;

procedure TfrmCDS.buttonDS2010Click(Sender: TObject);
begin
  frmClientDS2010.Show;
end;

procedure TfrmCDS.buttonSalvarDadosClick(Sender: TObject);
begin
  dmdCDS.SalvarDados;
end;

procedure TfrmCDS.ExibirHistrico1Click(Sender: TObject);
begin
  dmdCDS.ExibeHistorico(dmdCDS.cdsMoeda);
  frmHistorico.Show;
end;

procedure TfrmCDS.FormShow(Sender: TObject);
begin
  timerOpen.Enabled := True;
end;

procedure TfrmCDS.timerOpenTimer(Sender: TObject);
begin
  timerOpen.Enabled := False;
  buttonCriaDados.Click;
end;

end.
