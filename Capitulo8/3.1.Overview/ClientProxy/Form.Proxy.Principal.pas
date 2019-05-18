unit Form.Proxy.Principal;

interface

uses System.DateUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Pessoa, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TfrmProxyPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    MemoTexto: TMemo;
    ButtonGet: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ButtonGeraPessoa: TButton;
    ButtonSetPessoa: TButton;
    TimerData: TTimer;
    CheckBoxRelogio: TCheckBox;
    DBGrid1: TDBGrid;
    dtsPessoa: TDataSource;
    memPessoa: TFDMemTable;
    Button5: TButton;
    procedure ButtonGetClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonGeraPessoaClick(Sender: TObject);
    procedure ButtonSetPessoaClick(Sender: TObject);
    procedure CheckBoxRelogioClick(Sender: TObject);
    procedure TimerDataTimer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    FPessoa: TPessoa;
  public
    { Public declarations }
  end;

var
  frmProxyPrincipal: TfrmProxyPrincipal;

implementation

{$R *.dfm}

uses ClientModuleUnit1;

procedure TfrmProxyPrincipal.Button1Click(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Data server: ' +
    DateTimeToStr(ClientModule1.SMGeralClient.GetDataServer));
end;

procedure TfrmProxyPrincipal.Button2Click(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Versão: ' +
    ClientModule1.SMGeralClient.GetServerVersion);
end;

procedure TfrmProxyPrincipal.Button3Click(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Custo atual: ' +
    CurrToStr(ClientModule1.SMGeralClient.GetServerCost));
end;

procedure TfrmProxyPrincipal.Button4Click(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Obj: ' +
    ClientModule1.SMGeralClient.GetObject.ToString);
end;

procedure TfrmProxyPrincipal.Button5Click(Sender: TObject);
var
  lStm: TStringStream;
begin
  lStm := TStringStream.Create(ClientModule1.SMGeralClient.GetListaPessoaStr);
  lStm.Position := 0;
  memPessoa.LoadFromStream(lStm, TFDStorageFormat.sfJSON);
  lStm.Free;
end;

procedure TfrmProxyPrincipal.ButtonGeraPessoaClick(Sender: TObject);
begin
  FPessoa := ClientModule1.SMGeralClient.GeraPessoa;
  MemoTexto.Lines.Insert(0, 'Pessoa Gerada: ' + FPessoa.ID.ToString);
end;

procedure TfrmProxyPrincipal.ButtonGetClick(Sender: TObject);
begin
  MemoTexto.Lines.Insert(0, 'Total Instancias: ' +
    ClientModule1.SMGeralClient.GetTotalInstancias.ToString);
end;

procedure TfrmProxyPrincipal.ButtonSetPessoaClick(Sender: TObject);
begin
  ClientModule1.SMGeralClient.SetPessoa(FPessoa);
  MemoTexto.Lines.Insert(0, 'Pessoa Enviada: ' + FPessoa.ID.ToString);
end;

procedure TfrmProxyPrincipal.CheckBoxRelogioClick(Sender: TObject);
begin
  TimerData.Enabled := CheckBoxRelogio.Checked;
end;

procedure TfrmProxyPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmProxyPrincipal.TimerDataTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := DateTimeToStr(ClientModule1.SMGeralClient.GetDataServer);
  StatusBar1.Panels[1].Text := ClientModule1.SMGeralClient.GetDataAtual8601;
//  ISO8601ToDate(StatusBar1.Panels[1].Text);
  StatusBar1.Panels[2].Text := ClientModule1.SMGeralClient.GetDataUnix;
//  UnixToDateTime(ClientModule1.SMGeralClient.GetDataUnixInt)
end;

end.
