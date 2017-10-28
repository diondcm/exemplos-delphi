inherited dmdBaseCadastro: TdmdBaseCadastro
  OldCreateOrder = True
  Height = 261
  Width = 386
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastro'
    BeforePost = cdsCadastroBeforePost
    AfterPost = cdsCadastroAfterPost
    AfterCancel = cdsCadastroAfterCancel
    AfterDelete = cdsCadastroAfterDelete
    Left = 136
    Top = 168
  end
  object sqlCadastro: TSQLDataSet
    Params = <>
    Left = 88
    Top = 40
  end
  object dspCadastro: TDataSetProvider
    DataSet = adoCadastro
    Left = 136
    Top = 112
  end
  object adoCadastro: TADOQuery
    Parameters = <>
    Left = 200
    Top = 40
  end
end
