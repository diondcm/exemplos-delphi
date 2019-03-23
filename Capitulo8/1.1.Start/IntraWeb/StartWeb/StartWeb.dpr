program StartWeb;

uses
  Forms,
  IWStart,
  UTF8ContentParser,
  Unit1 in 'Unit1.pas' {IWForm1: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Classe.Conversor in '..\..\Classe.Conversor.pas',
  ClientClassesUnit1 in '..\..\ClientClassesUnit1.pas',
  ClientModuleUnit1 in '..\..\ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
