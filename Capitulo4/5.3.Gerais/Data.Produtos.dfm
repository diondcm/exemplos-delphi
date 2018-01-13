object dmdProdutos: TdmdProdutos
  OldCreateOrder = False
  Height = 334
  Width = 527
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\fast.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 256
    Top = 56
  end
  object qryProdutos: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from produto')
    Left = 256
    Top = 104
  end
  object frxDBProdutos: TfrxDBDataset
    UserName = 'Produtos'
    CloseDataSource = False
    DataSet = qryProdutos
    BCDToCurrency = False
    Left = 256
    Top = 152
  end
end
