object dmdCores: TdmdCores
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 292
  Width = 444
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo3\Exempl' +
        'o4\banco.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 136
    Top = 16
  end
  object qryScript: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS '
      '  CORES('
      '    ID INTEGER AUTOINC, '
      '    DESCRICAO VARCHAR(100), '
      '    VALOR INTEGER)')
    Left = 40
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 264
    Top = 40
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 264
    Top = 128
  end
  object qryCores: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from CORES')
    Left = 112
    Top = 120
    object qryCoresID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryCoresDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryCoresVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
  end
end
