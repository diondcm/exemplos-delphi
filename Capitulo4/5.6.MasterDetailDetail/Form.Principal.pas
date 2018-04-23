unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Form.Master.Detail, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.FileCtrl, Data.DBDemos;

type
  TfrmPrincipal = class(TForm)
    buttonMasterDetail: TButton;
    timerTeste: TTimer;
    Memo1: TMemo;
    Tree: TTreeView;
    panelDiretorio: TPanel;
    FileOpenDialog: TFileOpenDialog;
    panelLoadDinamico: TPanel;
    memoDescricao: TMemo;
    buttonPreview: TButton;
    buttonDesign: TButton;
    procedure FormCreate(Sender: TObject);
    procedure buttonMasterDetailClick(Sender: TObject);
    procedure timerTesteTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure panelDiretorioClick(Sender: TObject);
    procedure buttonPreviewClick(Sender: TObject);
    procedure buttonDesignClick(Sender: TObject);
  private
    FQdMax: Integer;
    FConfigurouDir: Boolean;
    FDir: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonDesignClick(Sender: TObject);
begin
  TdmdDBDemos.Instancia.frxReportGeral.DesignReport;
end;

procedure TfrmPrincipal.buttonMasterDetailClick(Sender: TObject);
begin
  TfrmMasterDetail.Create(Application).Show;
end;

procedure TfrmPrincipal.buttonPreviewClick(Sender: TObject);
begin
  TdmdDBDemos.Instancia.frxReportGeral.ShowReport;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//  FQdMax := 1000000;
//  FDQuery1.SQL.Text := 'Select count(1) qtd from (' + FDQuery1.SQL.Text + ')';// todo: remover order bys
//  FDQuery1.Open;
//  if FDQuery1.FieldByName('qtd').AsInteger > FQdMax then
//  begin
//
//  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//  timerTeste.Enabled := DebugHook > 0;
end;

procedure TfrmPrincipal.panelDiretorioClick(Sender: TObject);
begin
  if FileOpenDialog.Execute then
  begin
    FConfigurouDir := True;
    FDir := IncludeTrailingPathDelimiter(FileOpenDialog.FileName);
    panelDiretorio.Caption := FDir;
  end;
end;

procedure TfrmPrincipal.timerTesteTimer(Sender: TObject);
begin
  timerTeste.Enabled := False;
  buttonMasterDetail.Click;
end;

procedure TfrmPrincipal.TreeChange(Sender: TObject; Node: TTreeNode);
var
  lReportFile: string;
begin
  if Node.StateIndex = -1 then
  begin
    Tree.FullCollapse;
    Node[0].Selected := True;
  end else begin
    if not FConfigurouDir then
      raise Exception.Create('Não foi configurado o diretório dos relatórios.');

    lReportFile := FDir + IntToStr(Node.StateIndex) + '.fr3';
    if not FileExists(lReportFile) then
      raise Exception.Create('Arquivo não encotrado: ' + lReportFile);

    TdmdDBDemos.Instancia.frxReportGeral.LoadFromFile(lReportFile);
    memoDescricao.Text := TdmdDBDemos.Instancia.frxReportGeral.ReportOptions.Description.Text;
    Caption := ' Report file: ' + IntToStr(Node.StateIndex) + '.fr3';
  end;
end;

end.
