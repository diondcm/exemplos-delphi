object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 371
  Width = 504
  object SQLConnection1: TSQLConnection
    Left = 192
    Top = 64
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 192
    Top = 120
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 192
    Top = 168
  end
end
