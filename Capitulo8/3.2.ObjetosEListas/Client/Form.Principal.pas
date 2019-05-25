unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, ClientModuleUnit1, SMGeral, Classe.Pessoa;

type
  TfrmPrincpial = class(TForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    MemoLog: TMemo;
    EditURL: TEdit;
    IdHTTP: TIdHTTP;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    Button1: TButton;
    ListBoxPessoa: TListBox;
    procedure EditURLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincpial: TfrmPrincpial;

implementation

{$R *.dfm}

procedure TfrmPrincpial.Button1Click(Sender: TObject);
var
  lListaPessoa: TListaPessoa;
  lPessoa: TPessoa;
begin
  lListaPessoa := ClientModule1.ServerMethodsGeralClient.GetListaPessoa;
  for lPessoa in lListaPessoa.Pessoas do
  begin
    ListBoxPessoa.AddItem(lPessoa.Nome, lPessoa);
  end;
end;

procedure TfrmPrincpial.EditURLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  lStm: TStringStream;
begin
  if Key = VK_RETURN then
  begin
    IdHTTP.Request.Username := 'user';
    IdHTTP.Request.Password := 'pass';

    lStm := TStringStream.Create;
    IdHTTP.Get('http://localhost:8080/datasnap/rest/TServerMethodsGeral/GetListaPessoa', lStm);
    MemoLog.Text := lStm.DataString;
    lStm.Free;
  end;
end;

end.
