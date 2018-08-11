unit Form.Teste.Principal;

interface

/// 13:40

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Classe.DB.DateEdit, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmPrincipal = class(TForm)
    memPessoa: TFDMemTable;
    dtsDados: TDataSource;
    gridDados: TDBGrid;
    memPessoaDataCadastro: TDateField;
    memPessoaNome: TStringField;
    memPessoaCodigo: TIntegerField;
    timerOpen: TTimer;
    DBNavigator1: TDBNavigator;
    procedure timerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  timerOpen.Enabled := True;
end;

procedure TfrmPrincipal.timerOpenTimer(Sender: TObject);
begin
  timerOpen.Enabled := False;
  memPessoa.Open;
end;

end.
