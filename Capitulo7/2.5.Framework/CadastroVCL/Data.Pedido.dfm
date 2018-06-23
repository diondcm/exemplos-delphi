inherited dmdPedido: TdmdPedido
  object qryPedido: TFDQuery
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select * from pedidos /*WHERE*/')
    Left = 216
    Top = 80
    object qryPedidoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Origin = 'ID_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qryPedidoID_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd Cliente'
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryPedidoDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryPedidoVALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryPedidoQTD_ITENS: TIntegerField
      DisplayLabel = 'Qtd. Itens'
      FieldName = 'QTD_ITENS'
      Origin = 'QTD_ITENS'
    end
  end
end
