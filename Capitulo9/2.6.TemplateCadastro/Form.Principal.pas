unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Cadastro.Cliente, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus, System.ImageList, Vcl.ImgList, Data.Imagens,
  Form.Cadastro.Produto, Form.Cadastro.Pedido, Vcl.StdCtrls, System.IOUtils, Classe.Strings.Helper;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Cadastros1: TMenuItem;
    Cliente1: TMenuItem;
    ActionList1: TActionList;
    ActionClientes: TAction;
    ToolButton2: TToolButton;
    ActionProdutos: TAction;
    ButtonPedido: TToolButton;
    ActionPedido: TAction;
    Memo1: TMemo;
    procedure ActionClientesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionProdutosExecute(Sender: TObject);
    procedure ActionPedidoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ActionClientesExecute(Sender: TObject);
begin
  // frmCadastroCliente.Show; // para apenas 1 cadastro
  TfrmCadastroCliente.Create(Application).Show; // instacia mais de um cadastro
end;

procedure TfrmPrincipal.ActionPedidoExecute(Sender: TObject);
begin
  TfrmCadPedido.Create(Application).Show;
end;

procedure TfrmPrincipal.ActionProdutosExecute(Sender: TObject);
begin
  TfrmCadProduto.Create(Application).Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
//const
//  ARQ = 'Arq.txt';
//var
//  lStl: TStringList;
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Memo1.Text := 'Arq.txt'.GetFileContents;

//  'Arquivo carregado com sucesso.'.Avisa;

  // ForEach() - Js
  // qry.ForEach(procedure)

//  if TFile.Exists(ARQ) then
//  begin
//    lStl := TStringList.Create(ARQ);
    //lStl.LoadFromFile(ARQ);

//    Tag.ToString


//    Memo1.Text := lStl.Text;
    // Memo1.Lines.LoadFromFile(ARQ);

//    lStl.Free;
//  end;
end;
end.
