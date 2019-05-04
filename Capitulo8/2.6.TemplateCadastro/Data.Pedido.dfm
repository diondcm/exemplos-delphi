inherited dmdPedido: TdmdPedido
  OldCreateOrder = True
  inherited qryDados: TFDQuery
    AfterOpen = qryDadosAfterOpen
    AfterClose = qryDadosAfterClose
    AfterInsert = qryDadosAfterInsert
    AfterPost = qryDadosAfterPost
    AfterScroll = qryDadosAfterScroll
    OnNewRecord = qryDadosNewRecord
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
      DisplayWidth = 16
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryDadosDATA_ENTREGA: TDateTimeField
      DisplayLabel = 'Entrega'
      DisplayWidth = 16
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
    Left = 192
    Top = 96
  end
  object qryItens: TFDQuery
    AfterOpen = qryItensAfterOpen
    AfterClose = qryItensAfterClose
    OnNewRecord = qryItensNewRecord
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select prod.descricao, item.* '
      'from item_pedido item'
      'left join produto prod'
      'on prod.idproduto = item.idproduto'
      'where idpedido = :idpedido')
    Left = 88
    Top = 160
    ParamData = <
      item
        Name = 'IDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensIDITEM: TFDAutoIncField
      FieldName = 'IDITEM'
      Origin = 'IDITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      Visible = False
    end
    object qryItensIDPEDIDO: TIntegerField
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      Visible = False
    end
    object qryItensQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object qryItensIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
      Visible = False
    end
    object qryItensVALOR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
      Precision = 10
      Size = 2
    end
    object qryItensDESCONTO: TBCDField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      currency = True
      Precision = 10
      Size = 2
    end
    object qryItensDESCRICAO: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
  end
  object qryProduto: TFDQuery
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select idproduto, descricao from produto order by descricao')
    Left = 192
    Top = 160
  end
end
