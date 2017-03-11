unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.Layouts, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo, ClientModuleUnit1, Classe.Produto, Classe.Retorno,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.ObjectScope,
  Form.Cadastro.Produto, FMX.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Memo1: TMemo;
    Layout1: TLayout;
    StringGrid1: TStringGrid;
    absProduto: TAdapterBindSource;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceAdapterBindSource1: TLinkGridToDataSource;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure absProdutoCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.absProdutoCreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
var
  lListaProduto: TListaProduto;
begin
  lListaProduto := TListaProduto.Create;
  lListaProduto.AddRange(ClientModule1.ServerMethods1Client.GetListaProdutos.ToArray);
  ABindSourceAdapter := TListBindSourceAdapter<TProduto>.Create(Self, lListaProduto { False });
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  frmCadastroProduto.Show;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
//var
//  lLista: TListaProduto;
begin
//  lLista := ClientModule1.ServerMethods1Client.GetListaProdutos;
  // todo: memo to JSON
end;

end.
