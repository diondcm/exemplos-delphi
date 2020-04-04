unit Form.Cadastro.Cliente.FMX;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, Data.DB,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Controls, FMX.Layouts, Fmx.Bind.Navigator, Data.Bind.Components, Data.Bind.DBScope,
  FMX.ListView, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmCadCliente = class(TForm)
    TabControlCadastro: TTabControl;
    TabPesquisa: TTabItem;
    TabCadastro: TTabItem;
    ListViewCliente: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindNavigator1: TBindNavigator;
    Label1: TLabel;
    EditNome: TEdit;
    Layout1: TLayout;
    Layout2: TLayout;
    Label2: TLabel;
    EditDataCadastro: TEdit;
    Layout3: TLayout;
    Label3: TLabel;
    EditID: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    procedure FormShow(Sender: TObject);
    procedure ListViewClienteButtonClick(const Sender: TObject; const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure ListViewClienteDblClick(Sender: TObject);
    procedure BindSourceDB1SubDataSourceStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.fmx}

uses Data.Cliente;

procedure TfrmCadCliente.BindSourceDB1SubDataSourceStateChange(Sender: TObject);
begin
  case BindSourceDB1.DataSet.State of
    dsBrowse:TabControlCadastro.ActiveTab := TabPesquisa;
    dsEdit: TabControlCadastro.ActiveTab := TabCadastro;
    dsInsert: TabControlCadastro.ActiveTab := TabCadastro;
  end;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  TabControlCadastro.ActiveTab := TabPesquisa;
  dmdCliente.qryCliente.Open;
end;

procedure TfrmCadCliente.ListViewClienteButtonClick(const Sender: TObject; const AItem: TListItem; const AObject: TListItemSimpleControl);
begin
  TabControlCadastro.ActiveTab := TabCadastro;
end;

procedure TfrmCadCliente.ListViewClienteDblClick(Sender: TObject);
begin
  TabControlCadastro.ActiveTab := TabCadastro;
end;

end.
