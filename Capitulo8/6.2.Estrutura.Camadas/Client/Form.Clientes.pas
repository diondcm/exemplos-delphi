unit Form.Clientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.Cliente, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmClientes = class(TForm)
    ToolBar1: TToolBar;
    ButtonClose: TButton;
    ListViewClientes: TListView;
    TimerOpen: TTimer;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure ButtonCloseClick(Sender: TObject);
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.fmx}

procedure TfrmClientes.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  TimerOpen.Enabled := True;
end;

procedure TfrmClientes.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;
  dmdCliente.qryClientes.Open;
end;

end.
