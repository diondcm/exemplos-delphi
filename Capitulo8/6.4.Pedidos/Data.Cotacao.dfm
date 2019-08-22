object dmdCotacao: TdmdCotacao
  OldCreateOrder = False
  Height = 325
  Width = 473
  object RESTClient1: TRESTClient
    BaseURL = 
      'https://www.mercadobitcoin.net/api/BTC/trades/1501871369/1503360' +
      '174/'
    Params = <>
    Left = 72
    Top = 32
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 72
    Top = 88
  end
  object RESTResponse1: TRESTResponse
    Left = 72
    Top = 144
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Active = True
    Dataset = memCotacao
    FieldDefs = <>
    ResponseJSON = RESTResponse1
    Left = 240
    Top = 200
  end
  object memCotacao: TFDMemTable
    Active = True
    OnCalcFields = memCotacaoCalcFields
    FieldDefs = <
      item
        Name = 'tid'
        DataType = ftLargeint
      end
      item
        Name = 'date'
        DataType = ftLargeint
      end
      item
        Name = 'type'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'price'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'amount'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'type;date'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 240
    Top = 248
    object memCotacaotid: TLargeintField
      FieldName = 'tid'
    end
    object memCotacaodate: TLargeintField
      FieldName = 'date'
    end
    object memCotacaotype: TStringField
      FieldName = 'type'
    end
    object memCotacaoprice: TCurrencyField
      FieldName = 'price'
    end
    object memCotacaoamount: TFloatField
      FieldName = 'amount'
    end
    object memCotacaodata: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'data'
      Calculated = True
    end
  end
end
