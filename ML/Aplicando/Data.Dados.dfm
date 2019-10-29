object dmdDados: TdmdDados
  OldCreateOrder = False
  Height = 393
  Width = 460
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\projs\ML\Delphi\gsl-delphi\Win32\Debug\d' +
        'ados\dadosExemplo.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 95
    Top = 22
  end
  object qryCompras: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select sum(p.total) total, strftime('#39'%Y%m'#39', p.emissao) ano'
      'from pedido p'
      'where p.idcliente = 4822'
      'group by strftime('#39'%Y%m'#39', p.emissao)')
    Left = 191
    Top = 102
  end
  object memDadosSaidaComprasLinear: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 96
    Top = 176
    object memDadosSaidaComprasLinearx: TFloatField
      FieldName = 'x'
    end
    object memDadosSaidaComprasLineary: TFloatField
      FieldName = 'y'
    end
  end
  object memDadosSaidaLinear: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 96
    Top = 240
    object memDadosSaidaLinearx: TFloatField
      FieldName = 'x'
    end
    object memDadosSaidaLineary: TFloatField
      FieldName = 'y'
    end
  end
  object memDadosSaidaNN: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 264
    Top = 176
    object memDadosSaidaNNx: TFloatField
      FieldName = 'x'
    end
    object memDadosSaidaNNy: TFloatField
      FieldName = 'y'
    end
  end
end
