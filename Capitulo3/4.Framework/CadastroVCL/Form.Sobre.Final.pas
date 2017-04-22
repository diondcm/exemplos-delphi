unit Form.Sobre.Final;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmSobreFinal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobreFinal: TfrmSobreFinal;

implementation

{$R *.dfm}

procedure TfrmSobreFinal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
