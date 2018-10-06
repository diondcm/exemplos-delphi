unit Form.Dados;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListView,
  Data.Dados, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Controls, FMX.Layouts, Fmx.Bind.Navigator;

type
  TfrmDados = class(TForm)
    ListViewDados: TListView;
    ToolBar1: TToolBar;
    ButtonClose: TButton;
    ButtonOpen: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    NavigatorBindSourceDB1: TBindNavigator;
    procedure ButtonOpenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmDados.ButtonOpenClick(Sender: TObject);
begin
  dmdDados.TemDadosLocais;
end;

end.
