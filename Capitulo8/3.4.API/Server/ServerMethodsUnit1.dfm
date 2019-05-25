object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 283
  Width = 364
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 76
    Top = 88
  end
  object RESTClient: TRESTClient
    BaseURL = 
      'https://rest.bitcoin.com/v2/address/details/bitcoincash:qzs02v05' +
      'l7qs5s24srqju498qu55dwuj0cx5ehjm2c'
    Params = <>
    Left = 76
    Top = 24
  end
  object RESTResponse1: TRESTResponse
    Left = 180
    Top = 88
  end
  object memBalance: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 160
    object memBalancelegacyAddress: TStringField
      FieldName = 'legacyAddress'
      Size = 200
    end
    object memBalancecashAddress: TStringField
      FieldName = 'cashAddress'
      Size = 200
    end
    object memBalanceslpAddress: TStringField
      FieldName = 'slpAddress'
      Size = 200
    end
    object memBalancecurrentPage: TFloatField
      FieldName = 'currentPage'
    end
    object memBalancepagesTotal: TFloatField
      FieldName = 'pagesTotal'
    end
    object memBalancebalance: TFloatField
      FieldName = 'balance'
    end
    object memBalancebalanceSat: TFloatField
      FieldName = 'balanceSat'
    end
    object memBalancetotalReceived: TFloatField
      FieldName = 'totalReceived'
    end
    object memBalancetotalReceivedSat: TFloatField
      FieldName = 'totalReceivedSat'
    end
    object memBalancetotalSent: TFloatField
      FieldName = 'totalSent'
    end
    object memBalancetotalSentSat: TFloatField
      FieldName = 'totalSentSat'
    end
    object memBalanceunconfirmedBalance: TFloatField
      FieldName = 'unconfirmedBalance'
    end
    object memBalanceunconfirmedBalanceSat: TFloatField
      FieldName = 'unconfirmedBalanceSat'
    end
    object memBalanceunconfirmedTxApperances: TFloatField
      FieldName = 'unconfirmedTxApperances'
    end
    object memBalancetxApperances: TFloatField
      FieldName = 'txApperances'
    end
  end
  object memTrasactions: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 184
    Top = 160
    object memTrasactionsidbalance: TIntegerField
      FieldName = 'idbalance'
    end
    object memTrasactionstransaction: TStringField
      FieldName = 'transaction'
      Size = 300
    end
  end
end
