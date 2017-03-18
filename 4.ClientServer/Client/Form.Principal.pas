unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.Layouts, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo, ClientModuleUnit1, Classe.Produto, Classe.Retorno,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.ObjectScope,
  Form.Cadastro.Produto, FMX.StdCtrls, FMX.Objects;

type
  TfrmPrincipal = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    Image1: TImage;
    imgGrids: TImage;
    imgProdutos: TImage;
    procedure FormShow(Sender: TObject);
    procedure imgProdutosClick(Sender: TObject);
    procedure imgGridsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.FormShow(Sender: TObject);
//var
//  lLista: TListaProduto;
begin
//  lLista := ClientModule1.ServerMethods1Client.GetListaProdutos;
  // todo: memo to JSON
end;

procedure TfrmPrincipal.imgGridsClick(Sender: TObject);
begin
  // todo: Form dos grids
end;

procedure TfrmPrincipal.imgProdutosClick(Sender: TObject);
begin
  frmCadastroProduto.Show;
end;

end.
