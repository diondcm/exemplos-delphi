object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 504
  Width = 529
  object FrameworkConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Framework')
    LoginPrompt = False
    Left = 212
    Top = 49
  end
  object qryCliente: TFDQuery
    Connection = FrameworkConnection
    SQL.Strings = (
      'select * from cliente')
    Left = 208
    Top = 112
  end
end
