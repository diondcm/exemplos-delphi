inherited dmdBaseCadastro: TdmdBaseCadastro
  Height = 316
  Width = 554
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsCadastroAfterPost
    AfterCancel = cdsCadastroAfterCancel
    AfterDelete = cdsCadastroAfterDelete
    Left = 192
    Top = 128
  end
  object sqlCadastro: TSQLDataSet
    Params = <>
    Left = 192
    Top = 32
  end
  object dspCadastro: TDataSetProvider
    Left = 192
    Top = 80
  end
end
