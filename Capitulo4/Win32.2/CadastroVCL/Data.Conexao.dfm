inherited dmdConexao: TdmdConexao
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 245
  Width = 437
  object SQLConnection: TSQLConnection
    Left = 128
    Top = 40
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Aluno\Desk' +
      'top\exemplos-delphi\SQLite\demo.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 248
    Top = 40
  end
end
