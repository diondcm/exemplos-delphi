inherited dmdPedido: TdmdPedido
  OldCreateOrder = True
  inherited qryDados: TFDQuery
    AfterOpen = qryDadosAfterOpen
    AfterClose = qryDadosAfterClose
    SQL.Strings = (
      'select cli.nome, ped.* '
      'from pedido ped'
      'left join cliente cli '
      'on cli.idcliente = ped.idcliente'
      '')
    Left = 120
    Top = 96
    object qryDadosIDPEDIDO: TFDAutoIncField
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryDadosNOME: TWideStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 20
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryDadosIDCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      DisplayWidth = 8
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
      Visible = False
    end
    object qryDadosDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Cadastro'
      DisplayWidth = 8
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryDadosDATA_ENTREGA: TDateTimeField
      DisplayLabel = 'Entrega'
      DisplayWidth = 8
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
    end
    object qryDadosDESCONTO: TBCDField
      DisplayLabel = 'Desconto'
      DisplayWidth = 8
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      currency = True
      Precision = 10
      Size = 2
    end
    object qryDadosVALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object qryCliente: TFDQuery
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select  idcliente, nome from cliente order by nome')
    Left = 184
    Top = 160
  end
end
