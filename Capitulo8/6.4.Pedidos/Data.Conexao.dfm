object dmdConexao: TdmdConexao
  OldCreateOrder = False
  Height = 365
  Width = 430
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 168
    Top = 48
  end
  object qryCriaTabCotacao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS COTACAO ('
      '    tid    BIGINT,'
      '    date   BIGINT,'
      '    type   STRING (20),'
      '    price  DECIMAL (10, 6),'
      '    amount DECIMAL (10, 6) '
      ')')
    Left = 264
    Top = 152
  end
  object qryCotacao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from cotacao')
    Left = 96
    Top = 152
    object qryCotacaotid: TLargeintField
      FieldName = 'tid'
      Origin = 'tid'
    end
    object qryCotacaodate: TLargeintField
      FieldName = 'date'
      Origin = 'date'
    end
    object qryCotacaotype: TWideStringField
      FieldName = 'type'
      Origin = 'type'
    end
    object qryCotacaoprice: TFMTBCDField
      FieldName = 'price'
      Origin = 'price'
      Precision = 10
      Size = 6
    end
    object qryCotacaoamount: TFMTBCDField
      FieldName = 'amount'
      Origin = 'amount'
      Precision = 10
      Size = 6
    end
  end
end
