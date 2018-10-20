unit Form.Notification;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, Data.Notification,
  System.DateUtils;

type
  TfrmNotification = class(TForm)
    ToolBar1: TToolBar;
    ButtonVoltar: TButton;
    GridPanelLayout1: TGridPanelLayout;
    ButtonNotificacaoSimples: TButton;
    ButtonAgendada: TButton;
    ButtonCancelar: TButton;
    Button1: TButton;
    procedure ButtonVoltarClick(Sender: TObject);
    procedure ButtonNotificacaoSimplesClick(Sender: TObject);
    procedure ButtonAgendadaClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotification: TfrmNotification;

implementation

{$R *.fmx}

procedure TfrmNotification.ButtonCancelarClick(Sender: TObject);
begin
  dmdNotification.CacelaNotificacao('notificacaoAgendada');
end;

procedure TfrmNotification.ButtonAgendadaClick(Sender: TObject);
begin
  dmdNotification.NotificacaoAgendada('TESTE de notificação Agendada',
    'notificacaoAgendada', IncSecond(Now, 30));
end;

procedure TfrmNotification.ButtonNotificacaoSimplesClick(Sender: TObject);
begin
  dmdNotification.NotificacaoSimples('TESTE de notificação',
    'notificacaoSimples');
end;

procedure TfrmNotification.ButtonVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
