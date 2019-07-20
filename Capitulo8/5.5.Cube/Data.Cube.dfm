object dmdCube: TdmdCube
  OldCreateOrder = False
  Height = 443
  Width = 674
  object MDCube: TfcxCube
    Version = '2.9'
    Formats.BooleanFormat.DecSeparator = ','
    Formats.BooleanFormat.FormatStr = 'False,True'
    Formats.BooleanFormat.Kind = fkBoolean
    Formats.DateFormat.DecSeparator = ','
    Formats.DateFormat.FormatStr = 'dd/MM/yyyy'
    Formats.DateFormat.Kind = fkDateTime
    Formats.TimeFormat.DecSeparator = ','
    Formats.TimeFormat.FormatStr = 'hh:mm'
    Formats.TimeFormat.Kind = fkDateTime
    Formats.DateTimeFormat.DecSeparator = ','
    Formats.DateTimeFormat.FormatStr = 'dd/MM/yyyy'
    Formats.DateTimeFormat.Kind = fkDateTime
    Formats.FloatFormat.DecSeparator = ','
    Formats.FloatFormat.FormatStr = '%2.2n'
    Formats.FloatFormat.Kind = fkNumeric
    Formats.CurrencyFormat.DecSeparator = ','
    Formats.CurrencyFormat.FormatStr = '%2.2m'
    Formats.CurrencyFormat.Kind = fkNumeric
    Formats.IntegerFormat.DecSeparator = ','
    Formats.IntegerFormat.FormatStr = '%g'
    Formats.IntegerFormat.Kind = fkNumeric
    Formats.TextFormat.DecSeparator = ','
    Formats.PercentFormat.DecSeparator = ','
    Formats.PercentFormat.FormatStr = '%2.2n'
    Formats.PercentFormat.Kind = fkNumeric
    Formats.DatePathFormat.MonthDisplayFormat = mdf_Long
    Formats.DatePathFormat.WeekDayDisplayFormat = wddf_Long
    Formats.DatePathFormat.QuarterDisplayFormat = qdf_System
    Formats.DatePathFormat.WeekNumberDisplayFormat = wndf_System
    Left = 96
    Top = 88
  end
  object MDSlice: TfcxSlice
    Version = '2.9'
    Cube = MDCube
    FieldsOrder = fcfloByDataSet
    Left = 96
    Top = 136
  end
  object fcxDBDSItems: TfcxDBDataSet
    Version = '2.9'
    Left = 540
    Top = 267
  end
  object fcxDBDScustomer: TfcxDBDataSet
    Version = '2.9'
    Left = 540
    Top = 27
  end
  object fcxDBDSemployee: TfcxDBDataSet
    Version = '2.9'
    Left = 540
    Top = 75
  end
  object fcxDBDSparts: TfcxDBDataSet
    Version = '2.9'
    Left = 540
    Top = 219
  end
  object fcxDBDSorders: TfcxDBDataSet
    Version = '2.9'
    Left = 540
    Top = 171
  end
  object fcxDBvendors: TfcxDBDataSet
    Version = '2.9'
    Left = 540
    Top = 123
  end
  object Demo: TfcxDataSource
    Version = '2.9'
    DataSet = fcxDBDSItems
    Fields = <
      item
        SourceFieldType = fcxsft_Reference
        SourceFieldProperties.SplitProperty.Attributes = <
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.DateSplitPaths = [odt_Year, odt_Month, odt_Day]
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'SaleDate'
            SourceFieldProperties.DataField.CubeFieldName = 'SaleDate'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'SaleDate'
            SourceFieldProperties.IdField.DataFieldName = 'OrderNo'
            SourceFieldProperties.DataSet = fcxDBDSorders
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'ShipDate'
            SourceFieldProperties.DataField.CubeFieldName = 'ShipDate'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'ShipDate'
            SourceFieldProperties.IdField.DataFieldName = 'OrderNo'
            SourceFieldProperties.DataSet = fcxDBDSorders
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'ShipVIA'
            SourceFieldProperties.DataField.CubeFieldName = 'ShipVIA'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'ShipVIA'
            SourceFieldProperties.IdField.DataFieldName = 'OrderNo'
            SourceFieldProperties.DataSet = fcxDBDSorders
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Terms'
            SourceFieldProperties.DataField.CubeFieldName = 'Terms'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Terms'
            SourceFieldProperties.IdField.DataFieldName = 'OrderNo'
            SourceFieldProperties.DataSet = fcxDBDSorders
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'PaymentMethod'
            SourceFieldProperties.DataField.CubeFieldName = 'PaymentMethod'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'PaymentMethod'
            SourceFieldProperties.IdField.DataFieldName = 'OrderNo'
            SourceFieldProperties.DataSet = fcxDBDSorders
          end>
        SourceFieldProperties.DataField.Convert = False
        SourceFieldProperties.DataField.DataFieldName = 'orderno'
        SourceFieldProperties.DataField.CubeFieldName = 'orderno'
        SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
        SourceFieldProperties.DataField.CubeFieldSize = 0
        SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'orderno'
      end
      item
        SourceFieldType = fcxsft_Reference
        SourceFieldProperties.SplitProperty.Attributes = <
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Description'
            SourceFieldProperties.DataField.CubeFieldName = 'Description'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Description'
            SourceFieldProperties.IdField.DataFieldName = 'PartNo'
            SourceFieldProperties.DataSet = fcxDBDSparts
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'PartNo'
            SourceFieldProperties.DataField.CubeFieldName = 'PartNo'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'PartNo'
            SourceFieldProperties.IdField.DataFieldName = 'PartNo'
            SourceFieldProperties.DataSet = fcxDBDSparts
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <
              item
                SourceFieldType = fcxsft_Reference
                SourceFieldProperties.SplitProperty.Attributes = <>
                SourceFieldProperties.DataField.Convert = False
                SourceFieldProperties.DataField.DataFieldName = 'VendorName'
                SourceFieldProperties.DataField.CubeFieldName = 'VendorName'
                SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
                SourceFieldProperties.DataField.CubeFieldSize = 0
                SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'VendorName'
                SourceFieldProperties.IdField.DataFieldName = 'VendorNo'
                SourceFieldProperties.DataSet = fcxDBvendors
              end>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'VendorNo'
            SourceFieldProperties.DataField.CubeFieldName = 'VendorNo'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'VendorNo'
            SourceFieldProperties.IdField.DataFieldName = 'PartNo'
            SourceFieldProperties.DataSet = fcxDBDSparts
          end>
        SourceFieldProperties.CaptionSourceAttribute = 'Description'
        SourceFieldProperties.DataField.Convert = False
        SourceFieldProperties.DataField.DataFieldName = 'partno'
        SourceFieldProperties.DataField.CubeFieldName = 'partno'
        SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
        SourceFieldProperties.DataField.CubeFieldSize = 0
        SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'partno'
      end
      item
        SourceFieldType = fcxsft_Reference
        SourceFieldProperties.SplitProperty.Attributes = <>
        SourceFieldProperties.DataField.Convert = False
        SourceFieldProperties.DataField.DataFieldName = 'qty'
        SourceFieldProperties.DataField.CubeFieldName = 'qty'
        SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
        SourceFieldProperties.DataField.CubeFieldSize = 0
        SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'qty'
      end
      item
        SourceFieldType = fcxsft_Reference
        SourceFieldProperties.SplitProperty.Attributes = <
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Company'
            SourceFieldProperties.DataField.CubeFieldName = 'Company'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Company'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Addr1'
            SourceFieldProperties.DataField.CubeFieldName = 'Addr1'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Addr1'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Addr2'
            SourceFieldProperties.DataField.CubeFieldName = 'Addr2'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Addr2'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'City'
            SourceFieldProperties.DataField.CubeFieldName = 'City'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'City'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'State'
            SourceFieldProperties.DataField.CubeFieldName = 'State'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'State'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Zip'
            SourceFieldProperties.DataField.CubeFieldName = 'Zip'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Zip'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Country'
            SourceFieldProperties.DataField.CubeFieldName = 'Country'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Country'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Phone'
            SourceFieldProperties.DataField.CubeFieldName = 'Phone'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Phone'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'FAX'
            SourceFieldProperties.DataField.CubeFieldName = 'FAX'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'FAX'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'TaxRate'
            SourceFieldProperties.DataField.CubeFieldName = 'TaxRate'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'TaxRate'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Contact'
            SourceFieldProperties.DataField.CubeFieldName = 'Contact'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Contact'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'LastInvoiceDate'
            SourceFieldProperties.DataField.CubeFieldName = 'LastInvoiceDate'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'LastInvoiceDate'
            SourceFieldProperties.IdField.DataFieldName = 'CustNo'
            SourceFieldProperties.DataSet = fcxDBDScustomer
          end>
        SourceFieldProperties.CaptionSourceAttribute = 'Company'
        SourceFieldProperties.DataField.Convert = False
        SourceFieldProperties.DataField.DataFieldName = 'custno'
        SourceFieldProperties.DataField.CubeFieldName = 'custno'
        SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
        SourceFieldProperties.DataField.CubeFieldSize = 0
        SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'custno'
      end
      item
        SourceFieldType = fcxsft_Reference
        SourceFieldProperties.SplitProperty.Attributes = <
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'LastName'
            SourceFieldProperties.DataField.CubeFieldName = 'LastName'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'LastName'
            SourceFieldProperties.IdField.DataFieldName = 'EmpNo'
            SourceFieldProperties.DataSet = fcxDBDSemployee
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'FirstName'
            SourceFieldProperties.DataField.CubeFieldName = 'FirstName'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'FirstName'
            SourceFieldProperties.IdField.DataFieldName = 'EmpNo'
            SourceFieldProperties.DataSet = fcxDBDSemployee
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'PhoneExt'
            SourceFieldProperties.DataField.CubeFieldName = 'PhoneExt'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'PhoneExt'
            SourceFieldProperties.IdField.DataFieldName = 'EmpNo'
            SourceFieldProperties.DataSet = fcxDBDSemployee
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'HireDate'
            SourceFieldProperties.DataField.CubeFieldName = 'HireDate'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'HireDate'
            SourceFieldProperties.IdField.DataFieldName = 'EmpNo'
            SourceFieldProperties.DataSet = fcxDBDSemployee
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Salary'
            SourceFieldProperties.DataField.CubeFieldName = 'Salary'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Salary'
            SourceFieldProperties.IdField.DataFieldName = 'EmpNo'
            SourceFieldProperties.DataSet = fcxDBDSemployee
          end
          item
            SourceFieldType = fcxsft_Reference
            SourceFieldProperties.SplitProperty.Attributes = <>
            SourceFieldProperties.DataField.Convert = False
            SourceFieldProperties.DataField.DataFieldName = 'Name'
            SourceFieldProperties.DataField.CubeFieldName = 'Name'
            SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
            SourceFieldProperties.DataField.CubeFieldSize = 0
            SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Name'
            SourceFieldProperties.IdField.DataFieldName = 'EmpNo'
            SourceFieldProperties.DataSet = fcxDBDSemployee
          end>
        SourceFieldProperties.CaptionSourceAttribute = 'Name'
        SourceFieldProperties.OrderSourceAttribute = 'Name'
        SourceFieldProperties.DataField.Convert = False
        SourceFieldProperties.DataField.DataFieldName = 'empno'
        SourceFieldProperties.DataField.CubeFieldName = 'empno'
        SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
        SourceFieldProperties.DataField.CubeFieldSize = 0
        SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'empno'
      end>
    Left = 180
    Top = 283
  end
  object fcDBDataSet1: TfcxDBDataSet
    Version = '2.9'
    Left = 180
    Top = 339
  end
  object fcDataSource1: TfcxDataSource
    Version = '2.9'
    DataSet = fcDBDataSet1
    Fields = <>
    Left = 92
    Top = 184
  end
  object fcxDirDataset: TfcxUserDataSet
    Version = '2.9'
    Fields.Strings = (
      'Time'
      'Size'
      'Attr'
      'Name')
    Left = 276
    Top = 210
  end
  object fcxCalendarDataset: TfcxUserDataSet
    Version = '2.9'
    Fields.Strings = (
      'Date')
    Left = 276
    Top = 154
  end
  object fcxCalendarDataSource: TfcxDataSource
    Version = '2.9'
    DataSet = fcxCalendarDataset
    Fields = <
      item
        SourceFieldType = fcxsft_Reference
        SourceFieldProperties.SplitProperty.DateSplitPaths = [odt_Year, odt_Month, odt_Day, odt_DayOfWeek, odt_WeekNumber]
        SourceFieldProperties.SplitProperty.Attributes = <>
        SourceFieldProperties.DataField.Convert = False
        SourceFieldProperties.DataField.DataFieldName = 'Date'
        SourceFieldProperties.DataField.CubeFieldName = 'Date'
        SourceFieldProperties.DataField.CubeFieldType = fcdt_NotImplemented
        SourceFieldProperties.DataField.CubeFieldSize = 0
        SourceFieldProperties.DataField.CubeFieldDisplayLabel = 'Date'
      end>
    Left = 276
    Top = 99
  end
end
