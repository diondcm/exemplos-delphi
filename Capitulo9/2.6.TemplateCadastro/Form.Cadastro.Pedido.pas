unit Form.Cadastro.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB, Vcl.ExtCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.Pedido, Vcl.Mask, Vcl.DBCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.WinXPickers, Form.Pesquisa, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    procedure FormCreate(Sender: TObject);
    procedure buttonPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPedido: TfrmCadPedido;

implementation

{$R *.dfm}

procedure TfrmCadPedido.buttonPesquisaClick(Sender: TObject);
var
  lFrm: TfrmPesquisa;
  lQry: TFdQuery;
begin
  inherited;
//  TfrmPesquisa.Create(Self).ShowModal;
  lFrm := TfrmPesquisa.Create(Self);
  lQry := TFDQuery.Create(lFrm);
  lQry.Connection := DmdDados.qryDados.Connection;
  lQry.Open('Select ID ' + QuotedStr('Cód') +', NOME ' + QuotedStr('Nome') + ' from cliente');
  lFrm.DataSetPesquisa := lQry;
  if lFrm.ShowModal = mrYes then
  begin
    // registro selecionado
  end;
end;

procedure TfrmCadPedido.FormCreate(Sender: TObject);
begin
  inherited;
  DmdDados := TdmdPedido.Create(Self);
end;

end.
