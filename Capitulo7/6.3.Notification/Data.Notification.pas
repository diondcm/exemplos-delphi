unit Data.Notification;

interface

uses
  System.SysUtils, System.Classes, System.Notification, System.DateUtils,
  System.Generics.Collections;

type
//  TItem = class
//  end;
//
//  TItemNota = TObjectList<TItem>;

  TNotificacao = class
  private
    FNome: string;
    FDataDisparo: TDateTime;
  public
    property Nome: string read FNome write FNome;
    property DataDisparo: TDateTime read FDataDisparo write FDataDisparo;
  end;

  TListaNotificacao = TList<TNotificacao>;

  TdmdNotification = class(TDataModule)
    NotificationCenter: TNotificationCenter;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FListaNotificacao: TListaNotificacao;
  public
    procedure NotificacaoSimples(const pMsg, pNomeNotificacao: string);
    procedure NotificacaoAgendada(const pMsg, pNomeNotificacao: string;
      pDataAgendamento: TDateTime);

    procedure CacelaNotificacao(const pNomeNotificacao: string); overload;
    procedure CacelaNotificacao(pDataAgendamento: TDateTime); overload;
  end;

var
  dmdNotification: TdmdNotification;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmdNotification }

procedure TdmdNotification.CacelaNotificacao(const pNomeNotificacao: string);
var
  lNotfic: TNotificacao;
begin
  if pNomeNotificacao = '' then
  begin
    NotificationCenter.CancelAll;
    Exit;
  end;

  for lNotfic in FListaNotificacao do
  begin
    if lNotfic.Nome = pNomeNotificacao then
    begin
      NotificationCenter.CancelNotification(pNomeNotificacao);
      Exit;
    end;
  end;

  raise Exception.Create('Notificação não localizada: ' + pNomeNotificacao);
end;

procedure TdmdNotification.CacelaNotificacao(pDataAgendamento: TDateTime);
var
  lNotfic: TNotificacao;
begin
  if pDataAgendamento = 0 then
  begin
    NotificationCenter.CancelAll;
    Exit;
  end;

  for lNotfic in FListaNotificacao do
  begin
    if lNotfic.DataDisparo < pDataAgendamento then
    begin
      NotificationCenter.CancelNotification(lNotfic.Nome);
    end;
  end;
end;

procedure TdmdNotification.DataModuleCreate(Sender: TObject);
begin
  FListaNotificacao := TListaNotificacao.Create;
end;

procedure TdmdNotification.DataModuleDestroy(Sender: TObject);
begin
  // Fazer for, destruindo objetos

  FListaNotificacao.Free;
end;

procedure TdmdNotification.NotificacaoAgendada(const pMsg, pNomeNotificacao: string; pDataAgendamento: TDateTime);
var
  lNot: TNotification;
  lNotificacao: TNotificacao;
begin
  lNot := NotificationCenter.CreateNotification;

  if not Assigned(lNot) then
    raise Exception.Create('Sem suporte a notificações');

  try
    lNot.Name := pNomeNotificacao;
    lNot.AlertBody := pMsg;
    lNot.FireDate := pDataAgendamento;
    lNot.RepeatInterval := TRepeatInterval.None;
    NotificationCenter.ScheduleNotification(lNot);

    lNotificacao := TNotificacao.Create;
    lNotificacao.Nome := pNomeNotificacao;
    lNotificacao.DataDisparo := pDataAgendamento;

    FListaNotificacao.Add(lNotificacao);
  finally
    lNot.Free;
    // Ressalva: Antes Tokyo, utilizar lNot.DisposeOf;
  end;
end;

procedure TdmdNotification.NotificacaoSimples(const pMsg, pNomeNotificacao: string);
begin
  NotificacaoAgendada(pMsg, pNomeNotificacao, IncSecond(Now, 2));
end;

end.
