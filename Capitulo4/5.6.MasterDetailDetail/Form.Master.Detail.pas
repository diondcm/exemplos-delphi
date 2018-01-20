unit Form.Master.Detail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBDemos, Data.DB, frxClass, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMasterDetail = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    dtsCustomer: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ExibeRelatorio;
  end;

//var
//  frmMasterDetail: TfrmMasterDetail;

implementation

{$R *.dfm}

procedure TfrmMasterDetail.Button1Click(Sender: TObject);
begin
//  if Self.OpenDialog1.Execute then
//  begin
//
//  end;
end;

class procedure TfrmMasterDetail.ExibeRelatorio;
var
  lfrmMasterDetail: TfrmMasterDetail;
begin
  lfrmMasterDetail := TfrmMasterDetail.Create(Application);
  lfrmMasterDetail.Caption := 'Teste';

  if lfrmMasterDetail.ShowModal = mrOk then
  begin

  end;
end;

procedure TfrmMasterDetail.FormCreate(Sender: TObject);
begin
  dtsCustomer.Dataset := tdmdDBDemos.Instancia.memCustomer;
end;

end.
