unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Data.Relatorios;

type
  TfrmPrincipal = class(TForm)
    panelControles: TFlowPanel;
    buttonListaCodigos: TButton;
    buttonImpressao: TButton;
    buttonCarregarRelatorio: TButton;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    procedure buttonListaCodigosClick(Sender: TObject);
    procedure buttonImpressaoClick(Sender: TObject);
    procedure buttonCarregarRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonCarregarRelatorioClick(Sender: TObject);
const
  REL_FILE = 'Codigos.fr3';
begin
  dmdRelatorios.qryDept.Open;
  if not FileExists(REL_FILE) then
  begin
    raise Exception.Create('Arquivo ' + REL_FILE + ' não encontrado.');
  end;
  
  dmdRelatorios.frxReportRunTime.LoadFromFile(REL_FILE);
  dmdRelatorios.frxReportRunTime.ShowReport;
end;

procedure TfrmPrincipal.buttonImpressaoClick(Sender: TObject);
begin
  dmdRelatorios.qryDept.Open;
  dmdRelatorios.frxReportCodigos.Print;
end;

procedure TfrmPrincipal.buttonListaCodigosClick(Sender: TObject);
begin
  dmdRelatorios.qryDept.Open;
  dmdRelatorios.frxReportCodigos.ShowReport;
end;

end.
