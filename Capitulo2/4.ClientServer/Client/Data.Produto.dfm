object dmdProduto: TdmdProduto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 401
  Width = 627
  object fmdProduto: TFDMemTable
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
    Left = 83
    Top = 80
  end
  object conSQLite: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    AfterConnect = conSQLiteAfterConnect
    BeforeConnect = conSQLiteBeforeConnect
    Left = 472
    Top = 96
  end
  object qryProduto: TFDQuery
    Connection = conSQLite
    Left = 472
    Top = 160
  end
end
