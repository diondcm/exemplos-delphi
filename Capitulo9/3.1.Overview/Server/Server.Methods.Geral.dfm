object SMGeral: TSMGeral
  OldCreateOrder = False
  Height = 341
  Width = 509
  object RESTClient1: TRESTClient
    BaseURL = 
      'https://api.blockcypher.com/v1/btc/main/txs/f854aebae95150b379cc' +
      '1187d848d58225f3c4157fe992bcd166f58bd5063449'
    Params = <>
    Left = 288
    Top = 40
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 344
    Top = 88
  end
  object RESTResponse1: TRESTResponse
    Left = 256
    Top = 88
  end
  object RESTClient2: TRESTClient
    BaseURL = 'https://servicodados.ibge.gov.br/api/v1/produtos/estatisticas'
    Params = <>
    Left = 288
    Top = 160
  end
  object RESTRequest2: TRESTRequest
    Client = RESTClient2
    Params = <>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 344
    Top = 208
  end
  object RESTResponse2: TRESTResponse
    Left = 256
    Top = 208
  end
end
