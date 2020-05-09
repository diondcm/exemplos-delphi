inherited dmdPedido: TdmdPedido
  OldCreateOrder = True
  inherited qryDados: TFDQuery
    AfterOpen = qryDadosAfterOpen
    AfterScroll = qryDadosAfterScroll
    OnNewRecord = qryDadosNewRecord
    SQL.Strings = (
      'select p.IDPEDIDO, p.IDCLIENTE, p.ENDERECO, '
      '  p.DATA_COMPRA, p.VLR_TOTAL, C.NOME CLIENTE'
      'from pedido p'
      'inner join CLIENTE C'
      'on C.ID = p.IDCLIENTE')
    Top = 48
    object qryDadosIDPEDIDO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryDadosIDCLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      DisplayWidth = 7
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
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
    object qryDadosENDERECO: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 100
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 300
    end
  end
  object qryPesquisaCliente: TFDQuery
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'Select ID, NOME, SALDO from cliente')
    Left = 155
    Top = 192
    object qryPesquisaClienteID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPesquisaClienteNOME: TWideStringField
      DisplayLabel = 'Cliente'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryPesquisaClienteSALDO: TBCDField
      DisplayLabel = 'Saldo'
      DisplayWidth = 11
      FieldName = 'SALDO'
      Origin = 'SALDO'
      DisplayFormat = 'R$ 0.,00'
      Precision = 10
      Size = 3
    end
  end
  object qryItens: TFDQuery
    BeforeOpen = qryItensBeforeOpen
    OnCalcFields = qryItensCalcFields
    MasterSource = dtsPedido
    MasterFields = 'IDPEDIDO'
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'Select I.IDPEDIDO, I.IDITEM_PEDIDO, I.IDPRODUTO, I.QTD, I.VALOR'
      'from ITEM_PEDIDO I'
      'where I.IDPEDIDO = :IDPEDIDO')
    Left = 128
    Top = 112
    ParamData = <
      item
        Name = 'IDPEDIDO'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = Null
      end>
    object qryItensIDPEDIDO: TLargeintField
      DisplayLabel = 'Pedido'
      DisplayWidth = 7
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      Visible = False
    end
    object qryItensIDITEM_PEDIDO: TFDAutoIncField
      DisplayLabel = 'Item'
      DisplayWidth = 7
      FieldName = 'IDITEM_PEDIDO'
      Origin = 'IDITEM_PEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryItensIDPRODUTO: TIntegerField
      DisplayLabel = 'C'#243'd Produto'
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
    end
    object qryItensPRODUTO: TStringField
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'PRODUTO'
      Size = 300
      Calculated = True
    end
    object qryItensQTD: TLargeintField
      DisplayLabel = 'Qtd'
      DisplayWidth = 7
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = '0.,'
      EditFormat = '0.'
    end
    object qryItensVALOR: TLargeintField
      DisplayLabel = 'Valor'
      DisplayWidth = 7
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = 'R$ 0.,00'
      EditFormat = '0.00'
    end
  end
  object dtsPedido: TDataSource
    DataSet = qryDados
    Left = 56
    Top = 112
  end
  object qryPesquisaProduto: TFDQuery
    AfterOpen = qryPesquisaProdutoAfterOpen
    SQL.Strings = (
      
        'select P.IDPRODUTO, p.DESCRICAO, p.PRECO, P.ESTOQUE, p.IMPORTADO' +
        ', p.DIAS_ENTREGA'
      'from produto p'
      'ORDER BY p.DESCRICAO')
    Left = 152
    Top = 240
  end
  object memProduto: TFDMemTable
    IndexFieldNames = 'IDPRODUTO'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 264
  end
end
