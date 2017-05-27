unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, ClientModuleUnit1, Classe.Status, StrUtils, Classe.Acao;

type
  TfrmPrincipal = class(TForm)
    pnlOperacao: TPanel;
    edtAcao: TEdit;
    edtQauntidade: TEdit;
    edtValor: TEdit;
    btnVenda: TBitBtn;
    btnCompra: TBitBtn;
    pnlMensagem: TPanel;
    lvtAcoes: TListView;
    btnGetVendas: TBitBtn;
    btnGetCompras: TBitBtn;
    tmrMensagem: TTimer;
    procedure btnCompraClick(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure btnGetComprasClick(Sender: TObject);
    procedure btnGetVendasClick(Sender: TObject);
    procedure lvtAcoesColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvtAcoesCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure tmrMensagemTimer(Sender: TObject);
  private
    FSortedColumn: Integer;
    FDescending: Boolean;
    procedure ExibeLista(pList: TStatusList<TAcao>);
    procedure ExibeMensagem(const pMsg: string);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCompraClick(Sender: TObject);
var
  lStatus: TStatus;
begin
  lStatus := ClientModule1.SMAcaoClient.RegistraTransacaoCompra(edtAcao.Text, StrToInt(edtQauntidade.Text), StrToCurr(edtValor.Text));
  ExibeMensagem(IfThen(lStatus.Erro = '', 'Ok', lStatus.Erro));
end;

procedure TfrmPrincipal.btnGetComprasClick(Sender: TObject);
var
  lStatusList: TStatusList<TAcao>;
begin
  lStatusList := ClientModule1.SMAcaoClient.GetTransacoesCompra;
  ExibeLista(lStatusList);
end;

procedure TfrmPrincipal.btnGetVendasClick(Sender: TObject);
var
  lStatusList: TStatusList<TAcao>;
begin
  lStatusList := ClientModule1.SMAcaoClient.GetTransacoesVenda;
  ExibeLista(lStatusList);
end;

procedure TfrmPrincipal.btnVendaClick(Sender: TObject);
var
  lStatus: TStatus;
begin
  lStatus := ClientModule1.SMAcaoClient.RegistraTransacaoVenda(edtAcao.Text, StrToInt(edtQauntidade.Text), StrToCurr(edtValor.Text));
  ExibeMensagem(IfThen(lStatus.Erro = '', 'Ok', lStatus.Erro));
end;

procedure TfrmPrincipal.ExibeLista(pList: TStatusList<TAcao>);
var
  lAcao: TAcao;
  lItem: TListItem;
begin
  lvtAcoes.Clear;

  if pList.Count = 0 then
  begin
    ExibeMensagem(pList.Erro);
  end else begin
    for lAcao in pList do
    begin
      lItem := lvtAcoes.Items.Add;
      lItem.Caption := lAcao.Abreviatura;
      lItem.SubItems.Add(lAcao.Quantidade.ToString);
      lItem.SubItems.Add(FormatFloat('0.,00', lAcao.Valor));
      lItem.SubItems.Add(FormatFloat('0.,00', lAcao.Quantidade * lAcao.Valor));
    end;
  end;
end;

procedure TfrmPrincipal.ExibeMensagem(const pMsg: string);
begin
  pnlMensagem.Caption := pMsg;
  tmrMensagem.Enabled := True;
end;

procedure TfrmPrincipal.lvtAcoesColumnClick(Sender: TObject;
  Column: TListColumn);
// source:
// http://www.delphitips.net/2008/04/10/sort-listview-by-clicking-on-columns/
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> FSortedColumn then
  begin
    FSortedColumn := Column.Index;
    FDescending := False;
  end else
    FDescending := not FDescending;

  TListView(Sender).SortType := stText;
end;

procedure TfrmPrincipal.lvtAcoesCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);

begin
  if FSortedColumn = 0 then
  begin
    Compare := CompareText(Item1.Caption, Item2.Caption)
  end else if FSortedColumn <> 0 then
  begin
    Compare := CompareText(Item1.SubItems[FSortedColumn-1],
      Item2.SubItems[FSortedColumn-1]);
  end;

  if FDescending then
  begin
    Compare := -Compare;
  end;
end;

procedure TfrmPrincipal.tmrMensagemTimer(Sender: TObject);
begin
  tmrMensagem.Enabled := False;
  pnlMensagem.Caption := '';
end;

end.
