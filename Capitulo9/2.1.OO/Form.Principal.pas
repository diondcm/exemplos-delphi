unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.DateUtils, Data.DB, Vcl.Grids, Vcl.DBGrids, Classe.Pessoa, Form.Visualiza.Pessoa, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    MemoLog: TMemo;
    Splitter1: TSplitter;
    ButtonCriaPessoa: TButton;
    ButtonVisualiza: TButton;
    DBGrid1: TDBGrid;
    ButtonLibera: TButton;
    GroupBoxLista: TGroupBox;
    ButtonPopula: TButton;
    procedure ButtonCriaPessoaClick(Sender: TObject);
    procedure ButtonVisualizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonLiberaClick(Sender: TObject);
    procedure ButtonPopulaClick(Sender: TObject);
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
   lQtd := StrToIntDef(InputBox('Popular lista', 'Informe a quantidade:', '10'), 10);

   for i := 0 to lQtd -1 do
   begin
     FLista.Add(TPessoa.Create(True));
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
