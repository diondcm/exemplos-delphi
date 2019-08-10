object dmdCliente: TdmdCliente
  OldCreateOrder = False
  Height = 267
  Width = 317
  object qryClientes: TFDQuery
    Connection = dmdConnection.FDConnection
    SQL.Strings = (
      'select * from cliente order by nome')
    Left = 144
    Top = 120
  end
end
