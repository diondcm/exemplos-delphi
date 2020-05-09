inherited dmdCliente: TdmdCliente
  OldCreateOrder = True
  inherited qryDados: TFDQuery
    SQL.Strings = (
      'Select * from cliente')
    object qryDadosID: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryDadosNOME: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 200
    end
    object qryDadosSALDO: TBCDField
      DisplayLabel = 'Saldo'
      DisplayWidth = 11
      FieldName = 'SALDO'
      Origin = 'SALDO'
      DisplayFormat = 'R$ 0.,00'
      EditFormat = '0.00'
      Precision = 10
      Size = 3
    end
    object qryDadosCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 11
    end
    object qryDadosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryDadosDATA_NASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object qryDadosRENDA: TBCDField
      DisplayLabel = 'Renda'
      FieldName = 'RENDA'
      Origin = 'RENDA'
      DisplayFormat = 'R$ 0.,00'
      EditFormat = '0.00'
      Precision = 10
      Size = 3
    end
  end
  inherited SQLDados: TSQLDataSet
    CommandText = 'Select * from cliente'
  end
end
