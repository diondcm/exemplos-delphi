unit Form.Principal.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, System.JSON, REST.JSon, System.DateUtils, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON;

type
//  TPessoa = class
//  private
//    Fid: Integer;
//    FNome: string;
//    FDataNascimento: TDateTime;
//    FRenda: Currency;
//    FAtivo: Boolean;
//    function GetSalarioEmDolar: Currency;
//  published
//    property ID: Integer read FID write FID;
//    property Nome: string read FNome write FNome;
//    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
//    property Renda: Currency read FRenda write FRenda;
//    property Ativo: Boolean read FAtivo write FAtivo;
//    property SalarioEmDolar: Currency read GetSalarioEmDolar;
//  end;

  TfrmPrincipalClient = class(TForm)
    PageControlClient: TPageControl;
    TabJSON: TTabSheet;
    TabDataSnap: TTabSheet;
    Panel1: TPanel;
    MemoJson: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    TabThreads: TTabSheet;
    PanelThreads: TPanel;
    ButtonGetID: TButton;
    MemoThreads: TMemo;
    ButtonCallRequestThread: TButton;
    EditQtd: TEdit;
    Button5: TButton;
    ButtonTotais: TButton;
    MemoPessoaEnvio: TMemo;
    MemoPessoaRetorno: TMemo;
    TabDB: TTabSheet;
    PanelDB: TPanel;
    ButtonGetDados: TButton;
    DBGridDados: TDBGrid;
    dtsDados: TDataSource;
    memDados: TFDMemTable;
    EditQtdRegistro: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonGetIDClick(Sender: TObject);
    procedure ButtonCallRequestThreadClick(Sender: TObject);
    procedure ButtonTotaisClick(Sender: TObject);
    procedure ButtonGetDadosClick(Sender: TObject);
  private
    FIDPessoa: Integer;
  public
    { Public declarations }
  end;

var
  frmPrincipalClient: TfrmPrincipalClient;

implementation

{$R *.dfm}

uses Classes.Transporte.Pessoa, ClientModuleUnit1;

procedure TfrmPrincipalClient.Button1Click(Sender: TObject);
begin
  var lPessoa: TPessoa := TPessoa.Create;
  var lJson: string;

  lPessoa.ID := GetTickCount;
  lPessoa.Nome := 'Teste de Nome';
  lPessoa.DataNascimento := Now;
  lPessoa.Renda := 600;
  lPessoa.Ativo := False;

  // JSON
  //lJson := '{' + 'ID:' + lPessoa.ID.ToString + '}'; // NÂO

  lJson := TJson.ObjectToJsonString(lPessoa);
  MemoJson.Text := lJson;

  lPessoa.Free;
end;

procedure TfrmPrincipalClient.Button2Click(Sender: TObject);
begin
  var lPessoa: TPessoa := TJson.JsonToObject<TPessoa>(MemoJson.Text);

  Caption := TimeToStr(Now) + ' - ' + lPessoa.Nome;

  lPessoa.Free;
end;

procedure TfrmPrincipalClient.Button3Click(Sender: TObject);
begin
  var lPessoa: TPessoa := TPessoa.Create;

  lPessoa.ID := -1;
  lPessoa.Nome := 'Albert Fritz';
  lPessoa.Renda := 600;
  lPessoa.DataNascimento := Now;
  lPessoa.Ativo := True;

  MemoPessoaEnvio.Text := TJson.ObjectToJsonString(lPessoa);

  //ClientModule1.DSRestConnection1.
  var lID: Integer := ClientModule1.ServerMethods1Client.SetPessoa(lPessoa);
  FIDPessoa := lID;
  Caption := TimeToStr(Now) + ' - ' + lID.ToString;

  //lPessoa.Free;
end;

procedure TfrmPrincipalClient.Button4Click(Sender: TObject);
var
  lTransp: TTransportePessoa;
