object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Gerais'
  ClientHeight = 502
  ClientWidth = 1011
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gridProdutos: TDBGrid
    AlignWithMargins = True
    Left = 6
    Top = 47
    Width = 999
    Height = 449
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    DataSource = dtsProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridProdutosDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1011
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Para heran'#231'a verificar: ..Capitulo3\Fast.Exemplo3\RelBase.fr3'
    TabOrder = 1
  end
  object dtsProdutos: TDataSource
    DataSet = dmdProdutos.qryProdutos
    Left = 376
    Top = 120
  end
  object TimerOpen: TTimer
    Enabled = False
    OnTimer = TimerOpenTimer
    Left = 264
    Top = 88
  end
  object frxReport1: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43113.655954664350000000
    ReportOptions.LastChange = 43113.655954664350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 696
    Top = 112
    Datasets = <
      item
        DataSet = dmdProdutos.frxDBProdutos
        DataSetName = 'Produtos'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clBlack
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clBlack
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 52479
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
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
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000010000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 718.110236220472400000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 65.650138327303680000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'CODIGO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 65.650138327303680000
          Width = 591.749904234943500000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'NOME')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 657.400042562247200000
          Width = 60.710193658225150000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
          Style = 'Header'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        Condition = 'Produtos."ID_CATEGORIA"'
        object Memo6: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'ID_CATEGORIA'
          DataSet = dmdProdutos.frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 52479
          Memo.UTF8W = (
            '[Produtos."ID_CATEGORIA"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = dmdProdutos.frxDBProdutos
        DataSetName = 'Produtos'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 65.650138327303680000
          Height = 18.897650000000000000
          DataField = 'CODIGO'
          DataSet = dmdProdutos.frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Produtos."CODIGO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          Left = 65.650138327303680000
          Width = 591.749904234943500000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = dmdProdutos.frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Produtos."NOME"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          Left = 657.400042562247200000
          Width = 60.710193658225150000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          DataSet = dmdProdutos.frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Produtos."VALOR"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Top = 241.889920000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo11: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo12: TfrxMemoView
          Align = baRight
          Left = 642.520100000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
end
