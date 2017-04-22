inherited dmdCategoria: TdmdCategoria
  OnCreate = DataModuleCreate
  inherited cdsCadastro: TClientDataSet
    ProviderName = 'dspCadastro'
    object cdsCadastroID: TIntegerField
      FieldName = 'ID'
    end
    object cdsCadastroDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsCadastroATIVO: TBooleanField
      FieldName = 'ATIVO'
    end
  end
  inherited sqlCadastro: TSQLDataSet
    CommandText = 'select ID, DESCRICAO, ATIVO '#13#10'from categoria /*where*/'
    MaxBlobSize = -1
    SQLConnection = dmdConexao.SQLConnection
  end
  inherited dspCadastro: TDataSetProvider
    DataSet = qryCadastro
  end
  inherited qryCadastro: TFDQuery
    Connection = dmdConexao.FDConnection
  end
end
