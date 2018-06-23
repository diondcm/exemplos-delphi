inherited dmdCliente: TdmdCliente
  OldCreateOrder = True
  object qryCliente: TFDQuery
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select * from cliente')
    Left = 232
    Top = 56
    object qryClienteID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryClienteCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryClienteNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryClienteDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryClienteSALDO_DISPONIVEL: TBCDField
      DisplayLabel = 'Saldo dispon'#237'vel'
      FieldName = 'SALDO_DISPONIVEL'
      Origin = 'SALDO_DISPONIVEL'
      Precision = 18
      Size = 2
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 232
    Top = 137
  end
end
