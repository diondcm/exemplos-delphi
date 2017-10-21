inherited dmdBaseCadastro: TdmdBaseCadastro
  OldCreateOrder = True
  Height = 261
  Width = 229
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastro'
    BeforePost = cdsCadastroBeforePost
    AfterPost = cdsCadastroAfterPost
    AfterCancel = cdsCadastroAfterCancel
    AfterDelete = cdsCadastroAfterDelete
    Left = 88
    Top = 152
  end
  object sqlCadastro: TSQLDataSet
    Params = <>
    Left = 88
    Top = 40
  end
  object dspCadastro: TDataSetProvider
    DataSet = sqlCadastro
    Left = 88
    Top = 96
  end
end
