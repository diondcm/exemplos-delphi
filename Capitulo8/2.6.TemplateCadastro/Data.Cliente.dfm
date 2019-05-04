inherited dmdCliente: TdmdCliente
  OldCreateOrder = True
  inherited qryDados: TFDQuery
    SQL.Strings = (
      'select * from cliente')
    object qryDadosIDCLIENTE: TFDAutoIncField
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryDadosNOME: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryDadosDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryDadosCPF: TWideStringField
      DisplayWidth = 11
      FieldName = 'CPF'
      Origin = 'CPF'
    end
    object qryDadosRG: TWideStringField
      DisplayWidth = 11
      FieldName = 'RG'
      Origin = 'RG'
    end
    object qryDadosDATA_NASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      DisplayWidth = 10
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
  end
end
