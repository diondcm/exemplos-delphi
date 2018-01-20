unit Form.Master.Detail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMasterDetail = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

end.
