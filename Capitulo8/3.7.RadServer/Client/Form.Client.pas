unit Form.Client;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.Stan.Error, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, REST.Backend.EMSServices, REST.Backend.EMSFireDAC,
  REST.Backend.EMSProvider, FMX.ScrollBox, FMX.Memo, FMX.ListView, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Controls, Fmx.Bind.Navigator;

type
  TfrmClient = class(TForm)
    LayoutControles: TLayout;
    Button1: TButton;
    Button2: TButton;
    FDSchemaAdapter1: TFDSchemaAdapter;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTableAdapter: TFDTableAdapter;
    memProduto: TFDMemTable;
    ListViewDados: TListView;
    EMSProvider1: TEMSProvider;
    EMSFireDACClient1: TEMSFireDACClient;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    memProdutoidproduto: TLargeintField;
    memProdutodescricao: TWideStringField;
    memProdutogrupo: TWideStringField;
    NavigatorBindSourceDB1: TBindNavigator;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.fmx}

procedure TfrmClient.Button1Click(Sender: TObject);
begin
  EMSFireDACClient1.GetData;
end;

procedure TfrmClient.Button2Click(Sender: TObject);
begin
  EMSFireDACClient1.PostUpdates;
end;

end.
