object ProdutoResource: TProdutoResource
  OldCreateOrder = False
  Height = 280
  Width = 330
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=postgres'
      'Port=5433'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object qryProduto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from produto')
    Left = 72
    Top = 96
    object qryProdutoidproduto: TLargeintField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryProdutodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object qryProdutogrupo: TWideStringField
      FieldName = 'grupo'
      Origin = 'grupo'
    end
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\Instrutor01\Downloads\pgsql\bin\libpq.dll'
    Left = 208
    Top = 96
  end
  object EMSDataSetResourceProduto: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryProduto
    KeyFields = 'idproduto'
    Left = 80
    Top = 152
  end
end
