object dmdEstoque: TdmdEstoque
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 269
  Width = 365
  object qryEstoque: TFDQuery
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
  object memEstoque: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 168
    Top = 176
    object memEstoqueID: TIntegerField
      FieldName = 'ID'
    end
    object memEstoqueNome: TStringField
      FieldName = 'Nome'
      Size = 200
    end
  end
end
