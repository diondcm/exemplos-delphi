unit Form.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ClientModuleUnit1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    Button1: TButton;
    dtsTransactions: TDataSource;
    dtsBalance: TDataSource;
    memTransactions: TFDMemTable;
    memBalance: TFDMemTable;
    ButtonInvalidate: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonInvalidateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  lStrBlockChain: string;
  lStm: TStringStream;
begin
  lStm := TStringStream.Create(ClientModule1.ServerMethods1Client.GetInfosBlockChain);
  memBalance.LoadFromStream(lStm, TFDStorageFormat.sfJSON);
  lStm.Free;

  Caption := TimeToStr(Now);
end;

procedure TForm2.ButtonInvalidateClick(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.InvalidateCache;
end;

end.
