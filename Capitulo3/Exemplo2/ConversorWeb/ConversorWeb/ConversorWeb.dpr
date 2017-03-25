program ConversorWeb;

uses
  Forms,
  IWStart,
  UTF8ContentParser,
  Unit4 in 'Unit4.pas' {IWForm4: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Classe.Converte.Unidades in '..\..\Classe.Converte.Unidades.pas',
  ClientClassesUnit1 in '..\..\ClientClassesUnit1.pas',
  ClientModuleUnit1 in '..\..\ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  ClientModule1 := TClientModule1.Create(nil);
  TIWStart.Execute(True);
end.
