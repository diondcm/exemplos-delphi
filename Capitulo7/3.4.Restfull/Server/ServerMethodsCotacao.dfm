object MethodsCotacao: TMethodsCotacao
  OldCreateOrder = False
  Height = 238
  Width = 326
  object memCotacao: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 136
    Top = 56
    object memCotacaodescription: TStringField
      FieldName = 'description'
      Size = 200
    end
    object memCotacaoperiod: TStringField
      FieldName = 'period'
      Size = 50
    end
    object memCotacaounit: TStringField
      FieldName = 'unit'
      Size = 50
    end
    object memCotacaoname: TStringField
      FieldName = 'name'
      Size = 150
    end
    object memCotacaodata: TDateTimeField
      FieldName = 'data'
    end
    object memCotacaovalor: TCurrencyField
      FieldName = 'valor'
    end
  end
  object RESTClient: TRESTClient
    BaseURL = 'https://blockchain.info/charts/market-price?format=json'
    Params = <>
    HandleRedirects = True
    Left = 200
    Top = 104
  end
  object RESTResponse1: TRESTResponse
    Left = 248
    Top = 168
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 152
    Top = 168
  end
end
