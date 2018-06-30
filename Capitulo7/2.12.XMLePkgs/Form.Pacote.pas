unit Form.Pacote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPacote = class(TForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ExibeForm;
  end;

  procedure CalculaMediaBPL(pVal1, pVal2: Integer; var pVal3: Integer); stdcall;

exports
  CalculaMediaBPL;

implementation

{$R *.dfm}

procedure CalculaMediaBPL(pVal1, pVal2: Integer; var pVal3: Integer);
begin
  pVal3 := ((pVal1 + pVal2) div 2);
end;

{ TfrmPacote }

class procedure TfrmPacote.ExibeForm;
begin
  TfrmPacote.Create(nil).ShowModal;
end;

initialization
//  TfrmPacote.Create(nil).Show;
//  TfrmPacote.ExibeForm;


end.
