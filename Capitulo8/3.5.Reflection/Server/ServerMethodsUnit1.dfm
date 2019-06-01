object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 334
  Width = 491
  object qryPessoa: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from pessoa')
    Left = 200
    Top = 152
  end
  object qryProduto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from produto')
    Left = 280
    Top = 152
  end
  object memProduto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 280
    Top = 248
  end
  object memPessoa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 200
    Top = 248
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=PG_Conn')
    LoginPrompt = False
    Left = 240
    Top = 80
  end
end
