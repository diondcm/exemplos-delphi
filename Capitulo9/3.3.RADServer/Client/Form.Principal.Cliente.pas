unit Form.Principal.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Imaging.JPEG, System.IOUtils, System.Hash, System.JSON, REST.JSON, REST.JsonReflect,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, REST.Backend.EMSServices, REST.Backend.EMSFireDAC, REST.Backend.EMSProvider,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.Comp.DataSet, System.NetEncoding,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TReposta = class
  private
    Ferror: string;
    Fmsg: string;
  public
    property error: string read Ferror write Ferror;
    property msg: string read Fmsg write Fmsg;
  end;


  TfrmPrincipalCliente = class(TForm)
    EMSProvider1: TEMSProvider;
    EMSFireDACClient1: TEMSFireDACClient;
    FDSchemaAdapter1: TFDSchemaAdapter;
    FDTableAdapter1: TFDTableAdapter;
    memCliente: TFDMemTable;
    dtsCliente: TDataSource;
    PageControlGeral: TPageControl;
    TabDados: TTabSheet;
    TabImagem: TTabSheet;
    PanelControles: TPanel;
    ButtonGetDados: TButton;
    DBNavigatorCliente: TDBNavigator;
    DBGridCliente: TDBGrid;
    ButtonArqs: TButton;
    Panel1: TPanel;
    ButtonImagem: TButton;
    Image1: TImage;
    IdHTTPImagem: TIdHTTP;
    ButtonGetItem: TButton;
    ComboItems: TComboBox;
    TabCliente: TTabSheet;
    dtsCleintesAdapter: TDataSource;
    DBGrid1: TDBGrid;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    ButtonOpen: TButton;
    procedure ButtonGetDadosClick(Sender: TObject);
    procedure ButtonImagemClick(Sender: TObject);
    procedure ButtonGetItemClick(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalCliente: TfrmPrincipalCliente;

implementation

{$R *.dfm}

procedure TfrmPrincipalCliente.ButtonGetDadosClick(Sender: TObject);
begin
  EMSFireDACClient1.GetData;
end;

procedure TfrmPrincipalCliente.ButtonGetItemClick(Sender: TObject);
var
  lImagem: string;
  lImagemLocal: string;
  stmImagemLocal: TStringStream;
  lHash: string;
  lparam: string;
  lMsgErro: string;
  lRet: TReposta;
  stmImagemLoad: TStringStream;
begin
  lHash := '1';
  stmImagemLocal := nil;
  stmImagemLoad := nil;
  try
    case ComboItems.ItemIndex of
      0: lImagem := '1';
      1: lImagem := '2';
      2: lImagem := '3';
    else
      raise Exception.Create('Selecione uma imagem');
    end;

    lImagemLocal := lImagem + '.jpg';

    if TFile.Exists(lImagemLocal) then
    begin
      stmImagemLocal := TStringStream.Create;
      stmImagemLocal.LoadFromFile(lImagemLocal);
      lHash := THashSHA2.GetHashString(stmImagemLocal);
    end;

    lparam := 'img=' + lImagem + ';' + 'hash=' + lhash;

    var stmResp: TStringStream := TStringStream.Create;
    try
      IdHTTPImagem.Get('http://localhost:8080/imagem/' + lparam, stmResp);
      stmResp.Position := 0;

      try
        lRet := Tjson.JsonToObject<TReposta>(stmResp.DataString);

        if lRet.msg = 'ok' then
        begin
          stmImagemLoad := stmImagemLocal;
        end;

        lMsgErro := lRet.error;
      except
        on E: EConversionError do
        begin
          // neste caso é uma imagem
          // sege processamento
        end;

        on E: Exception do
        begin
          //  erro não esperado
          raise Exception.Create('Erro ao processar resposta: ' + e.QualifiedClassName + ' - ' + e.Message);
        end;
      end;
    except
      on E: Exception do
      begin
        if stmImagemLocal.Size > 0 then
        begin
          stmImagemLoad := stmImagemLocal;
        end;
      end;
    end;

    if not Assigned(stmImagemLoad) and (stmResp.Size > 0) then
    begin
      var lStmReposta: TStringStream := TStringStream.Create(TNetEncoding.Base64.Decode(stmResp.DataString));
      lStmReposta.SaveToFile(lImagemLocal);
      stmImagemLoad := lStmReposta;
    end;

    if Assigned(stmImagemLoad) then
    begin
      stmImagemLoad.Position := 0;
      var jpg: TJPEGImage := TJPEGImage.Create;
      jpg.LoadFromStream(stmImagemLoad);
      Image1.Picture.Assign(jpg);
      jpg.Free;
    end;

//raise Exception.Create('Erro ao carregar imagem: "' + lMsgErro + '"');
  finally
    stmImagemLocal.Free;
  end;
end;

procedure TfrmPrincipalCliente.ButtonImagemClick(Sender: TObject);
begin
  var stm: TStringStream := TStringStream.Create;
  IdHTTPImagem.Get('http://localhost:8080/imagem', stm);
  stm.Position := 0;
  var jpg: TJPEGImage := TJPEGImage.Create;
  jpg.LoadFromStream(stm);
  Image1.Picture.Assign(jpg);
  jpg.Free;
  stm.Free;
end;

procedure TfrmPrincipalCliente.ButtonOpenClick(Sender: TObject);
begin
  RESTRequest1.Execute;
  ShowMessage(RESTResponse1.Content);
end;

end.
