unit Base.Form.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.DBActns, Data.DB;

type
  TFrmBaseCadastroClass = class of TfrmBaseCadastro;
  TfrmBaseCadastro = class(TfrmBase)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    DatasetFirst1: TDataSetFirst;
    DatasetPrior1: TDataSetPrior;
    DatasetNext1: TDataSetNext;
    DatasetLast1: TDataSetLast;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetEdit1: TDataSetEdit;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    DatasetRefresh1: TDataSetRefresh;
    dtsCadastro: TDataSource;
    Bevel1: TBevel;
    procedure DatasetFirst1Execute(Sender: TObject);
    procedure DatasetPrior1Execute(Sender: TObject);
    procedure DatasetNext1Execute(Sender: TObject);
    procedure DatasetLast1Execute(Sender: TObject);
    procedure DatasetInsert1Execute(Sender: TObject);
    procedure DatasetDelete1Execute(Sender: TObject);
    procedure DatasetEdit1Execute(Sender: TObject);
    procedure DatasetPost1Execute(Sender: TObject);
    procedure DatasetCancel1Execute(Sender: TObject);
    procedure DatasetRefresh1Execute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  protected
    procedure SetDataSets; override;
  public
    { Public declarations }
  end;

//var
//  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

{ TfrmBaseCadastro }

procedure TfrmBaseCadastro.DatasetCancel1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.CancelarRegistro;
end;

procedure TfrmBaseCadastro.DatasetDelete1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.ExcluirRegistro;
end;

procedure TfrmBaseCadastro.DatasetEdit1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.AlterarRegistro;
end;

procedure TfrmBaseCadastro.DatasetFirst1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.IrParaPrimeiro;
end;

procedure TfrmBaseCadastro.DatasetInsert1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.InserirRegistro;
end;

procedure TfrmBaseCadastro.DatasetLast1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.IrParaUltimo;
end;

procedure TfrmBaseCadastro.DatasetNext1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.IrParaProximo;
end;

procedure TfrmBaseCadastro.DatasetPost1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.SalvarRegistro;
end;

procedure TfrmBaseCadastro.DatasetPrior1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.IrParaAnterior;
end;

procedure TfrmBaseCadastro.DatasetRefresh1Execute(Sender: TObject);
begin
  inherited;
  DmdCadastro.AtualizarDataSet;
end;

procedure TfrmBaseCadastro.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  lResultado: Integer;
begin
  inherited;
  if DmdCadastro.VerificaEmEdicao then
  begin
    CanClose := False;
    lResultado :=
      Application.MessageBox(
        PChar('Cadastro em edição.' + sLineBreak + 'Deseja salvar a alteração?'),
        'Atenção',
        MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON3);
    case lResultado of
      ID_YES:
      begin
        DmdCadastro.SalvarRegistro;
        CanClose := True;
      end;

      ID_NO:
      begin
        DmdCadastro.CancelarRegistro;
        CanClose := True;
      end;

      //ID_CANCEL

//    else
//      begin
//        CanClose := False;
//      end;
    end;
  end;
end;

procedure TfrmBaseCadastro.SetDataSets;
begin
  inherited;
  dtsCadastro.DataSet := DmdCadastro.DataSet;
end;

end.
