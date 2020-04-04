object dmdCliente: TdmdCliente
  OldCreateOrder = False
  Height = 296
  Width = 386
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\exemplos-delphi\Capitulo9\1.2.DB\Win32\D' +
        'ebug\dados.db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    Left = 176
    Top = 72
  end
  object qryCliente: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from clientes')
    Left = 176
    Top = 136
    object qryClienteID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryClienteNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryClienteDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
  end
end
