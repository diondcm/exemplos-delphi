object dmdDados: TdmdDados
  OldCreateOrder = False
  Height = 372
  Width = 564
  object qryDados: TFDQuery
    Left = 472
    Top = 280
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
end
