object dmdProduto: TdmdProduto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 373
  Width = 496
  object qryProduto: TFDQuery
    AfterOpen = qryProdutoAfterOpen
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'select * from produtos')
    Left = 232
    Top = 168
    object qryProdutoID: TFDAutoIncField
      DisplayWidth = 6
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryProdutoDESCRICAO: TWideStringField
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryProdutoCODIGO: TWideStringField
      DisplayWidth = 13
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 200
    end
    object qryProdutoPESO: TFloatField
      DisplayWidth = 5
      FieldName = 'PESO'
      Origin = 'PESO'
    end
    object qryProdutoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
end
