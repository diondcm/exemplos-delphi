unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmPrincipal = class(TForm)
    dbgDados: TDBGrid;
    dtsDados: TDataSource;
    cdsDados: TClientDataSet;
    dbnDados: TDBNavigator;
    cdsDadosid: TIntegerField;
    cdsDadostitulo: TStringField;
    cdsDadosdata_lancamento: TDateField;
    cdsDadosvalor_custo: TCurrencyField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnAtualizaInfos: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure btnAtualizaInfosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnAtualizaInfosClick(Sender: TObject);
begin
  if cdsDados.Active{ = True >> evitar} then
  begin
    cdsDados.SaveToFile('dados.xml');
  end else begin
    if FileExists('dados.xml') then
    begin
      cdsDados.LoadFromFile('dados.xml');
    end else begin
      cdsDados.CreateDataSet;
    end;
  end;
end;

end.
