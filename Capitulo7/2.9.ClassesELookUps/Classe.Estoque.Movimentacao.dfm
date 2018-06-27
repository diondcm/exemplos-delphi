object dmdMovimentacao: TdmdMovimentacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 291
  Width = 534
  object qryMovimentacao: TFDQuery
    SQL.Strings = (
      'select * from estoque where id= :id_estoque')
    Left = 168
    Top = 120
    ParamData = <
      item
        Name = 'ID_ESTOQUE'
        ParamType = ptInput
      end>
  end
  object memMovimentacao: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 168
    Top = 176
    object memMovimentacaoID: TIntegerField
      FieldName = 'ID'
    end
    object memMovimentacaoID_ESTOQUE: TIntegerField
      FieldName = 'ID_ESTOQUE'
    end
    object memMovimentacaoDATA_MOVIMENTACAO: TDateTimeField
      FieldName = 'DATA_MOVIMENTACAO'
    end
  end
end
