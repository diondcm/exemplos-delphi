library IIS;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  Data.DBXCommon,
  Datasnap.DSSession,
  ServerMethodsAcao in '..\ServerMethodsAcao.pas' {SMAcao: TDataModule},
  Web.Module in '..\Web.Module.pas' {WebModule1: TWebModule},
  Classe.Acao in '..\..\Shared\Classe.Acao.pas',
  Classe.Status in '..\..\Shared\Classe.Status.pas';

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TISAPIApplication(Application).OnTerminate := TerminateThreads;
  Application.Run;
end.
