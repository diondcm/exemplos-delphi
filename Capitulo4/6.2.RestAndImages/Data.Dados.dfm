object dmdDados: TdmdDados
  OldCreateOrder = False
  Height = 372
  Width = 564
  object qryDadosLocais: TFDQuery
    Connection = FDConnection
    Left = 48
    Top = 96
  end
  object memDados: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 256
    Top = 152
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    BeforeConnect = FDConnectionBeforeConnect
    Left = 48
    Top = 32
  end
  object tbCriaTabela: TFDTable
    Connection = FDConnection
    Left = 128
    Top = 96
  end
end
