object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 426
  Width = 662
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\TfsData\FAST.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 288
    Top = 136
  end
  object qryProduto: TFDQuery
    Connection = FDConnection
    Left = 288
    Top = 208
  end
end
