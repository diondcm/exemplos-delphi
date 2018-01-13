object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Imagens'
  ClientHeight = 414
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panelImagem: TPanel
    Left = 8
    Top = 8
    Width = 289
    Height = 225
    TabOrder = 0
    object navImagem: TDBNavigator
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 281
      Height = 25
      DataSource = dtsImagem
      Align = alTop
      TabOrder = 0
      ExplicitLeft = -39
      ExplicitTop = 145
      ExplicitWidth = 240
    end
    object ImageDB: TDBImage
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 281
      Height = 186
      Align = alClient
      DataField = 'Graphic'
      DataSource = dtsImagem
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 32
      ExplicitWidth = 287
      ExplicitHeight = 198
    end
  end
  object dtsImagem: TDataSource
    DataSet = qryBioLife
    Left = 336
    Top = 112
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Aluno\Desk' +
      'top\exemplos-delphi\SQLite\demo.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 336
    Top = 8
  end
  object qryBioLife: TADOQuery
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from biolife'
      'order by Category')
    Left = 336
    Top = 56
  end
  object frxDBBiolife: TfrxDBDataset
    UserName = 'Biolife'
    CloseDataSource = False
    DataSource = dtsImagem
    BCDToCurrency = False
    Left = 336
    Top = 168
  end
  object frxReport1: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43113.739524722200000000
    ReportOptions.LastChange = 43113.739524722200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 456
    Top = 56
    Datasets = <
      item
        DataSet = frxDBBiolife
        DataSetName = 'Biolife'
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
        Height = 177.637910000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 287.244280000000000000
          Top = 56.692949999999990000
          Width = 136.063080000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -33
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Biolife')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Fill.BackColor = cl3DLight
        Height = 30.236240000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        Child = frxReport1.Child1
        object Memo3: TfrxMemoView
          Left = 11.338590000000000000
          Top = 7.559059999999988000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Biolife List')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 128.504020000000000000
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        Child = frxReport1.childNotes
        DataSet = frxDBBiolife
        DataSetName = 'Biolife'
        RowCount = 0
        object BiolifeSpeciesNo: TfrxMemoView
          Left = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Species No'
          DataSet = frxDBBiolife
          DataSetName = 'Biolife'
          Memo.UTF8W = (
            '[Biolife."Species No"]')
        end
        object BiolifeCategory: TfrxMemoView
          Left = 136.063080000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'Category'
          DataSet = frxDBBiolife
          DataSetName = 'Biolife'
          Memo.UTF8W = (
            '[Biolife."Category"]')
        end
        object BiolifeCommon_Name: TfrxMemoView
          Left = 7.559060000000000000
          Top = 22.677180000000020000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DataField = 'Common_Name'
          DataSet = frxDBBiolife
          DataSetName = 'Biolife'
          Memo.UTF8W = (
            '[Biolife."Common_Name"]')
        end
        object BiolifeSpeciesName: TfrxMemoView
          Left = 7.559060000000000000
          Top = 41.574830000000020000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DataField = 'Species Name'
          DataSet = frxDBBiolife
          DataSetName = 'Biolife'
          Memo.UTF8W = (
            '[Biolife."Species Name"]')
        end
        object BiolifeLengthcm: TfrxMemoView
          Left = 7.559060000000000000
          Top = 75.590600000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Length (cm)'
          DataSet = frxDBBiolife
          DataSetName = 'Biolife'
          Memo.UTF8W = (
            '[Biolife."Length (cm)"]')
        end
        object BiolifeLength_In: TfrxMemoView
          Left = 136.063080000000000000
          Top = 75.590600000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Length_In'
          DataSet = frxDBBiolife
          DataSetName = 'Biolife'
          Memo.UTF8W = (
            '[Biolife."Length_In"]')
        end
        object Picture1: TfrxPictureView
          Left = 419.527830000000000000
          Top = 3.220469999999978000
          Width = 245.669450000000000000
          Height = 117.165430000000000000
          DataField = 'Graphic'
          DataSet = frxDBBiolife
          DataSetName = 'Biolife'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 687.874460000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 6.779530000000023000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[<Date>] [<Time>]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Align = baWidth
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
      end
      object Child2: TfrxChild
        FillType = ftBrush
        Height = 11.338590000000000000
        Top = 616.063390000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Align = baWidth
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object childNotes: TfrxChild
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 551.811380000000000000
        Width = 718.110700000000000000
        Child = frxReport1.Child2
        Stretched = True
        object BiolifeNotes: TfrxMemoView
          Align = baClient
          Width = 718.110700000000000000
          Height = 41.574830000000000000
          StretchMode = smActualHeight
          DataField = 'Notes'
          DataSet = frxDBBiolife
          DataSetName = 'Biolife'
          Memo.UTF8W = (
            '[Biolife."Notes"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Fill.BackColor = cl3DDkShadow
        Height = 22.677180000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        Condition = 'Biolife."Category"'
        StartNewPage = True
        object BiolifeCategory1: TfrxMemoView
          Left = 15.118120000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          DataField = 'Category'
          DataSet = frxDBBiolife
          DataSetName = 'Biolife'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Biolife."Category"]')
          ParentFont = False
        end
      end
    end
  end
end
