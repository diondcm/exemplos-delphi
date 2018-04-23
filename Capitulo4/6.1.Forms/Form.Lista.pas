unit Form.Lista;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, Fmx.Bind.GenData, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListView;

type
  TfrmLista = class(TForm)
    listItens: TListView;
    ToolBar1: TToolBar;
    buttonVoltar: TButton;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure buttonVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLista: TfrmLista;

implementation

{$R *.fmx}

procedure TfrmLista.buttonVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
