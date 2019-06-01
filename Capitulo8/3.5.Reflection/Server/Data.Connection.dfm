object dmdConnectionManager: TdmdConnectionManager
  OldCreateOrder = False
  Height = 231
  Width = 299
  object FDManager1: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 96
    Top = 32
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\Instrutor01\Downloads\pgsql\bin\libpq.dll'
    Left = 80
    Top = 152
  end
  object FDConnection: TFDConnection
    ConnectionName = 'PGDefault'
    Params.Strings = (
      'ConnectionDef=PG_Conn')
    LoginPrompt = False
    Left = 200
    Top = 96
  end
end
