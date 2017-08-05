object dmDados: TdmDados
  OldCreateOrder = False
  Height = 345
  Width = 511
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo3\Androi' +
        'd.6.LocalDB\Win32\Debug\config.db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 232
    Top = 96
  end
  object qryConfig: TFDQuery
    IndexFieldNames = 'NOME_CONFIG'
    Connection = FDConnection
    SQL.Strings = (
      'select * from configuracao')
    Left = 232
    Top = 200
    object qryConfigID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryConfigUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 30
    end
    object qryConfigEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Size = 30
    end
    object qryConfigNOME_CONFIG: TStringField
      FieldName = 'NOME_CONFIG'
      Origin = 'NOME_CONFIG'
      Size = 30
    end
    object qryConfigVALOR_CONFIG: TStringField
      FieldName = 'VALOR_CONFIG'
      Origin = 'VALOR_CONFIG'
      Size = 250
    end
    object qryConfigDESCRICAO_CONFIG: TStringField
      FieldName = 'DESCRICAO_CONFIG'
      Origin = 'DESCRICAO_CONFIG'
      Size = 30
    end
  end
end
