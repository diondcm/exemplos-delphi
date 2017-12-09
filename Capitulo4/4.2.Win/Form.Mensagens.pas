unit Form.Mensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMensagens = class(TForm)
    listBoxJanelas: TListBox;
    FlowPanel: TFlowPanel;
    Splitter1: TSplitter;
    timerCaptura: TTimer;
    checkAtivarCaptura: TCheckBox;
    buttonGetHandle: TButton;
    procedure buttonGetHandleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.dfm}

procedure TfrmMensagens.buttonGetHandleClick(Sender: TObject);
var
  lPoint: TPoint;
  lHandle: Cardinal;
begin
  GetCursorPos(lPoint);
  lHandle := WindowFromPoint(lPoint);
  listBoxJanelas.Items.Add(IntToStr(lHandle));
end;

end.
