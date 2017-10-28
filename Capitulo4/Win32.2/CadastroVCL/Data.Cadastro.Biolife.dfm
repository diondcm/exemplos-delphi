inherited dmdCadBiolife: TdmdCadBiolife
  inherited cdsCadastro: TClientDataSet
    object cdsCadastroSpeciesNo: TFloatField
      FieldName = 'Species No'
    end
    object cdsCadastroCategory: TWideStringField
      FieldName = 'Category'
      Size = 15
    end
    object cdsCadastroCommon_Name: TWideStringField
      FieldName = 'Common_Name'
      Size = 30
    end
    object cdsCadastroSpeciesName: TWideStringField
      FieldName = 'Species Name'
      Size = 40
    end
    object cdsCadastroLengthcm: TFloatField
      FieldName = 'Length (cm)'
    end
    object cdsCadastroLength_In: TFloatField
      FieldName = 'Length_In'
    end
    object cdsCadastroNotes: TWideMemoField
      FieldName = 'Notes'
      BlobType = ftWideMemo
    end
    object cdsCadastroGraphic: TBlobField
      FieldName = 'Graphic'
    end
  end
  inherited sqlCadastro: TSQLDataSet
    CommandText = 'select * from biolife /*where*/'
    MaxBlobSize = -1
    SQLConnection = dmdConexao.SQLConnection
  end
  inherited adoCadastro: TADOQuery
    Connection = dmdConexao.ADOConnection
    CursorType = ctStatic
    SQL.Strings = (
      'select * from biolife /*where*/')
  end
end
