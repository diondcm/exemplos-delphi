inherited dmdCategoria: TdmdCategoria
  OnCreate = DataModuleCreate
  inherited cdsCadastro: TClientDataSet
    object cdsCadastroID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsCadastroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  inherited sqlCadastro: TSQLDataSet
    CommandText = 'select ID, DESCRICAO'#13#10'from categoria /*where*/'
    MaxBlobSize = -1
    SQLConnection = dmdConexao.SQLConnection
  end
  inherited qryCadastro: TFDQuery
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select * from categoria /*where*/')
  end
end
