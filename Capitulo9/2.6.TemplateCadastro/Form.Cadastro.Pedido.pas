unit Form.Cadastro.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB, Vcl.ExtCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.Pedido, Vcl.Mask, Vcl.DBCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.WinXPickers, Form.Pesquisa, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Classe.Mensagem, Form.Cadastro.Item, Vcl.Menus, Classe.Grid.Helper;

type
  TfrmCadPedido = class(TfrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    DateTimePicker1: TDateTimePicker;
    LinkControlToField1: TLinkControlToField;
    buttonPesquisa: TBitBtn;
    LabelPedidos: TLabel;
    PanelItens: TPanel;
    Label2: TLabel;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    dtsItens: TDataSource;
    PanelCadItens: TPanel;
    Label7: TLabel;
    DBGrid2: TDBGrid;
    PanelCadItemControle: TPanel;
    ButtonAddItem: TBitBtn;
    ButtonEditItem: TBitBtn;
    ButtonDelete: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure buttonPesquisaClick(Sender: TObject);
    procedure dtsDadosStateChange(Sender: TObject);
    procedure ButtonAddItemClick(Sender: TObject);
    procedure ButtonEditItemClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure dtsItensDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
  private
//    FQtdExecucao: Integer;
    FdmdPedidos: TdmdPedido;
    procedure OnAfterScrollOldLocal(pQtd: Integer);
  public
    { Public declarations }
  end;

var
  frmCadPedido: TfrmCadPedido;

implementation

{$R *.dfm}

uses Data.Cliente;
//uses Form.Cadastro.Cliente;

procedure TfrmCadPedido.ButtonAddItemClick(Sender: TObject);
begin
  TfrmCadItem.AdicionaItem(FdmdPedidos);
end;

procedure TfrmCadPedido.ButtonDeleteClick(Sender: TObject);
begin
  TfrmCadItem.DeletaItem(FdmdPedidos);
end;

procedure TfrmCadPedido.ButtonEditItemClick(Sender: TObject);
begin
  TfrmCadItem.EditaItem(FdmdPedidos);
end;

procedure TfrmCadPedido.buttonPesquisaClick(Sender: TObject);
begin
  if not (DmdDados.qryDados.State in dsEditModes) then
  begin
    TMensagem.Aviso('Cadastro deve estar em edição para alterar o cliente');
  end else begin

    TfrmPesquisa.Executa(FdmdPedidos.qryPesquisaCliente,
      function (pFormPesquisa: TfrmPesquisa): Boolean
      begin
        Result := False;
        var ldmdCliente: TdmdCliente := TdmdCliente.Create(Self);
        ldmdCliente.ValidaValoresDeSaldo(pFormPesquisa.DataSetPesquisa.FieldByName('SALDO').AsCurrency);

//        frmCadastroCliente.Editar1;
//        frmCadastroCliente.ButtonSalvarClick(Sender);

        if pFormPesquisa.DataSetPesquisa.FieldByName('SALDO').AsCurrency > 5000{param do DB} then
        begin
          TMensagem.Aviso('Cliente selecionado não pode ter mais de R$ ' + FormatFloat('0.,00', 5000) + ' de saldo em aberto.');
          Result := False;
        end else begin
          if not pFormPesquisa.DataSetPesquisa.IsEmpty then
          begin
            DmdDados.qryDados.FieldByName('IDCLIENTE').AsInteger := pFormPesquisa.DataSetPesquisa.FieldByName('ID').AsInteger;
            DmdDados.qryDados.FieldByName('CLIENTE').ReadOnly := False;
            DmdDados.qryDados.FieldByName('CLIENTE').AsString := pFormPesquisa.DataSetPesquisa.FieldByName('NOME').AsString;
            DmdDados.qryDados.FieldByName('CLIENTE').ReadOnly := True;
            Result := True;
          end else begin
            TMensagem.Aviso('Selecione um cliente ou cancele para sair');
          end;
        end;
      end);
  end;
end;

procedure TfrmCadPedido.DBGrid1TitleClick(Column: TColumn);
begin
  DBGrid1.IdexaPorField(Column);
end;

procedure TfrmCadPedido.DBGrid2TitleClick(Column: TColumn);
begin
  DBGrid2.IdexaPorField(Column);
end;

procedure TfrmCadPedido.dtsDadosStateChange(Sender: TObject);
begin
  inherited;
  buttonPesquisa.Enabled := dtsDados.DataSet.State in dsEditModes;
end;

procedure TfrmCadPedido.dtsItensDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if FdmdPedidos.qryItens.IsEmpty then // vazio e closed
  begin
    StatusBarCadastro.Panels[1].Text := 'Sem itens para exibir';
  end else begin
    StatusBarCadastro.Panels[1].Text := IntToStr(FdmdPedidos.qryItens.RecordCount) + ' Itens no pedido selecionado';
  end;
end;

procedure TfrmCadPedido.FormCreate(Sender: TObject);
begin
  inherited;
  FdmdPedidos := TdmdPedido.Create(Self);
  DmdDados := FdmdPedidos;
  dtsItens.DataSet := FdmdPedidos.qryItens;

//  FdmdPedidos.OnAfterScroll :=
//    procedure (pQtd: Integer)
//    begin
//      Caption := IntToStr(pQtd);
//    end;

  FdmdPedidos.OnAfterScrollOld := OnAfterScrollOldLocal;
end;

procedure TfrmCadPedido.OnAfterScrollOldLocal(pQtd: Integer);
begin
  Caption := IntToStr(pQtd);
end;

end.
