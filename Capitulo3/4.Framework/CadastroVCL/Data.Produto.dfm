inherited dmdProduto: TdmdProduto
  OnCreate = DataModuleCreate
  inherited cdsCadastro: TClientDataSet
    object cdsCadastroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCadastroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'P.DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsCadastroID_CATEGORIA: TIntegerField
      DisplayLabel = 'C'#243'digo Categoria'
      FieldName = 'ID_CATEGORIA'
    end
    object cdsCadastroCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      DisplayWidth = 50
      FieldName = 'CATEGORIA'
      Origin = 'C.DESCRICAO'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
  end
  inherited sqlCadastro: TSQLDataSet
    CommandText = 
      'select P.DESCRICAO, P.ID, P.ID_CATEGORIA, C.DESCRICAO CATEGORIA'#13 +
      #10'from PRODUTO P'#13#10'inner join CATEGORIA C'#13#10'ON C.ID = P.ID_CATEGORI' +
      'A '#13#10'/* Outra forma de fazer'#13#10', categoria c'#13#10'were C.ID = P.ID_CAT' +
      'EGORIA(+)'#13#10'*/'#13#10'/*where*/'
    MaxBlobSize = -1
    SQLConnection = dmdConexao.SQLConnection
  end
  inherited qryCadastro: TFDQuery
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select P.DESCRICAO, P.ID, P.ID_CATEGORIA, C.DESCRICAO CATEGORIA'
      'from PRODUTO P'
      'inner join CATEGORIA C'
      'ON C.ID = P.ID_CATEGORIA '
      '/* Outra forma de fazer'
      ', categoria c'
      'were C.ID = P.ID_CATEGORIA(+)'
      '*/'
      '/*where*/')
    object qryCadastroID: TIntegerField
      FieldName = 'ID'
    end
    object qryCadastroCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryCadastroDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object qryCadastroCOR: TIntegerField
      FieldName = 'COR'
    end
    object qryCadastroPESO: TIntegerField
      FieldName = 'PESO'
    end
  end
end
