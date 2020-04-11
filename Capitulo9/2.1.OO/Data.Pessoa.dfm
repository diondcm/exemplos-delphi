object dmdPessoa: TdmdPessoa
  OldCreateOrder = False
  Height = 247
  Width = 355
  object memPessoa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 104
    object memPessoaID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object memPessoaCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
    end
    object memPessoaNome: TStringField
      DisplayWidth = 45
      FieldName = 'Nome'
      Size = 200
    end
    object memPessoaCPF: TStringField
      DisplayWidth = 12
      FieldName = 'CPF'
      Size = 11
    end
    object memPessoaDataNascimento: TDateField
      DisplayLabel = 'Nascimento'
      DisplayWidth = 12
      FieldName = 'DataNascimento'
    end
    object memPessoaRenda: TCurrencyField
      DisplayWidth = 12
      FieldName = 'Renda'
      DisplayFormat = 'R$ 0.,00'
    end
  end
end
