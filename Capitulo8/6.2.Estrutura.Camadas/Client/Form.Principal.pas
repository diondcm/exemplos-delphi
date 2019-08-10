unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.IOUtils, System.Hash,
  FMX.Controls.Presentation, FMX.StdCtrls, Form.Cotacao, ClientModuleUnit1,
  FMX.Objects, FMX.Layouts, ClientClassesUnit1, Form.Clientes;

type
  TForm1 = class(TForm)
    TimerUpdateConfigs: TTimer;
    ImageLogo: TImage;
    GridPanelLayout1: TGridPanelLayout;
    ButtonCotacao: TButton;
    ButtonClientes: TButton;
    procedure ButtonCotacaoClick(Sender: TObject);
    procedure TimerUpdateConfigsTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SyncImagens;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ButtonClientesClick(Sender: TObject);
begin
  frmClientes.Show;
end;

procedure TForm1.ButtonCotacaoClick(Sender: TObject);
begin
  TimerUpdateConfigs.Enabled := True;
  frmCotacao.Show;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  TimerUpdateConfigs.Enabled := True;
end;

procedure TForm1.SyncImagens;
const
  IMG_LOGO = 'logo.jpg';
var
  lBaixaImagem: TProc;
  lLogo: string;
  lHashLogoLocal: string;
  lHashLogoServer: string;
  lStm: TStringStream;
  lSemConexao: Boolean;
begin
  lSemConexao := False;
  try
    lHashLogoServer := ClientModule1.ServerMethods1Client.GetHashImagemLogo;
    //ClientModule1.DSRestConnection1.TestConnection(); -> opção
  except
    lSemConexao := True;
  end;

  lStm := TStringStream.Create;

  lLogo := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, IMG_LOGO);

//  ImageLogo.MultiResBitmap.Items[0].Bitmap.LoadFromFile(lLogo);

  lBaixaImagem :=
    procedure
    var
      lImgDown: TStringStream;
    begin
      lImgDown := TStringStream.Create(ClientModule1.ServerMethods1Client.GetImagemLogo);
      lImgDown.SaveToFile(lLogo);
      lImgDown.Free;

      lStm.Clear;
      lStm.LoadFromFile(lLogo);
    end;

  if FileExists(lLogo) then
  begin
    lStm.LoadFromFile(lLogo);
    lHashLogoLocal := THashSHA1.GetHashString(lStm.DataString);
  end;

  if (lHashLogoLocal = '') and (not lSemConexao) then
  begin
    lBaixaImagem();
  end else begin
    if not lSemConexao then
    begin
      if lHashLogoLocal <> lHashLogoServer then // CompareStr(lHashLogoLocal, lHashLogoServer) <> 0
      begin
        lBaixaImagem();
      end;
    end;
  end;

  if lStm.Size > 0 then
  begin
    lStm.Position := 0;
    ImageLogo.MultiResBitmap.Items[0].Bitmap.LoadFromStream(lStm);
  end;

  lStm.Free;
end;

procedure TForm1.TimerUpdateConfigsTimer(Sender: TObject);
const
  DB_CONF = '29384jhrwe.ini';
var
  lBaixaImagem: TProc;
  lLogo: string;
  lHashLogoLocal: string;
  lHashLogoServer: string;
  lStm: TStringStream;
  lSemConexao: Boolean;
  lHashDBServer: string;
  lDBConf: string;
  lStr: TStringList;
  lAtualizaDBBase: Boolean;
begin
  TimerUpdateConfigs.Enabled := False;
  SyncImagens;

  // DB
  lAtualizaDBBase := False;
  lSemConexao := False;
  try
    lHashDBServer := ClientModule1.ServerMethods1Client.GetHashDB;
  except
    lSemConexao := True;
  end;

  lStm := TStringStream.Create;

  if lHashDBServer = '' then
  begin
    Exit;
  end;

  lDBConf := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, DB_CONF);
  if FileExists(lDBConf) then
  begin
    // carrega -> compara o hash
    lStr := TStringList.Create;
    lStr.LoadFromFile(lDBConf);
    if lHashDBServer <> lStr.Values['hashDB'] then
    begin
      lAtualizaDBBase := True;
    end;
  end;


  if lAtualizaDBBase then
  begin
    $$$ -> seguir daqui
    //
  end;




//  ImageLogo.MultiResBitmap.Items[0].Bitmap.LoadFromFile(lLogo);

  lBaixaImagem :=
    procedure
    var
      lImgDown: TStringStream;
    begin
      lImgDown := TStringStream.Create(ClientModule1.ServerMethods1Client.GetImagemLogo);
      lImgDown.SaveToFile(lLogo);
      lImgDown.Free;

      lStm.Clear;
      lStm.LoadFromFile(lLogo);
    end;

  if FileExists(lLogo) then
  begin
    lStm.LoadFromFile(lLogo);
    lHashLogoLocal := THashSHA1.GetHashString(lStm.DataString);
  end;

  if (lHashLogoLocal = '') and (not lSemConexao) then
  begin
    lBaixaImagem();
  end else begin
    if not lSemConexao then
    begin
      if lHashLogoLocal <> lHashLogoServer then // CompareStr(lHashLogoLocal, lHashLogoServer) <> 0
      begin
        lBaixaImagem();
      end;
    end;
  end;

  if lStm.Size > 0 then
  begin
    lStm.Position := 0;
    ImageLogo.MultiResBitmap.Items[0].Bitmap.LoadFromStream(lStm);
  end;

  lStm.Free;
end;

end.
