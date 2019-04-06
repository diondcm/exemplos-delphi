unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Form.VIsualiza.Pessoa, Classe.Pessoa, Vcl.Clipbrd;

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
    procedure ActionImprimePessoaExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ActionCopiaPessoaExecute(Sender: TObject);
    procedure ActionExportCSVExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ActionCopiaPessoaExecute(Sender: TObject);
var
  lPess: TPessoa;
begin
  lPess := TPessoa.Create;
  lPess.Nome := memPessoaNome.AsString;
  lPess.ID := memPessoaID.AsInteger;
  lPess.DataNascimento := memPessoaDataNascimento.AsDateTime;

  Clipboard.AsText := lPess.ToString;

  lPess.Free;
end;

procedure TfrmPrincipal.ActionExportCSVExecute(Sender: TObject);
var
  lPess: TPessoa;
  lStrCSV: string;
begin
  lPess := TPessoa.Create;
  lPess.Nome := memPessoaNome.AsString;
  lPess.ID := memPessoaID.AsInteger;
  lPess.DataNascimento := memPessoaDataNascimento.AsDateTime;

  lStrCSV := lPess.ToCSV;

  // salvar CSV
end;

procedure TfrmPrincipal.ActionImprimePessoaExecute(Sender: TObject);
var
  lPess: TPessoa;
begin
  lPess := TPessoa.Create;
  try
    lPess.Nome := 'Fulano de teste';
    lPess.ID := 534534;
    lPess.DataNascimento := Now - (360 * 25); // (DateUtils.IncDay)

    MemoLog.Lines.Insert(0, lPess.ToString);
//    lPess.ToMemo(MemoLog);

//    MemoLog.Lines.Insert(0, 'DtNascimento: ' + DateToStr(lPess.DataNascimento));
//    MemoLog.Lines.Insert(0, 'ID: ' + lPess.ID.ToString);
//    MemoLog.Lines.Insert(0, 'Nome: ' + lPess.Nome);
//    MemoLog.Lines.Insert(0, TimeToStr(Now));

//    if not memPessoa.Active then não precisa, já valida se está aberto
    memPessoa.Open;

    memPessoa.Append;
    memPessoaID.AsInteger := lPess.ID;
    memPessoa.FieldByName('nome').AsString := lPess.Nome;
    memPessoaDataNascimento.AsDateTime := lPess.DataNascimento;
    memPessoa.Post;

  finally
    lPess.Free;
    //FreeAndNil(lPess);
    //lPess.Destroy;
  end;
end;

procedure TfrmPrincipal.DBGrid1DblClick(Sender: TObject){ Self: TfrmPrincipal };
var
  lPess: TPessoa;
begin
  lPess := TPessoa.Create;
  lPess.Nome := memPessoaNome.AsString;
  lPess.ID := memPessoaID.AsInteger;
  lPess.DataNascimento := memPessoaDataNascimento.AsDateTime;

  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, lPess.ToString);
//  lPess.ToMemo(frmVisualizaPessoa.MemoPessoa);

//  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, 'DtNascimento: ' + DateToStr(lPess.DataNascimento));
//  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, 'ID: ' + lPess.ID.ToString);
//  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, 'Nome: ' + lPess.Nome);
//  frmVisualizaPessoa.MemoPessoa.Lines.Insert(0, TimeToStr(Now));
  frmVisualizaPessoa.Show;

  lPess.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
