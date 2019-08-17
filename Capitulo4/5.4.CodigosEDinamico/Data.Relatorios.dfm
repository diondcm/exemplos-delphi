object dmdRelatorios: TdmdRelatorios
  OldCreateOrder = False
  Height = 444
  Width = 568
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\Aqua\exemplos-delphi\SQLite\fast.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 240
    Top = 40
  end
  object qryDept: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from DEPARTMENT')
    Left = 240
    Top = 96
  end
  object frxDBDept: TfrxDBDataset
    UserName = 'Department'
    CloseDataSource = False
    DataSet = qryDept
    BCDToCurrency = False
    Left = 240
    Top = 144
  end
  object frxReportCodigos: TfrxReport
    Version = '6.4.5'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43113.687550115700000000
    ReportOptions.LastChange = 43113.721223796290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      
        '  lCount: Integer = 0;                                          ' +
        '          '
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Inc(lCount);'
      '  if (Sender is TFrxMemoView) then'
      '  begin'
      '    if Engine.FinalPass then'
      '    begin'
      
        '      memTexto.Text := '#39'Passou '#39' + IntToStr(lCount) + '#39' vezes'#39'; ' +
        '                                                                ' +
        '                           '
      '    end else begin'
      '      ShowMessage('#39'Qtd: '#39' + IntToStr(lCount));        '
      '    end;'
      '    Memo1.Text := '#39'123'#39';                                  '
      '              '
      
        '    //TFrxMemoView(Sender).Memo.Text := TFrxMemoView(Sender).Mem' +
        'o.Text + '#39' Count = '#39' + ;'
      '  end;'
      'end;'
      ''
      'begin'
      
        '  //ShowMessage('#39'Teste de Script'#39');                             ' +
        '     '
      'end.')
    Left = 408
    Top = 152
    Datasets = <
      item
        DataSet = frxDBDept
        DataSetName = 'Department'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 3
      ColumnWidth = 63.333333333333300000
      ColumnPositions.Strings = (
        '0'
        '63,3333333333333'
        '126,666666666667')
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digos de Departamento')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 141.574830000000000000
        Top = 102.047310000000000000
        Width = 239.370233333333200000
        DataSet = frxDBDept
        DataSetName = 'Department'
        RowCount = 0
        object Barcode2D1: TfrxBarcode2DView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 7.559060000000003000
          Width = 84.000000000000000000
          Height = 100.000000000000000000
          StretchMode = smActualHeight
          BarType = bcCodeQR
          BarProperties.Encoding = qrAuto
          BarProperties.QuietZone = 0
          BarProperties.ErrorLevels = ecL
          BarProperties.PixelSize = 4
          BarProperties.CodePage = 0
          DataField = 'DEPARTMENT'
          DataSet = frxDBDept
          DataSetName = 'Department'
          Frame.Typ = []
          Rotation = 0
          ShowText = True
          HexData = '31003200330034003500360037003800'
          Zoom = 1.000000000000000000
          FontScaled = True
          QuietZone = 0
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 7.559060000000003000
          Width = 63.881880000000000000
          Height = 79.000000000000000000
          BarType = bcCode128
          Expression = '<Department."DEPARTMENT">'
          Frame.Typ = []
          Rotation = 90
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object memTexto: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 120.944960000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'dfasdfasd')
        end
      end
    end
  end
  object frxReportRunTime: TfrxReport
    Version = '6.4.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43113.726899317130000000
    ReportOptions.LastChange = 43113.726899317130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 408
    Top = 216
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
    end
  end
end
