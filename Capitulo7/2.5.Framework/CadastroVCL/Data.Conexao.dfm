object dmdConexao: TdmdConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 379
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Aluno\Desktop\Exemplos\Dabases\FRAMEWORK.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 152
    Top = 40
  end
  object SQLConnection1: TSQLConnection
    Left = 152
    Top = 112
  end
  object qryGenerator: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select gen_id(/*GEN_NAME*/, 1) val from rdb$database')
    Left = 256
    Top = 48
  end
end
