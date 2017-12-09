unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Form.Classes.Win, Form.Mensagens;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FlowPanel: TFlowPanel;
    buttonMensagem: TButton;
    buttonClasses: TButton;
    Edit1: TEdit;
    procedure buttonClassesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonMensagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonClassesClick(Sender: TObject);
begin
  frmClassesWin.Show;
end;

procedure TfrmPrincipal.buttonMensagemClick(Sender: TObject);
begin
  frmMensagens.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
