inherited dmdPedido: TdmdPedido
  inherited qryDados: TFDQuery
    OnNewRecord = qryDadosNewRecord
    SQL.Strings = (
      'select p.IDPEDIDO, p.IDCLIENTE, p.ENDERECO, '
      '  p.DATA_COMPRA, p.VLR_TOTAL, C.NOME CLIENTE'
      'from pedido p'
      'inner join CLIENTE C'
      'on C.ID = p.IDCLIENTE')
    object qryDadosIDPEDIDO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryDadosIDCLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      DisplayWidth = 7
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
    end
    object qryDadosENDERECO: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 100
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 300
    end
    object qryDadosDATA_COMPRA: TDateTimeField
      DisplayLabel = 'Data Compra'
      DisplayWidth = 10
      FieldName = 'DATA_COMPRA'
      Origin = 'DATA_COMPRA'
    end
    object qryDadosVLR_TOTAL: TLargeintField
      DisplayLabel = 'Total'
      DisplayWidth = 11
      FieldName = 'VLR_TOTAL'
      Origin = 'VLR_TOTAL'
      DisplayFormat = 'R$ 0.,00'
      EditFormat = '0.00'
    end
    object qryDadosCLIENTE: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      DisplayWidth = 40
      FieldName = 'CLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
end
