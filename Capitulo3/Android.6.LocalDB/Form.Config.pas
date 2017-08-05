unit Form.Config;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, Data.Geral, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Edit, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Controls,
  Fmx.Bind.Navigator;

type
  TfrmConfig = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    ToolBar1: TToolBar;
    btnGoBack: TButton;
    Layout1: TLayout;
    VertScrollBox1: TVertScrollBox;
    btnCancelar: TButton;
    btnSalvar: TButton;
    bsdConfig: TBindSourceDB;
    lblConfig1: TLabel;
    edtConfig1: TEdit;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    NavigatorBindSourceDB1: TBindNavigator;
    procedure btnGoBackClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure GoBack;
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.fmx}

procedure TfrmConfig.btnCancelarClick(Sender: TObject);
begin
  GoBack;
end;

procedure TfrmConfig.btnGoBackClick(Sender: TObject);
begin
  GoBack;
end;

procedure TfrmConfig.btnSalvarClick(Sender: TObject);
begin
  dmDados.qryConfig.Post;
  Hide;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  dmDados.qryConfig.Open;
end;

procedure TfrmConfig.GoBack;
begin
  dmDados.qryConfig.Cancel;
  Hide;
end;

end.
