object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ActiveControl = gridPessoa
  Caption = 'Cadastro Pessoa'
  ClientHeight = 638
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gridPessoa: TDBGrid
    Left = 0
    Top = 379
    Width = 975
    Height = 259
    Align = alBottom
    DataSource = dtsPessoa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridPessoaDblClick
  end
  object NavPessoa: TDBNavigator
    Left = 0
    Top = 315
    Width = 975
    Height = 64
    DataSource = dtsPessoa
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbRefresh]
    Align = alBottom
    TabOrder = 1
  end
  object buttonConnect: TButton
    Left = 8
    Top = 16
    Width = 105
    Height = 33
    Caption = 'Conectar'
    TabOrder = 2
    OnClick = buttonConnectClick
  end
  object buttonCadastrar: TButton
    Left = 119
    Top = 16
    Width = 130
    Height = 33
    Caption = 'Cadastrar'
    TabOrder = 3
    OnClick = buttonCadastrarClick
  end
  object memoLog: TMemo
    Left = 648
    Top = 0
    Width = 327
    Height = 315
    Align = alRight
    TabOrder = 4
  end
  object buttonExibePessoa: TButton
    Left = 8
    Top = 55
    Width = 105
    Height = 34
    Caption = 'Exibir Pessoa'
    TabOrder = 5
    OnClick = buttonExibePessoaClick
  end
  object buttonEditaObjeto: TButton
    Left = 119
    Top = 55
    Width = 130
    Height = 34
    Caption = 'Editar por Objeto'
    TabOrder = 6
    OnClick = buttonEditaObjetoClick
  end
  object buttonReport: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Report'
    TabOrder = 7
    OnClick = buttonReportClick
  end
  object dtsPessoa: TDataSource
    DataSet = dmdPessoa.cdsPessoa
    Left = 56
    Top = 224
  end
  object frxReport1: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43015.590972407410000000
    ReportOptions.LastChange = 43015.590972407410000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 504
    Top = 64
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
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
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 291.023810000000000000
          Top = 34.015770000000010000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Teste de relat'#243'rio')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CODIGO"]')
        end
        object Memo3: TfrxMemoView
          Left = 143.622140000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dmdPessoa.cdsPessoa
    BCDToCurrency = False
    Left = 576
    Top = 64
  end
end
