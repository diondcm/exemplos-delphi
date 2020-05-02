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
  end
  inherited SQLDados: TSQLDataSet
    CommandText = 'Select * from cliente'
  end
end
