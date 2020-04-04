object dmdProduto: TdmdProduto
  OldCreateOrder = False
  Height = 373
  Width = 496
  object qryProduto: TFDQuery
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'select * from produtos')
    Left = 232
    Top = 168
    object qryProdutoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryProdutoDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryProdutoCODIGO: TWideStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 200
    end
    object qryProdutoPESO: TFloatField
      FieldName = 'PESO'
      Origin = 'PESO'
    end
    object qryProdutoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
end
