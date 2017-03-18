unit Form.Cadastro.Produto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, System.Generics.Collections,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope, FMX.ListView, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, ClientModuleUnit1,
  Classe.Produto, Data.Produto, FMX.Layouts, FMX.StdCtrls, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, System.Actions, FMX.ActnList, FMX.VirtualKeyboard, FMX.Platform,
  Classe.Retorno, Form.Segundo.Plano;

type
  TfrmCadastroProduto = class(TForm)
    tbcProdutos: TTabControl;
    tabPesquisa: TTabItem;
    tabCadastro: TTabItem;
    lsvProdutos: TListView;
    bdsProduto: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    GridPanelLayout1: TGridPanelLayout;
    edtDescricaoProduto: TEdit;
    edtValorProduto: TEdit;
    imgProduto: TImage;
    btnOK: TButton;
    btnCancel: TButton;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    ActionList1: TActionList;
    actChangeTab: TChangeTabAction;
    ToolBar1: TToolBar;
    btnRetornar: TButton;
    lblTituloForm: TLabel;
    tmrPropulaProdutos: TTimer;
    btnIncluiProduto: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lsvProdutosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure tmrPropulaProdutosTimer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnIncluiProdutoClick(Sender: TObject);
  private
    FListaTab: TList<TTabItem>;
    FdmdProduto: TdmdProduto;
    procedure NavegaTab(pTab: TTabItem);
    procedure RetornaTab;
  public
    procedure PopulaListaProdutos;
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.fmx}

{ TfrmCadastroProduto }

procedure TfrmCadastroProduto.btnIncluiProdutoClick(Sender: TObject);
begin
  bdsProduto.DataSet.Insert; // if assigned(bdsProduto.DataSet) then
  NavegaTab(tabCadastro);
end;

procedure TfrmCadastroProduto.btnOKClick(Sender: TObject);
var
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  lProduto.ID := bdsProduto.DataSet.FieldByName('ID').AsInteger; // if assigned(bdsProduto.DataSet) then
  lProduto.Descricao := edtDescricaoProduto.Text; // bdsProduto.DataSet.FieldByName('ID').AsInteger;
  lProduto.Valor := StrToCurrDef(edtValorProduto.Text, 0);

  FdmdProduto.AtualizaProduto(lProduto,
    procedure
    begin
      ShowMessage('Registro atualizado com sucesso.');
      RetornaTab;
    end,

    procedure(const pMsg: string)
    begin
      ShowMessage(pMsg);
      //edtDescricaoProduto.TextPrompt := 'Deve ser preenchido!'
      // GlowEfect
    end);
end;

procedure TfrmCadastroProduto.btnRetornarClick(Sender: TObject);
begin
  RetornaTab;
end;

procedure TfrmCadastroProduto.FormCreate(Sender: TObject);
begin
  FListaTab := TList<TTabItem>.Create; // todo: TStack<T>
  FdmdProduto := TdmdProduto.Create(Self);
  bdsProduto.DataSet := FdmdProduto.fmdProduto;

  {$IFDEF ANDROID or iOS}
  tbcProdutos.TabPosition := TTabPosition.None;
  {$ENDIF}
end;

procedure TfrmCadastroProduto.FormDestroy(Sender: TObject);
begin
  FListaTab.Free;
end;

procedure TfrmCadastroProduto.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
{$IFDEF ANDROID}
var
  lServicoTeclado: IFMXVirtualKeyboardService;
{$ENDIF}
begin
{$IFDEF ANDROID}
  if Key = vkReturn then
  begin
    Key := vkTab;
    KeyDown(Key, KeyChar, Shift);
  end else if Key = vkHardwareBack then
  begin
    TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(lServicoTeclado));
    if (lServicoTeclado <> nil) and (TVirtualKeyboardState.Visible in lServicoTeclado.VirtualKeyBoardState) then
    begin
      { Teclado visivel = não faz nada }
    end else begin
      Key := 0;
      RetornaTab;
//      if (tbcProdutos.TabIndex > 0) then
//      begin
//        tbcProdutos.Previous();
//      end else begin
         // todo: verificar se ainda vale
         // Androidapi.Helpers
       // TAndroidHelper.Activity.finish;
//      end;
    end;
  end;
{$ENDIF}
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
//  tmrPropulaProdutos.Enabled := True;

  NavegaTab(tabPesquisa);

//  TThread.Synchronize(nil, -> executa com mais urguência

//  TThread.Queue(nil,
//    procedure
//    begin
//      PopulaListaProdutos;
//    end);

   TfrmSegundoPlano.Executar(
     procedure
     begin
       PopulaListaProdutos;
     end);


  //PopulaListaProdutos; -> pode gerar impressão de tela travada, melhor com queue
end;

procedure TfrmCadastroProduto.lsvProdutosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  NavegaTab(tabCadastro);
//  tbcProdutos.ActiveTab := tabCadastro;
//  lblTituloForm.Text := tabCadastro.Text;

//  prcedure ChangeTab(pTabParametro: TTabItem)
//    actChangeTab.Tab := pTabParametro;
//    actChangeTab.Execute;
end;

procedure TfrmCadastroProduto.NavegaTab(pTab: TTabItem);
begin
  tbcProdutos.ActiveTab := pTab;
  lblTituloForm.Text := pTab.Text;

  btnIncluiProduto.Visible := tbcProdutos.ActiveTab = tabPesquisa;

  FListaTab.Add(pTab);
end;

procedure TfrmCadastroProduto.PopulaListaProdutos;
begin
  FdmdProduto.GetServerProdutos;
end;

procedure TfrmCadastroProduto.RetornaTab;
begin
  // if moda loco:
//  if tbcProdutos.ActiveTab = tabCadastro then
//    NavegaTab(tabPesquisa);
  if FListaTab.Count > 1 then
  begin
    NavegaTab(FListaTab[FListaTab.Count -2]);
  end else if FListaTab.Count = 1 then
  begin
    NavegaTab(FListaTab.Last);
  end else if FListaTab.Count = 0 then
  begin
    Close;
  end;
end;

procedure TfrmCadastroProduto.tmrPropulaProdutosTimer(Sender: TObject);
begin
  // Não tão elegante quanto Queue, veja form->OnShow

  tmrPropulaProdutos.Enabled := False;
  PopulaListaProdutos;
end;

end.
