unit Form.Cadastro.Produto.VCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, WinApi.WinInet,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.WinXPickers, Vcl.StdCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, Vcl.DBCtrls, System.NetEncoding, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TfrmCadProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    dtsProduto: TDataSource;
    LabelID: TLabel;
    Label2: TLabel;
    EditDescricao: TEdit;
    Label1: TLabel;
    EditCodigo: TEdit;
    Label3: TLabel;
    EditPeso: TEdit;
    DatePicker1: TDatePicker;
    Label4: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    DBNavigator1: TDBNavigator;
    ButtonCarregaProdutos: TButton;
    ListBoxProdutos: TListBox;
    Button1: TButton;
    Panel4: TPanel;
    ImageQrCode: TImage;
    DateTimePicker1: TDateTimePicker;
    LinkControlToField4: TLinkControlToField;
    LinkPropertyToFieldDate: TLinkPropertyToField;
    procedure FormShow(Sender: TObject);
    procedure ButtonCarregaProdutosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dtsProdutoDataChange(Sender: TObject; Field: TField);
  private
    FCodigoQr: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses Data.Produto, Classe.QrCode;

procedure TfrmCadProduto.Button1Click(Sender: TObject);
//var
//  lProduto: TProduto;
//  lMsg: string;
begin
//  for lProduto in dmdProduto.ListaProduto.Values do
//  begin
//    lMsg := lMsg + slineBreak + lProduto.ToString;
////    lMsg := lMsg + slineBreak + 'ID: ' + lProduto.ID.ToString + ', ' + 'Desc. ' + lProduto.Descricao;
//  end;
  ShowMessage(dmdProduto.ListaProduto.ToString);
end;

procedure TfrmCadProduto.ButtonCarregaProdutosClick(Sender: TObject);
//var
//  lProduto: TProduto;
begin
  ListBoxProdutos.Items.Clear;
  ListBoxProdutos.Items.Text := dmdProduto.ListaProduto.ToString;

//  for lProduto in dmdProduto.ListaProduto.Values do
//  begin
//    ListBoxProdutos.Items.Add(lProduto.ToString);
//  end;
end;


procedure TfrmCadProduto.dtsProdutoDataChange(Sender: TObject; Field: TField);
var
  lData: string;
  lStm: TMemoryStream;
  lPng: TPngImage;
begin
  if (dmdProduto.qryProduto.IsEmpty) or (dmdProduto.qryProdutoCODIGO.AsString = '') then
  begin
    Exit;
  end;

  lData := dmdProduto.qryProdutoCODIGO.AsString;
  if FCodigoQr <> lData{ CompareStr(FCodigoQr, dmdProduto.qryProdutoCODIGO.AsString) = 0 } then
  begin
    lStm := TMemoryStream.Create;

    TQrCode.Gerar(lData, lStm);

    lPng := TPngImage.Create;
    lStm.Position := 0;
    lPng.LoadFromStream(lStm);
    ImageQrCode.Picture.Assign(lPng);

    FCodigoQr := lData;

    lPng.Free;
    lStm.Free;
  end;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  dmdProduto.qryProduto.Open;
end;

end.
