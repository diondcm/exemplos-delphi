object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 332
  Width = 482
  object qryOrders: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from orders')
    Left = 200
    Top = 104
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=DBDEMOS')
    LoginPrompt = False
    Left = 200
    Top = 40
  end
  object dtsOrders: TDataSetProvider
    DataSet = qryOrders
    Left = 240
    Top = 184
  end
  object SQLConnection1: TSQLConnection
    Left = 296
    Top = 40
  end
  object SQLDataSet1: TSQLDataSet
    Params = <>
    Left = 296
    Top = 104
  end
end
