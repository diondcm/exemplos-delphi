object dmdBase: TdmdBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 347
  Width = 387
  object qryDados: TFDQuery
    BeforePost = qryDadosBeforePost
    Connection = dmdConexao.FDConnection
    Left = 56
    Top = 160
  end
  object SQLDados: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmdConexao.SQLConnection
    Left = 264
    Top = 96
  end
  object dspDados: TDataSetProvider
    DataSet = SQLDados
    Left = 264
    Top = 160
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDados'
    BeforePost = qryDadosBeforePost
    Left = 264
    Top = 224
  end
end