begin
  lTransp := ClientModule1.ServerMethods1Client.GetPessoa(FIDPessoa);
  if lTransp.retorno <> '' then
  begin
    var lPessoa: TPessoa := TJson.JsonToObject<TPessoa>(lTransp.retorno); //lTransp.instancia;
    if not Assigned(lPessoa) then
    begin
      Caption := TimeToStr(Now) + ' Retorno nil';
    end else begin
      Caption := TimeToStr(Now) + ' ' + lPessoa.ID.ToString + ' - ' + lPessoa.Nome + ' - ' + DateTimeToStr(lPessoa.DataNascimento);

      MemoPessoaRetorno.Lines.Insert(0, DateToStr(ISO8601ToDate(lPessoa.DataISO8601)));
      MemoPessoaRetorno.Lines.Insert(0, DateToStr(UnixToDateTime(lPessoa.DataUnix)));
      MemoPessoaRetorno.Lines.Insert(0, DateTimeToStr(lPessoa.DataNascimento));
      MemoPessoaRetorno.Lines.Insert(0, lPessoa.ID.ToString + ' - ' + lPessoa.Nome);
      MemoPessoaRetorno.Lines.Insert(0, TimeToStr(Now));
    end;
    lPessoa.Free;
  end else if Assigned(lTransp.instancia) then
  begin
    var lPessoa: TPessoa := lTransp.instancia;
    if not Assigned(lPessoa) then
    begin
      Caption := TimeToStr(Now) + ' Retorno nil';
    end else begin
      Caption := TimeToStr(Now) + ' ' +  lPessoa.ID.ToString + ' - ' + lPessoa.Nome;
    end;
  end else begin
    Caption := TimeToStr(Now) + ' Retorno nil';
  end;
end;

procedure TfrmPrincipalClient.ButtonCallRequestThreadClick(Sender: TObject);
begin
  var lDataExec: TDateTime := IncSecond(Now, 10);
  var lQtd: Integer := StrToIntDef(EditQtd.Text, 1);
  for var i: Integer := 0 to lQtd do
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        var CliMod: TClientModule1 := TClientModule1.Create(nil);
        try
          var lPessoa: TPessoa := TPessoa.Create;
          lPessoa.ID := -1;
          lPessoa.Nome := 'Albert Fritz';
          lPessoa.Renda := 600;
          lPessoa.DataNascimento := Now;
          lPessoa.Ativo := True;
          Sleep(MilliSecondsBetween(lDataExec, Now));
          //CliMod.ServerMethods1Client.GetThreadID;
          CliMod.ServerMethods1Client.SetPessoa(lPessoa);
        finally
          CliMod.Free;
        end;
      end).Start;
  end;

  Sleep(MilliSecondsBetween(lDataExec, Now) + 100);
  ButtonTotais.Click;
end;

procedure TfrmPrincipalClient.ButtonGetDadosClick(Sender: TObject);
begin
  var StrStm: TStringStream := TStringStream.Create(ClientModule1.ServerMethods1Client.GetDados(StrToIntDef(EditQtdRegistro.Text, 100)));
  memDados.LoadFromStream(StrStm, sfJSON);
  StrStm.Free;
end;

procedure TfrmPrincipalClient.ButtonGetIDClick(Sender: TObject);
begin
  MemoThreads.Lines.Insert(0, TimeToStr(Now) + ' - ' + IntToStr(ClientModule1.ServerMethods1Client.GetThreadID));
end;

procedure TfrmPrincipalClient.ButtonTotaisClick(Sender: TObject);
begin
  MemoThreads.Lines.Insert(0, 'Geral: ' + IntToStr(ClientModule1.ServerMethods1Client.GetQtdGeral) + ', Ativos: ' + IntToStr(ClientModule1.ServerMethods1Client.GetQtdAtivos) + ', Max: ' + IntToStr(ClientModule1.ServerMethods1Client.GetQtdMaxAtivos));
end;

procedure TfrmPrincipalClient.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
