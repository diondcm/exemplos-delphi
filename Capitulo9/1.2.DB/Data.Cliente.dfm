object dmdCliente: TdmdCliente
  OldCreateOrder = False
  Height = 296
  Width = 386
  object qryCliente: TFDQuery
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'select * from clientes')
    Left = 176
    Top = 136
    object qryClienteID: TFDAutoIncField
      DisplayWidth = 6
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClienteNOME: TWideStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryClienteDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
end
