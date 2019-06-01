library mod_webbroker;

uses
  {$IFDEF MSWINDOWS}
  Winapi.ActiveX,
  System.Win.ComObj,
  {$ENDIF }
  Web.WebBroker,
  Web.ApacheApp,
  Web.HTTPD24Impl,
  Data.DBXCommon,
  Datasnap.DSSession,
  WebModuleApache in 'WebModuleApache.pas' {WebModule1: TWebModule},
  ServerMethodsUnit1 in '..\Server\ServerMethodsUnit1.pas' {ServerMethods1: TDataModule},
  ClasseStatus in '..\shared\ClasseStatus.pas';

{$R *.res}

// httpd.conf entries:
//
(*
 LoadModule webbroker_module modules/mod_webbroker.dll

 <Location /xyz>
    SetHandler mod_webbroker-handler
 </Location>
*)
//
// These entries assume that the output directory for this project is the apache/modules directory.
//
// httpd.conf entries should be different if the project is changed in these ways:
//   1. The TApacheModuleData variable name is changed.
//   2. The project is renamed.
//   3. The output directory is not the apache/modules directory.
//   4. The dynamic library extension depends on a platform. Use .dll on Windows and .so on Linux.
//

// Declare exported variable so that Apache can access this module.
var
  GModuleData: TApacheModuleData;
exports
  GModuleData name 'webbroker_module';

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
{$IFDEF MSWINDOWS}
  CoInitFlags := COINIT_MULTITHREADED;
{$ENDIF}
  Web.ApacheApp.InitApplication(@GModuleData);
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TApacheApplication(Application).OnTerminate := TerminateThreads;
  Application.Run;
end.
