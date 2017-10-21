unit Base.Form.Ajuda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmBaseAjudaClass = class of TfrmBaseAjuda;
  TfrmBaseAjuda = class(TForm)
    lblMensagem: TLabel;
    LinkLabel: TLinkLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseAjuda: TfrmBaseAjuda;

implementation

{$R *.dfm}

procedure TfrmBaseAjuda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
