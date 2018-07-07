unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Data.CDS;

type
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
    procedure buttonCriaDadosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure timerOpenTimer(Sender: TObject);
    procedure buttonSalvarDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCDS: TfrmCDS;

implementation

{$R *.dfm}

procedure TfrmCDS.buttonCriaDadosClick(Sender: TObject);
begin
  dmdCDS.CriarDados;
end;

procedure TfrmCDS.buttonSalvarDadosClick(Sender: TObject);
begin
  dmdCDS.SalvarDados;
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
