unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.DateUtils, Data.DB, Vcl.Grids, Vcl.DBGrids, Classe.Pessoa, Form.Visualiza.Pessoa, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Pessoa, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    MemoLog: TMemo;
    Splitter1: TSplitter;
    GroupBoxLista: TGroupBox;
    ButtonPopula: TButton;
    DBGrid1: TDBGrid;
    dtsPessoa: TDataSource;
    DBNavigator1: TDBNavigator;
    ButtonPersisteLista: TButton;
    StatusBarResumo: TStatusBar;
    GroupBoxObj: TGroupBox;
    ButtonCriaPessoa: TButton;
    ButtonVisualiza: TButton;
    ButtonLibera: TButton;
    ButtonCarregaDeDisco: TButton;
    ButtonSalvaEmDisco: TButton;
    Splitter2: TSplitter;
    GroupBox1: TGroupBox;
    ButtonLimpa: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    SaveDialog: TSaveDialog;
    procedure ButtonCriaPessoaClick(Sender: TObject);
    procedure ButtonVisualizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonLiberaClick(Sender: TObject);
    procedure ButtonPopulaClick(Sender: TObject);
    procedure ButtonPersisteListaClick(Sender: TObject);
    procedure ButtonSalvaEmDiscoClick(Sender: TObject);
    procedure ButtonCarregaDeDiscoClick(Sender: TObject);
    procedure dtsPessoaDataChange(Sender: TObject; Field: TField);
    procedure ButtonLimpaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    const
      ARQ_PESSOAS = 'pessoas.json';
  private
    FPessoa: TPessoa;
    FLista: TListaPessoa;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonPopulaClick(Sender: TObject);
var
  lQtd: Integer;
  i: Integer;
begin
   lQtd := StrToIntDef(InputBox('Popular lista', 'Informe a quantidade:', '100'), 100);
   FLista.Clear;

   for i := 0 to lQtd -1 do
   begin
     FLista.Add(TPessoa.Create(True));
   end;

   dmdPessoa.memPessoa.Close;
   dmdPessoa.memPessoa.Open;

   FLista.PersisteNoDataSet(dmdPessoa.memPessoa);
//   FLista.PersisteNoDataSet(dmdPessoa.ClientDataSet);
//   FLista.PersisteNoDataSet(dmdPessoa.FDQuery);
end;

procedure TfrmPrincipal.ButtonSalvaEmDiscoClick(Sender: TObject);
begin
  if not dmdPessoa.memPessoa.IsEmpty then
  begin
    dmdPessoa.memPessoa.SaveToFile(ARQ_PESSOAS, sfJSON);
  end;
end;

procedure TfrmPrincipal.ButtonPersisteListaClick(Sender: TObject);
begin
  FLista.Clear;
  FLista.CarregaDeDataSet(dmdPessoa.memPessoa);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    FLista.ExportaCSV(SaveDialog.FileName);
    ShowMessage('Arquivo gerado com sucesso em:' + sLineBreak + SaveDialog.FileName);
  end;
end;

procedure TfrmPrincipal.ButtonCarregaDeDiscoClick(Sender: TObject);
begin
  if FileExists(ARQ_PESSOAS) then
  begin
    dmdPessoa.memPessoa.LoadFromFile(ARQ_PESSOAS);
    FLista.CarregaDeDataSet(dmdPessoa.memPessoa);
  end;
end;

procedure TfrmPrincipal.ButtonCriaPessoaClick(Sender: TObject);
var
  lPessoa: TPessoa;
begin
  lPessoa := TPessoa.Create(True);
//  lPessoa.GeraValoresRandom;
  MemoLog.Lines.Insert(0, Format('Ponteiro lPessoa($%p)', [Pointer(lPessoa)]));

//  lPessoa.Nome := 'Teste';
//  lPessoa.ID := Random(1000000);
//  lPessoa.Codigo := Random(1000000);
//  lPessoa.DataNascimento := IncYear(Now, - 27);
////  lPessoa.DataNascimento := (Now - (365 * 27));
//  lPessoa.Renda := Random(10000) + 1047;
//  lPessoa.CPF := '00011122285';


//  MemoLog.Lines.Insert(0, StringReplace(lPessoa.ToString, '=', ': ', [rfReplaceAll]));
  MemoLog.Lines.Insert(0, lPessoa.ToString(': '));
  MemoLog.Lines.Insert(0, '');
  MemoLog.Lines.Insert(0, '');

//  MemoLog.Lines.Insert(0, 'ID: ' + lPessoa.ID.ToString);
//  MemoLog.Lines.Insert(0, 'Nome: ' + lPessoa.Nome);
//  MemoLog.Lines.Insert(0, 'Código: ' + lPessoa.Codigo.ToString);
//  MemoLog.Lines.Insert(0, 'Data nascimento: ' + DateToStr(lPessoa.DataNascimento));
//  MemoLog.Lines.Insert(0, 'Renda: ' + FormatCurr('##0.,00', lPessoa.Renda));
//  MemoLog.Lines.Insert(0, 'CPF: ' + lPessoa.CPF);
  //MemoLog.Lines.Add('');

//  if FPessoa <> nil then
  if Assigned(FPessoa) then
  begin
    FPessoa.Free;
  end;

  FPessoa := lPessoa;

  frmVisualizaPessoa.Visualiza(FPessoa);

  //lPessoa := nil;
  //lPessoa.Free;
end;

procedure TfrmPrincipal.ButtonLiberaClick(Sender: TObject);
begin
//  FPessoa.Free;
  FreeAndNil(FPessoa);
end;

procedure TfrmPrincipal.ButtonLimpaClick(Sender: TObject);
begin
  FLista.Clear;
  dmdPessoa.memPessoa.EmptyDataSet;
end;

procedure TfrmPrincipal.ButtonVisualizaClick(Sender: TObject);
begin
  if FPessoa <> nil then
  begin
    frmVisualizaPessoa.Visualiza(FPessoa);
    MemoLog.Lines.Insert(0, Format('FPessoa $%p', [Pointer(FPessoa)]));
  end else begin
    MemoLog.Lines.Insert(0, 'Sem Pessoa Selecionada');
  end;

//  frmVisualizaPessoa.ValueListEditor.Strings.Add('Nome='+ FPessoa.Nome);
//  frmVisualizaPessoa.ValueListEditor.Strings.Add('Nome='+ FPessoa.Nome);
//  frmVisualizaPessoa.ShowModal;
end;

procedure TfrmPrincipal.dtsPessoaDataChange(Sender: TObject; Field: TField);
begin
  // apenas códigos rápidos
  StatusBarResumo.Panels[1].Text := 'Total de ' + FormatFloat('0.,', dmdPessoa.memPessoa.RecordCount) + ' registros'; // dtsPessoa.DataSet
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  MemoLog.Lines.Insert(0, Format('Nil $%p', [Pointer(Nil)]));
  // madException
  // EurekaLog

  FLista := TListaPessoa.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
//var
//  lPessoa: TObject;
begin
  FPessoa.Free;

//  for lPessoa in FLista do
//  begin
//    lPessoa.Free;
//  end;
  FLista.Free;
end;

end.
