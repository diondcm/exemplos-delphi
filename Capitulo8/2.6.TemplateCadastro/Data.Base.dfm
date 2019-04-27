object dmdBase: TdmdBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 416
  object qryDados: TFDQuery
    BeforePost = qryDadosBeforePost
    Connection = dmdConexao.FDConnection
    Left = 56
    Top = 80
  end
  object sqlDados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdConexao.SQLConnection
    Left = 312
    Top = 32
  end
  object dspDados: TDataSetProvider
    DataSet = sqlDados
    Left = 312
    Top = 80
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDados'
    Left = 312
    Top = 128
  end
end
