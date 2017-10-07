unit Form.Grid.Test;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  FMX.Grid.Style, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Grid,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Layouts,
  Data.Bind.Grid, Classe.Produto, ClientModuleUnit1, Fmx.Bind.Grid,
  Fmx.Bind.Editors;

type
  TfrmGridTest = class(TForm)
    BindingsList1: TBindingsList;
    Layout1: TLayout;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    absProduto: TAdapterBindSource;
    LinkGridToDataSourceabsProduto: TLinkGridToDataSource;
    procedure absProdutoCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridTest: TfrmGridTest;

implementation

{$R *.fmx}

procedure TfrmGridTest.absProdutoCreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
var
  lListaProduto: TListaProduto;
begin
  lListaProduto := TListaProduto.Create;
  lListaProduto.AddRange(ClientModule1.ServerMethods1Client.GetListaProdutos.ToArray);
  ABindSourceAdapter := TListBindSourceAdapter<TProduto>.Create(Self, lListaProduto { False });
end;

end.
