unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Form.Master.Detail, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    buttonMasterDetail: TButton;
    timerTeste: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure buttonMasterDetailClick(Sender: TObject);
    procedure timerTesteTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FQdMax: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonMasterDetailClick(Sender: TObject);
begin
  TfrmMasterDetail.Create(Application).Show;
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
  timerTeste.Enabled := DebugHook > 0;
end;

procedure TfrmPrincipal.timerTesteTimer(Sender: TObject);
begin
  timerTeste.Enabled := False;
  buttonMasterDetail.Click;
end;

end.
