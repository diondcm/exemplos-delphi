unit Form.Principal.Tabs;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Fmx.Bind.GenData, Data.Bind.GenData, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, FMX.ListView, Data.Bind.ObjectScope, FMX.TabControl, FMX.Gestures, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Generics.Collections, FMX.Edit, FMX.Objects, FMX.Layouts, System.Math.Vectors, FMX.Controls3D, FMX.Layers3D;

type
  TfrmPrincipalTabs = class(TForm)
    tabControlPrincipal: TTabControl;
    tabDetail: TTabItem;
    tabCadastro: TTabItem;
    tabPesquisa: TTabItem;
    PrototypeBindSource1: TPrototypeBindSource;
    listContatos: TListView;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    GestureManager1: TGestureManager;
    ToolBar1: TToolBar;
    buttonVoltar: TButton;
    Layout1: TLayout;
    Image1: TImage;
    Layout2: TLayout;
    editNomeContato: TEdit;
    Label1: TLabel;
    Layout3: TLayout;
    editTituloContato: TEdit;
    Label2: TLabel;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    Layout3D1: TLayout3D;
    Layout4: TLayout;
    buttonDetalhes: TButton;
    Image2: TImage;
    procedure listContatosItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure buttonVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buttonDetalhesClick(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
  private
    FListTabs: TList<TTabItem>;
    procedure TrocaTab(pTabItem: TTabItem);
  public
    { Public declarations }
  end;

var
  frmPrincipalTabs: TfrmPrincipalTabs;

implementation

{$R *.fmx}

procedure TfrmPrincipalTabs.buttonDetalhesClick(Sender: TObject);
begin
  TrocaTab(tabDetail);
end;

procedure TfrmPrincipalTabs.buttonVoltarClick(Sender: TObject);
begin
  if FListTabs.Count > 0 then
  begin
    tabControlPrincipal.ActiveTab := FListTabs.Last;
    FListTabs.Delete(FListTabs.Count -1);
  end;
end;

procedure TfrmPrincipalTabs.FormCreate(Sender: TObject);
begin
{$IFDEF IOS}
  //tabControlPrincipal.TabPosition := TTabPosition.Bottom;
{$ENDIF}

{$IFDEF ANDROID}
  //tabControlPrincipal.TabPosition := TTabPosition.Top;
{$ENDIF}

  FListTabs := TList<TTabItem>.Create;
end;

procedure TfrmPrincipalTabs.FormDestroy(Sender: TObject);
begin
  FListTabs.Free;
end;

procedure TfrmPrincipalTabs.FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = sgiLeft then
  begin
    if tabControlPrincipal.ActiveTab = tabPesquisa then
    begin
      TrocaTab(tabCadastro);
    end else if tabControlPrincipal.ActiveTab = tabCadastro then
    begin
      TrocaTab(tabDetail);
    end;
  end else if EventInfo.GestureID = sgiRight then
  begin
    buttonVoltarClick(Sender);
  end;
end;

procedure TfrmPrincipalTabs.FormShow(Sender: TObject);
begin
  tabControlPrincipal.ActiveTab := tabPesquisa;
end;

procedure TfrmPrincipalTabs.listContatosItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  TrocaTab(tabCadastro);
end;

procedure TfrmPrincipalTabs.TrocaTab(pTabItem: TTabItem);
begin
  FListTabs.Add(tabControlPrincipal.ActiveTab);
  tabControlPrincipal.ActiveTab := pTabItem;
end;

end.
