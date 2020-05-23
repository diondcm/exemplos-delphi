object SMCliente: TSMCliente
  OldCreateOrder = False
  Height = 221
  Width = 324
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\exemplos-delphi\Capitulo9\2.6.TemplateCa' +
        'dastro\Dados\Cadastro.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 8
  end
  object qryCliente: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from cliente limit :QTD')
    Left = 80
    Top = 56
    ParamData = <
      item
        Name = 'QTD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qryClienteID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClienteNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryClienteSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 10
      Size = 3
    end
    object qryClienteCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 11
    end
    object qryClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryClienteDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object qryClienteRENDA: TBCDField
      FieldName = 'RENDA'
      Origin = 'RENDA'
      Precision = 10
      Size = 3
    end
  end
end
