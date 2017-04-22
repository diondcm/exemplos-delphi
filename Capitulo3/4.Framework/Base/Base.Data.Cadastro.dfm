inherited dmdBaseCadastro: TdmdBaseCadastro
  OldCreateOrder = True
  Height = 316
  Width = 554
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastro'
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
    DataSet = qryCadastro
    Left = 192
    Top = 80
  end
  object qryCadastro: TFDQuery
    Left = 256
    Top = 32
    object qryCadastroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryCadastroDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryCadastroATIVO: TBooleanField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
    end
  end
end
