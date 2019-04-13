unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Form.VIsualiza.Pessoa, Classe.Pessoa, Vcl.Clipbrd, System.IOUtils,
  Form.Heranca;

type
  TfrmPrincipal = class(TForm)
    PanelLog: TPanel;
    PanelControles: TPanel;
    MemoLog: TMemo;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    ActionList: TActionList;
    ButtonImprimePessoa: TBitBtn;
    ActionImprimePessoa: TAction;
    PopupMenu: TPopupMenu;
    ImprimePessoa1: TMenuItem;
    MainMenu: TMainMenu;
    Arquivo1: TMenuItem;
    ImprimePessoa2: TMenuItem;
    memPessoa: TFDMemTable;
    memPessoaID: TIntegerField;
    memPessoaNome: TStringField;
    memPessoaDataNascimento: TDateField;
    dtsPessoa: TDataSource;
    ActionCopiaPessoa: TAction;
    CopiarPessoa1: TMenuItem;
    ActionExportCSV: TAction;
    SaveDialog: TSaveDialog;
    ActionExportCSV1: TMenuItem;
    ButtonCriaPessoa: TButton;
    Button1: TButton;
    ButtonInstaciaPessoa: TButton;
    CheckBoxSetaNil: TCheckBox;
    ActionHeranca: TAction;
    Herana1: TMenuItem;
    procedure ActionImprimePessoaExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ActionCopiaPessoaExecute(Sender: TObject);
    procedure ActionExportCSVExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonCriaPessoaClick(Sender: TObject);
    procedure dtsPessoaDataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure ButtonInstaciaPessoaClick(Sender: TObject);
    procedure ActionHerancaExecute(Sender: TObject);
  private
    FPessoa: TPessoa;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ActionCopiaPessoaExecute(Sender: TObject);
//var
//  lPess: TPessoa;
begin
//  lPess := TPessoa.Create;

//  lPess.Nome := memPessoaNome.AsString;
//  lPess.ID := memPessoaID.AsInteger;
//  lPess.DataNascimento := memPessoaDataNascimento.AsDateTime;

  Clipboard.AsText := FPessoa.ToString;

//  lPess.Free;
end;

procedure TfrmPrincipal.ActionExportCSVExecute(Sender: TObject);
var
  lStl: TStringList;
//  lPess: TPessoa;
//  lStrCSV: string;

begin
  //SaveDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := IncludeTrailingPathDelimiter(TPath.GetDocumentsPath) + 'Desktop';
  if SaveDialog.Execute then
  begin
//    lPess := TPessoa.Create;
//    lPess.Nome := memPessoaNome.AsString;
//    lPess.ID := memPessoaID.AsInteger;
//    lPess.DataNascimento := memPessoaDataNascimento.AsDateTime;

    lStl := TStringList.Create;

    lStl.Text := FPessoa.ToCSV;

    lStl.SaveToFile(SaveDialog.FileName);

    lStl.Free;
//    lPess.Free;
  end;
end;

procedure TfrmPrincipal.ActionHerancaExecute(Sender: TObject);
begin
  frmHeranca.Show;
end;

procedure TfrmPrincipal.ActionImprimePessoaExecute(Sender: TObject);
//var
//  lPess: TPessoa;
begin
//  lPess := TPessoa.Create;
  try
    FPessoa.Nome := 'Fulano de teste';
    FPessoa.ID := 534534;
    FPessoa.DataNascimento := Now - (360 * 25); // (DateUtils.IncDay)
    MemoLog.Lines.Insert(0, FPessoa.ToString);

//    lPess.ToMemo(MemoLog);

//    MemoLog.Lines.Insert(0, 'DtNascimento: ' + DateToStr(lPess.DataNascimento));
//    MemoLog.Lines.Insert(0, 'ID: ' + lPess.ID.ToString);
//    MemoLog.Lines.Insert(0, 'Nome: ' + lPess.Nome);
//    MemoLog.Lines.Insert(0, TimeToStr(Now));

//    if not memPessoa.Active then não precisa, já valida se está aberto

  finally
//    lPess.Free;
    //FreeAndNil(lPess);
    //lPess.Destroy;
  end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  FPessoa.Free

end;

procedure TfrmPrincipal.ButtonCriaPessoaClick(Sender: TObject);
begin
  Randomize;
  memPessoa.Append;
  memPessoaID.AsInteger := Random(1000000); // GUID ['{A1D0F912-3CD4-4F40-BD80-B28755F52BCD}']
  memPessoa.FieldByName('nome').AsString := 'Pessoa de teste -' + TimeToStr(Now);
  memPessoaDataNascimento.AsDateTime := Now - (360 * Random(60));
  memPessoa.Post;
end;

procedure TfrmPrincipal.ButtonInstaciaPessoaClick(Sender: TObject);
var
  lPessoa: TPessoa;
begin
  lPessoa := TPessoa.Create;
  try
    lPessoa.ID := 543534;
    lPessoa.Nome := 'Outro teste';

  finally
    lPessoa.Free;

    if CheckBoxSetaNil.Checked then
    begin
      lPessoa := nil;
//      lPessoa := nil;
//      lPessoa := nil;
    end;

    //lPessoa.Free;
  end;

  if Assigned(lPessoa) then
  begin
//    TObject.Create.Free;

    lPessoa.Nome := 'Teste';
    Caption := lPessoa.Nome;
    lPessoa.Free;
  end;
end;

procedure TfrmPrincipal.DBGrid1DblClick(Sender: TObject){ Self: TfrmPrincipal };
//var
//  lPess: TPessoa;
begin
//  lPess := TPessoa.Create;
//  lPess.Nome := memPessoaNome.AsString;
//  lPess.ID := memPessoaID.AsInteger;
//  lPess.DataNascimento := memPessoaDataNascimento.AsDateTime;

  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, FPessoa.ToString);
//  lPess.ToMemo(frmVisualizaPessoa.MemoPessoa);

//  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, 'DtNascimento: ' + DateToStr(lPess.DataNascimento));
//  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, 'ID: ' + lPess.ID.ToString);
//  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, 'Nome: ' + lPess.Nome);
//  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, TimeToStr(Now));
  frmVisualizaPessoa.Show;

//  lPess.Free;
end;

procedure TfrmPrincipal.dtsPessoaDataChange(Sender: TObject; Field: TField);
begin
  if not memPessoa.IsEmpty then
  begin
    FPessoa.ID := memPessoaID.AsInteger;
    FPessoa.Nome := memPessoaNome.AsString;
    FPessoa.DataNascimento := memPessoaDataNascimento.AsDateTime;
  end else begin
    FPessoa.Nome := 'Nenhuma pessoa selecionada';
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FPessoa := TPessoa.Create;
  memPessoa.Open;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FPessoa.Free;
end;

end.
