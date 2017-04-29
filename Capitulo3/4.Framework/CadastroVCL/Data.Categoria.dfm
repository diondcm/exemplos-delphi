inherited dmdCategoria: TdmdCategoria
  OnCreate = DataModuleCreate
  inherited cdsCadastro: TClientDataSet
    object cdsCadastroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object cdsCadastroDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'descricao'
      Size = 100
    end
    object cdsCadastroATIVO: TBooleanField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ativo'
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
    SQL.Strings = (
      'select * from categoria /*where*/')
  end
end
