unit Form.Cadastro.Produto.VCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.WinXPickers, Vcl.StdCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, Vcl.DBCtrls;

type
  TfrmCadProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    dtsProduto: TDataSource;
    LabelID: TLabel;
    Label2: TLabel;
    EditDescricao: TEdit;
    Label1: TLabel;
    EditCodigo: TEdit;
    Label3: TLabel;
    EditPeso: TEdit;
    DatePicker1: TDatePicker;
    Label4: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkPropertyToFieldDate: TLinkPropertyToField;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses Data.Produto;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  dmdProduto.qryProduto.Open;
end;

end.
