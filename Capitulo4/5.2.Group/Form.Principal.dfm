object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Lista & Grupo'
  ClientHeight = 491
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 253
    Width = 944
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 57
    ExplicitWidth = 314
  end
  object panelControles: TPanel
    Left = 0
    Top = 0
    Width = 944
    Height = 57
    Align = alTop
    TabOrder = 0
    object buttonImpCategoriaAtual: TButton
      Left = 16
      Top = 13
      Width = 233
      Height = 34
      Caption = 'Imprime esta Categoria'
      TabOrder = 0
      OnClick = buttonImpCategoriaAtualClick
    end
    object buttonProdutoPorCategoria: TButton
      Left = 255
      Top = 13
      Width = 233
      Height = 34
      Caption = 'Produto por Categoria'
      TabOrder = 1
      OnClick = buttonProdutoPorCategoriaClick
    end
  end
  object gridCategoria: TDBGrid
    Left = 0
    Top = 57
    Width = 944
    Height = 196
    Align = alClient
    DataSource = dtsCategoria
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object gridProdutos: TDBGrid
    Left = 0
    Top = 256
    Width = 944
    Height = 235
    Align = alBottom
    DataSource = dtsProdutos
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\fast.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 528
    Top = 8
  end
  object qryCategoria: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from categoria')
    Left = 80
    Top = 120
  end
  object dtsCategoria: TDataSource
    DataSet = qryCategoria
    Left = 80
    Top = 176
  end
  object qryProdutos: TFDQuery
    MasterSource = dtsCategoria
    MasterFields = 'ID_CATEGORIA'
    Connection = FDConnection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select * from produto'
      'where id_categoria = :id_categoria')
    Left = 80
    Top = 320
    ParamData = <
      item
        Name = 'ID_CATEGORIA'
        DataType = ftAutoInc
        ParamType = ptInput
      end>
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 80
    Top = 376
  end
  object frxReportGroupDataSet: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43113.463907280100000000
    ReportOptions.LastChange = 43113.463907280100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 176
    Top = 280
    Datasets = <
      item
        DataSet = frxDBCategoria
        DataSetName = 'Categoria'
      end
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 136.063080000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 230.551330000000000000
          Top = 49.133890000000000000
          Width = 234.330860000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Lista de Produtos')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 132.283550000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        Condition = 'Categoria."ID_CATEGORIA"'
        object Memo2: TfrxMemoView
          Left = 18.897650000000000000
          Width = 555.590910000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Categoria: [Categoria."CODIGO"] [Categoria."NOME"]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        DataSet = frxDBProdutos
        DataSetName = 'Produtos'
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 15.118120000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Produtos."CODIGO"]')
        end
        object Memo4: TfrxMemoView
          Left = 185.196970000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Produtos."NOME"]')
        end
        object Memo5: TfrxMemoView
          Left = 551.811380000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Produtos."VALOR"]')
        end
      end
    end
  end
  object frxDBCategoria: TfrxDBDataset
    UserName = 'Categoria'
    CloseDataSource = False
    DataSource = dtsCategoria
    BCDToCurrency = False
    Left = 80
    Top = 224
  end
  object frxDBProdutos: TfrxDBDataset
    UserName = 'Produtos'
    CloseDataSource = False
    DataSource = dtsProdutos
    BCDToCurrency = False
    Left = 80
    Top = 432
  end
  object qryListaProdutos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'Select p.nome produto, p.codigo cod_produto, p.valor, c.codigo c' +
        'od_categoria, c.nome categoria '
      'from produto p'
      'join categoria c'
      'on p.id_categoria = c.id_categoria'
      'order by c.nome')
    Left = 544
    Top = 272
  end
  object frxDBListaProdutos: TfrxDBDataset
    UserName = 'ListaProdutos'
    CloseDataSource = False
    DataSet = qryListaProdutos
    BCDToCurrency = False
    Left = 544
    Top = 328
  end
  object frxReportListaProdutos: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43113.491392546300000000
    ReportOptions.LastChange = 43113.491392546300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 544
    Top = 200
    Datasets = <
      item
        DataSet = frxDBListaProdutos
        DataSetName = 'ListaProdutos'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 136.063080000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 249.448980000000000000
          Top = 52.913420000000000000
          Width = 207.874150000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Lista Produtos')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 128.504020000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        Condition = 'ListaProdutos."cod_categoria"'
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[ListaProdutos."cod_categoria"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 68.031540000000000000
          Width = 514.016080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[ListaProdutos."categoria"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        DataSet = frxDBListaProdutos
        DataSetName = 'ListaProdutos'
        RowCount = 0
        object Memo4: TfrxMemoView
          Left = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[ListaProdutos."cod_produto"]')
        end
        object Memo5: TfrxMemoView
          Left = 143.622140000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[ListaProdutos."produto"]')
        end
        object Memo6: TfrxMemoView
          Left = 578.268090000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[ListaProdutos."VALOR"]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Quantidade: [COUNT(MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
end
