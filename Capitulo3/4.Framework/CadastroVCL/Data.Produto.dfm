inherited dmdProduto: TdmdProduto
  OnCreate = DataModuleCreate
  inherited cdsCadastro: TClientDataSet
    object cdsCadastroID: TIntegerField
      FieldName = 'ID'
    end
    object cdsCadastroCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object cdsCadastroDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsCadastroCOR: TIntegerField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
    end
    object cdsCadastroPESO: TIntegerField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
  end
  inherited dspCadastro: TDataSetProvider
    DataSet = qryCadastro
  end
  inherited qryCadastro: TFDQuery
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select ID, CODIGO, DESCRICAO, COR, PESO from produto /*where*/')
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
