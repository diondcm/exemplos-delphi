unit Form.Cadastro.Cliente.VCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.StdCtrls, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmCadClienteVCL = class(TForm)
    PageControlCadastro: TPageControl;
    TabPesquisa: TTabSheet;
    TabCadastro: TTabSheet;
    DBGrid1: TDBGrid;
    dtsCliente: TDataSource;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    EditID: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    EditNome: TEdit;
    DBEdit1: TDBEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    DateTimePicker1: TDateTimePicker;
    LinkControlToField3: TLinkControlToField;
    procedure FormShow(Sender: TObject);
    procedure dtsClienteStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClienteVCL: TfrmCadClienteVCL;

implementation

{$R *.dfm}

uses Data.Cliente;

procedure TfrmCadClienteVCL.dtsClienteStateChange(Sender: TObject);
begin
  case dtsCliente.DataSet.State of
    dsBrowse: PageControlCadastro.ActivePage := TabPesquisa;
    dsEdit: PageControlCadastro.ActivePage := TabCadastro;
    dsInsert: PageControlCadastro.ActivePage := TabCadastro;
  end;
end;

procedure TfrmCadClienteVCL.FormShow(Sender: TObject);
begin
  PageControlCadastro.ActivePage := TabPesquisa;
  dmdCliente.qryCliente.Open;
end;

end.
