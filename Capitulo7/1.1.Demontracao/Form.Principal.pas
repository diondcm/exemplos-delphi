unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Classe.ConversorMoeda;

const
  ARQ_DADOS = 'dados.xml';

type
  TfrmPrincipal = class(TForm)
    gridDados: TDBGrid;
    cdsDados: TClientDataSet;
    dtsDados: TDataSource;
    navigatorDados: TDBNavigator;
    cdsDadosCodigo: TIntegerField;
    cdsDadosDescricao: TStringField;
    panelConversao: TPanel;
    buttonConverte: TButton;
    editValor: TEdit;
    labelResultado: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure buttonConverteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonConverteClick(Sender: TObject);
begin
//  labelResultado.Caption := FloatToStr(TConversorMoeda.RealParaDolar(StrToFloat(editValor.Text)));
  labelResultado.Caption := TConversorMoeda.RealParaDolar(editValor.Text);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if FileExists(ARQ_DADOS) then
    cdsDados.LoadFromFile(ARQ_DADOS);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  cdsDados.SaveToFile(ARQ_DADOS, dfXML);
end;

end.
