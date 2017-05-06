unit Form.Cadastro.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Vcl.Menus, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Base.Data.Cadastro, Data.Produto,
  Form.Pesquisa.Categoria, Data.Categoria;

type
  TfrmCadastroProduto = class(TfrmBaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    dbeCodigo: TDBEdit;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    dbeCategoria: TDBEdit;
    btnCategoria: TButton;
    edtDescricaoCategoria: TEdit;
    procedure btnCategoriaClick(Sender: TObject);
    procedure dtsDadosDataChange(Sender: TObject; Field: TField);
  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;
  private
    { Private declarations }
  public

    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmCadastroProduto }

procedure TfrmCadastroProduto.btnCategoriaClick(Sender: TObject);
begin
  inherited;

  TfrmPesquisaCategoria.Pesquisar<TdmdCategoria>(
    procedure (pCategoria: TdmdCategoria)
    begin
      DmdCadastro.AlterarRegistro;
      dbeCategoria.Field.AsInteger := pCategoria.cdsCadastroID.AsInteger;
      edtDescricaoCategoria.Text := pCategoria.cdsCadastroDESCRICAO.AsString;
    end
    );
end;

procedure TfrmCadastroProduto.dtsDadosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  edtDescricaoCategoria.Text := dtsDados.DataSet.FieldByName('CATEGORIA').AsString;
end;

class function TfrmCadastroProduto.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdProduto;
end;

end.
