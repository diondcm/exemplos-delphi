unit Form.Tabs;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  Data.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.Edit, FMX.Layouts, Fmx.Bind.GenData;

type
  TfrmTabs = class(TForm)
    TabControlGeral: TTabControl;
    ToolBar1: TToolBar;
    ButtonVoltar: TButton;
    TabLogo: TTabItem;
    TabLista: TTabItem;
    TabDetalhe: TTabItem;
    ImageLogo: TImage;
    ListViewContatos: TListView;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Layout1: TLayout;
    ImageContato: TImage;
    Layout2: TLayout;
    Label2: TLabel;
    EditNome: TEdit;
    Layout3: TLayout;
    Label1: TLabel;
    EditCargo: TEdit;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    Layout4: TLayout;
    ButtonListaContatos: TButton;
    VertScrollBox1: TVertScrollBox;
    LayoutTeclado: TLayout;
    procedure ButtonVoltarClick(Sender: TObject);
    procedure ImageLogoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListViewContatosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ButtonListaContatosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTabs: TfrmTabs;

implementation

{$R *.fmx}

procedure TfrmTabs.ButtonListaContatosClick(Sender: TObject);
begin
  TabControlGeral.ActiveTab := TabLista;
end;

procedure TfrmTabs.ButtonVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTabs.FormCreate(Sender: TObject);
begin
  TabControlGeral.ActiveTab := TabLogo;
  TabControlGeral.TabPosition := TTabPosition.None;
end;

procedure TfrmTabs.ImageLogoClick(Sender: TObject);
begin
  TabControlGeral.ActiveTab := TabLista;
end;

procedure TfrmTabs.ListViewContatosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  TabControlGeral.ActiveTab := TabDetalhe;
end;

end.
