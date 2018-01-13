unit Form.Relatorio.Filho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, From.Base.Relatorio, frxClass, StrUtils, DateUtils, Math;

type
  TfrmListaProdutos = class(TfrmBaseRelatorio)
    procedure frxReportBeforePrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaProdutos: TfrmListaProdutos;

implementation

{$R *.dfm}

procedure TfrmListaProdutos.frxReportBeforePrint(Sender: TfrxReportComponent);
begin
  if (Sender is TfrxMemoView) and (LowerCase(TfrxMemoView(Sender).Name) = LowerCase('memLicenca')) then
  begin
    TfrxMemoView(Sender).Text := Ifthen(DayOfTheWeek(Now) = 2, 'Válida', 'Não Válida');
    TfrxMemoView(Sender).Color := IfThen(DayOfTheWeek(Now) = 2, clWhite, clRed);
  end;
end;

end.
