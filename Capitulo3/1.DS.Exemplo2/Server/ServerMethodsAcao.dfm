object SMAcao: TSMAcao
  OldCreateOrder = False
  Height = 285
  Width = 404
  object fdmAcoes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 88
    Top = 56
    object fdmAcoesACAO: TStringField
      FieldName = 'ACAO'
      Size = 5
    end
    object fdmAcoesQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object fdmAcoesVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object fdmAcoesTIPO_OPERACAO: TStringField
      FieldName = 'TIPO_OPERACAO'
      Size = 1
    end
  end
end
