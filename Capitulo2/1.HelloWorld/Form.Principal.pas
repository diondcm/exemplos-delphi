unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.TabControl, System.Rtti,
  FMX.Grid.Style, FMX.Grid, Data.Bind.Controls, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Fmx.Bind.Navigator, Data.Bind.ObjectScope,
  Data.Bind.GenData, Fmx.Bind.Grid, Data.Bind.Grid;

type
  TfrmPrincipal = class(TForm)
    lblMensagem: TLabel;
    tbcPrincipal: TTabControl;
    tabInicial: TTabItem;
    tabControles: TTabItem;
    tabItens: TTabItem;
    edtTexto: TEdit;
    memLog: TMemo;
    btnAddLog: TButton;
    ltbItens: TListBox;
    Layout1: TLayout;
    btnCarrega: TButton;
    lytTop: TLayout;
    lytDados: TLayout;
    stgDados: TStringGrid;
    PrototypeBindSource1: TPrototypeBindSource;
    NavigatorPrototypeBindSource1: TBindNavigator;
    Edit1: TEdit;
    BindingsList1: TBindingsList;
    LinkControlToPropertyText: TLinkControlToProperty;
    CheckBox1: TCheckBox;
    LinkControlToPropertyEnabled: TLinkControlToProperty;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
    procedure btnAddLogClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCarregaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses Form.Frames;

procedure TfrmPrincipal.btnAddLogClick(Sender: TObject);
begin
  memLog.Lines.Add('Log:' + edtTexto.Text);
  ltbItens.Items.Add(DateToStr(Now()));
end;

procedure TfrmPrincipal.btnCarregaClick(Sender: TObject);
begin
  frmFrames.Show;
//  frmFrames.ShowModal = NÃO
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
{$IFDEF IOS}// {$IFDEF ANDROID}
  tbcPrincipal.TabPosition := TTabPosition.Bottom;
{$ENDIF}
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  tbcPrincipal.ActiveTab := tabInicial;
end;

end.
