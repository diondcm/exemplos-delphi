inherited dmdCadVendors: TdmdCadVendors
  inherited cdsCadastro: TClientDataSet
    object cdsCadastroVendorNo: TFloatField
      FieldName = 'VendorNo'
    end
    object cdsCadastroVendorName: TWideStringField
      FieldName = 'VendorName'
      Size = 30
    end
    object cdsCadastroAddress1: TWideStringField
      FieldName = 'Address1'
      Size = 30
    end
    object cdsCadastroAddress2: TWideStringField
      FieldName = 'Address2'
      Size = 30
    end
    object cdsCadastroCity: TWideStringField
      FieldName = 'City'
    end
    object cdsCadastroState: TWideStringField
      FieldName = 'State'
    end
    object cdsCadastroZip: TWideStringField
      FieldName = 'Zip'
      Size = 10
    end
    object cdsCadastroCountry: TWideStringField
      FieldName = 'Country'
      Size = 15
    end
    object cdsCadastroPhone: TWideStringField
      FieldName = 'Phone'
      Size = 15
    end
    object cdsCadastroFAX: TWideStringField
      FieldName = 'FAX'
      Size = 15
    end
  end
  inherited sqlCadastro: TSQLDataSet
    CommandText = 'select * from vendors /*where*/'
    MaxBlobSize = -1
    SQLConnection = dmdConexao.SQLConnection
  end
  inherited adoCadastro: TADOQuery
    Connection = dmdConexao.ADOConnection
    CursorType = ctStatic
    SQL.Strings = (
      'select * from vendors')
  end
end
