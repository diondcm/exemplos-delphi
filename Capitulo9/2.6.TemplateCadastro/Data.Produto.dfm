inherited dmdProduto: TdmdProduto
  inherited qryDados: TFDQuery
    OnNewRecord = qryDadosNewRecord
    SQL.Strings = (
      'select * from produto')
    object qryDadosIDPRODUTO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryDadosDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 300
    end
    object qryDadosDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'Dias para entrega'
      FieldName = 'DIAS_ENTREGA'
      Origin = 'DIAS_ENTREGA'
    end
    object qryDadosIMPORTADO: TBooleanField
      DisplayLabel = 'Importado'
      FieldName = 'IMPORTADO'
      Origin = 'IMPORTADO'
    end
    object qryDadosPRECO: TLargeintField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 11
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = 'R$ 0.,00'
      EditFormat = '0.00'
    end
    object qryDadosESTOQUE: TLargeintField
      DisplayLabel = 'Estoque'
      DisplayWidth = 7
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      DisplayFormat = '0.,'
    end
  end
end
