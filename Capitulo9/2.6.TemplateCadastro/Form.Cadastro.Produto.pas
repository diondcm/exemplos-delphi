unit Form.Cadastro.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB, Vcl.ExtCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.Produto, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCadProduto = class(TfrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  DmdDados := TdmdProduto.Create(Self);
end;

end.
