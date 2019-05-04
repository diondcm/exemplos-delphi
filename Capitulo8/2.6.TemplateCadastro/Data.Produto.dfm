inherited dmdProduto: TdmdProduto
  Height = 267
  inherited qryDados: TFDQuery
    SQL.Strings = (
      'select * from produto')
    object qryDadosIDPRODUTO: TFDAutoIncField
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
      ProviderFlags = [pfInWhere, pfInKey]
      Visible = False
    end
    object qryDadosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryDadosPESO: TBCDField
      DisplayLabel = 'Peso'
      DisplayWidth = 8
      FieldName = 'PESO'
      Origin = 'PESO'
      Precision = 10
      Size = 2
    end
    object qryDadosUNIDADE_MEDIDA: TWideStringField
      DisplayLabel = 'Uni. Med.'
      DisplayWidth = 8
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'UNIDADE_MEDIDA'
    end
    object qryDadosDETALHES: TStringField
      DisplayLabel = 'Detalhes'
      DisplayWidth = 100
      FieldName = 'DETALHES'
      Origin = 'DETALHES'
      Size = 500
    end
  end
end
