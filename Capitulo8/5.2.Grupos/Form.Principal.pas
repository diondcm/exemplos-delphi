unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Form.Exibe.Dados, Data.Grupo, frxClass;

type
  TfrmPrincipal = class(TForm)
    FlowPanel1: TFlowPanel;
    ButtonGrupo: TButton;
    ButtonListaProdutos: TButton;
    Splitter1: TSplitter;
    ImagemRelatorio: TImage;
    PopupMenuExibeDados: TPopupMenu;
    ExibeDados1: TMenuItem;
    ExibeProdutoCategoria1: TMenuItem;
    ExibeListaProdutos1: TMenuItem;
    procedure ExibeDados1Click(Sender: TObject);
    procedure ExibeProdutoCategoria1Click(Sender: TObject);
    procedure ExibeListaProdutos1Click(Sender: TObject);
    procedure ButtonGrupoClick(Sender: TObject);
    procedure ImagemRelatorioDblClick(Sender: TObject);
    procedure ButtonListaProdutosClick(Sender: TObject);
  private
    { Private declarations }
    FRelRef: TfrxReport;
  public
    { Public declarations }
    procedure CarregaRelatorio(pNome: string);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonGrupoClick(Sender: TObject);
begin
  CarregaRelatorio('Categoria');
end;

procedure TfrmPrincipal.ButtonListaProdutosClick(Sender: TObject);
begin
  CarregaRelatorio('listaproduto');
end;

procedure TfrmPrincipal.CarregaRelatorio(pNome: string);
var
  lImagem: string;
begin
  lImagem := ChangeFileExt(ExtractFilePath(ParamStr(0)) +  pNome, '.png');
  if FileExists(lImagem) then
  begin
    ImagemRelatorio.Picture.LoadFromFile(lImagem);
  end;

  if pNome.ToLower = 'categoria' then
  begin
    FRelRef := dmdGrupo.frxReportListaGrupo;
  end else if pNome.ToLower = 'listaproduto' then
  begin
    FRelRef := dmdGrupo.frxReportListaProduto;
  end;
end;

procedure TfrmPrincipal.ExibeDados1Click(Sender: TObject);
begin
  TfrmExibeDados.ExibeDados(dmdGrupo.qryCategoria, dmdGrupo.qryProduto);
end;

procedure TfrmPrincipal.ExibeListaProdutos1Click(Sender: TObject);
begin
  dmdGrupo.frxReportListaProduto.ShowReport;
end;

procedure TfrmPrincipal.ExibeProdutoCategoria1Click(Sender: TObject);
begin
  dmdGrupo.frxReportListaGrupo.ShowReport;
end;

procedure TfrmPrincipal.ImagemRelatorioDblClick(Sender: TObject);
begin
  if Assigned(FRelRef) then
  begin
    FRelRef.ShowReport();
  end;
end;

end.
