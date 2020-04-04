unit Form.Cadastro.Produto.FMX;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, Data.DB,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Controls, FMX.Layouts,
  Fmx.Bind.Navigator, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TfrmCadProduto = class(TForm)
    TabControlProduto: TTabControl;
    TabPesquisa: TTabItem;
    TabCadastro: TTabItem;
    TabQrCode: TTabItem;
    ListViewProdutos: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindNavigator1: TBindNavigator;
    Layout3: TLayout;
    Label3: TLabel;
    EditID: TEdit;
    Layout1: TLayout;
    Label1: TLabel;
    EditDataCadastro: TEdit;
    Layout2: TLayout;
    Label2: TLabel;
    EditPeso: TEdit;
    Layout4: TLayout;
    Label4: TLabel;
    EditCodigo: TEdit;
    Layout5: TLayout;
    Label5: TLabel;
    EditDescricao: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    ImageQrCode: TImage;
    procedure FormShow(Sender: TObject);
    procedure ListViewProdutosButtonClick(const Sender: TObject; const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure ListViewProdutosDblClick(Sender: TObject);
    procedure BindSourceDB1SubDataSourceStateChange(Sender: TObject);
    procedure BindSourceDB1SubDataSourceDataChange(Sender: TObject; Field: TField);
  private
    FCodigoQr: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.fmx}

uses Data.Produto, Classe.QrCode;

procedure TfrmCadProduto.BindSourceDB1SubDataSourceDataChange(Sender: TObject; Field: TField);
var
  lData: string;
  lStm: TMemoryStream;
begin
  if (dmdProduto.qryProduto.IsEmpty) or (dmdProduto.qryProdutoCODIGO.AsString = '') then
  begin
    Exit;
  end;

  lData := dmdProduto.qryProdutoCODIGO.AsString;
  if FCodigoQr <> lData{ CompareStr(FCodigoQr, dmdProduto.qryProdutoCODIGO.AsString) = 0 } then
  begin
    lStm := TMemoryStream.Create;

    TQrCode.Gerar(lData, lStm);

    lStm.Position := 0;
    ImageQrCode.Bitmap.LoadFromStream(lStm);

    FCodigoQr := lData;

    lStm.Free;
  end;
end;

procedure TfrmCadProduto.BindSourceDB1SubDataSourceStateChange(Sender: TObject);
begin
  case BindSourceDB1.DataSet.State of
    dsBrowse: TabControlProduto.ActiveTab := TabPesquisa;
    dsEdit: TabControlProduto.ActiveTab := TabCadastro;
    dsInsert: TabControlProduto.ActiveTab := TabCadastro;
  end;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  dmdProduto.qryProduto.Open;
end;

procedure TfrmCadProduto.ListViewProdutosButtonClick(const Sender: TObject; const AItem: TListItem; const AObject: TListItemSimpleControl);
begin
  TabControlProduto.ActiveTab := TabCadastro;
end;

procedure TfrmCadProduto.ListViewProdutosDblClick(Sender: TObject);
begin
  TabControlProduto.ActiveTab := TabCadastro;
end;

end.
