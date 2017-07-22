unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, Fmx.Bind.GenData,
  Data.Bind.GenData, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  FMX.ListView, Data.Bind.ObjectScope, FMX.Layouts, FMX.Objects, FMX.Edit,
  System.Actions, FMX.ActnList, FMX.Gestures, Frame.Detalhes;

type
  TfrmPrincipal = class(TForm)
    tbcPrincipal: TTabControl;
    tlbPrincipal: TToolBar;
    tabPesquisa: TTabItem;
    tabCadastro: TTabItem;
    tabDetail: TTabItem;
    btnBack: TButton;
    PrototypeBindSource1: TPrototypeBindSource;
    lsvItens: TListView;
    SizeGrip1: TSizeGrip;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    edtNomeContato: TEdit;
    edtTituloContato: TEdit;
    imgContato: TImage;
    lblNomeContato: TLabel;
    lblTituloContato: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    ActionList1: TActionList;
    actClose: TAction;
    GestureManager1: TGestureManager;
    fraDetalhes1: TfraDetalhes;
    procedure lsvItensItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormShow(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.actCloseExecute(Sender: TObject);
begin
  if tbcPrincipal.ActiveTab <> tabPesquisa then
  begin
    tbcPrincipal.ActiveTab := tabPesquisa;
  end else begin
    Close;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
{$IFDEF IOS}
  //tbcPrincipal.TabPosition := TTabPosition.Bottom;
{$ENDIF}
{$IFDEF ANDROID}
  //tbcPrincipal.TabPosition := TTabPosition.Top;
{$ENDIF}
end;

procedure TfrmPrincipal.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = sgiRight then
  begin
    if tbcPrincipal.ActiveTab = tabCadastro then
    begin
      tbcPrincipal.ActiveTab := tabDetail;
    end;
  end else if EventInfo.GestureID = sgiLeft then
  begin
    if tbcPrincipal.ActiveTab = tabDetail then
    begin
      tbcPrincipal.ActiveTab := tabCadastro;
    end;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  tbcPrincipal.ActiveTab := tabPesquisa;
end;

procedure TfrmPrincipal.lsvItensItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  tbcPrincipal.ActiveTab := tabCadastro;
end;

end.
