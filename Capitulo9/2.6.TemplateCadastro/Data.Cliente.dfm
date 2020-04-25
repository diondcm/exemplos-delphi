inherited dmdCliente: TdmdCliente
  inherited qryDados: TFDQuery
    SQL.Strings = (
      'Select * from cliente')
  end
  inherited SQLDados: TSQLDataSet
    CommandText = 'Select * from cliente'
  end
end
