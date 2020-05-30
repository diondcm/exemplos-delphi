object ClienteResource1: TClienteResource1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 300
  Width = 600
  object qryCLIENTE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from CLIENTE limit 100')
    Left = 130
    Top = 16
  end
  object dsrCLIENTE: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryCLIENTE
    KeyFields = 'ID'
    Left = 130
    Top = 64
  end
  object FDManager1: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 288
    Top = 136
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Pool')
    Left = 40
    Top = 16
  end
end
