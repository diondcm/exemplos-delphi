object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'C'#243'digos de Barras e Arquivos'
  ClientHeight = 362
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnListaCodigos: TButton
    Left = 8
    Top = 8
    Width = 169
    Height = 41
    Caption = 'Lista C'#243'digos'
    TabOrder = 0
    OnClick = btnListaCodigosClick
  end
  object btnCarregaDinamico: TButton
    Left = 8
    Top = 104
    Width = 169
    Height = 41
    Caption = 'Carrega din'#226'mico'
    TabOrder = 1
    OnClick = btnCarregaDinamicoClick
  end
  object btnImpressao: TButton
    Left = 8
    Top = 55
    Width = 169
    Height = 43
    Caption = 'Impress'#227'o'
    TabOrder = 2
    OnClick = btnImpressaoClick
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\fast_novo' +
        '.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 408
    Top = 96
  end
  object qryProdutos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from produto')
    Left = 408
    Top = 168
  end
  object frxReportListaCodigo: TfrxReport
    Version = '5.6.17'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42931.394998912000000000
    ReportOptions.Name = 'Teste Impress'#227'o'
    ReportOptions.LastChange = 42931.426019722200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '// Setar Report.doublepass para true, para passar 2 vzs         ' +
        '                                                                ' +
        '                         '
      '//  if Engine.FinalPass then'
      '//  begin'
      '    //                   '
      '//  end;            '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 288
    Top = 96
    Datasets = <
      item
        DataSet = frxDBProdutos
        DataSetName = 'Produtos'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 68.031540000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Lista de produtos')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 158.740260000000000000
        Top = 102.047310000000000000
        Width = 239.370233333333200000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBProdutos
        DataSetName = 'Produtos'
        RowCount = 0
        object BarCode2: TfrxBarCodeView
          Left = 151.181200000000000000
          Top = 15.118120000000010000
          Width = 37.425170000000000000
          Height = 79.000000000000000000
          BarType = bcCode128C
          Expression = '<Produtos."ID_PRODUTO">'
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
        object Barcode2D1: TfrxBarcode2DView
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 84.000000000000000000
          Height = 100.000000000000000000
          StretchMode = smActualHeight
          BarType = bcCodeQR
          BarProperties.Encoding = qrAuto
          BarProperties.QuietZone = 0
          BarProperties.ErrorLevels = ecL
          BarProperties.PixelSize = 4
          BarProperties.CodePage = 0
          DataField = 'NOME'
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Rotation = 0
          ShowText = True
          Text = '12345678'
          Zoom = 1.000000000000000000
          FontScaled = True
          QuietZone = 0
        end
      end
    end
  end
  object frxDBProdutos: TfrxDBDataset
    UserName = 'Produtos'
    CloseDataSource = False
    DataSet = qryProdutos
    BCDToCurrency = False
    Left = 408
    Top = 224
  end
  object frxReportDinamico: TfrxReport
    Version = '5.6.17'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42931.426622129630000000
    ReportOptions.LastChange = 42931.426622129630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 288
    Top = 168
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
    end
  end
end
