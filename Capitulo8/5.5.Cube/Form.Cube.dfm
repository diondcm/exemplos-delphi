object frmCube: TfrmCube
  Left = 0
  Top = 0
  Caption = 'Cube Test'
  ClientHeight = 477
  ClientWidth = 1049
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 196
    Top = 0
    Height = 477
    ExplicitLeft = 528
    ExplicitTop = 208
    ExplicitHeight = 100
  end
  object PageControlGeral: TPageControl
    AlignWithMargins = True
    Left = 202
    Top = 3
    Width = 844
    Height = 471
    ActivePage = TabSlice
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitWidth = 1043
    object TabSlice: TTabSheet
      Caption = 'Classifica'#231#227'o'
      ExplicitLeft = 0
      ExplicitWidth = 1035
      object fcxSliceGrid1: TfcxSliceGrid
        Left = 0
        Top = 97
        Width = 836
        Height = 346
        Version = '2.9'
        Align = alClient
        Styles.CaptionArea.TextColor = clBlack
        Styles.CaptionArea.FillColor = 15466495
        Styles.CaptionArea.GradientColor = clWhite
        Styles.CaptionArea.Font.Charset = DEFAULT_CHARSET
        Styles.CaptionArea.Font.Color = clWindowText
        Styles.CaptionArea.Font.Height = -11
        Styles.CaptionArea.Font.Name = 'Tahoma'
        Styles.CaptionArea.Font.Style = []
        Styles.CaptionArea.GradientDirection = tgdHorizontal
        Styles.HeaderArea.TextColor = clBlack
        Styles.HeaderArea.FillColor = clBtnFace
        Styles.HeaderArea.Font.Charset = DEFAULT_CHARSET
        Styles.HeaderArea.Font.Color = clWindowText
        Styles.HeaderArea.Font.Height = -11
        Styles.HeaderArea.Font.Name = 'Tahoma'
        Styles.HeaderArea.Font.Style = []
        Styles.HeaderCells.TextColor = clBlack
        Styles.HeaderCells.FillColor = clBtnFace
        Styles.HeaderCells.Font.Charset = DEFAULT_CHARSET
        Styles.HeaderCells.Font.Color = clWindowText
        Styles.HeaderCells.Font.Height = -11
        Styles.HeaderCells.Font.Name = 'Tahoma'
        Styles.HeaderCells.Font.Style = []
        Styles.HeaderCellsSelected.TextColor = clBtnText
        Styles.HeaderCellsSelected.FillColor = clBtnShadow
        Styles.HeaderCellsSelected.Font.Charset = DEFAULT_CHARSET
        Styles.HeaderCellsSelected.Font.Color = clWindowText
        Styles.HeaderCellsSelected.Font.Height = -11
        Styles.HeaderCellsSelected.Font.Name = 'Tahoma'
        Styles.HeaderCellsSelected.Font.Style = []
        Styles.DataArea.TextColor = clGray
        Styles.DataArea.FillColor = clWhite
        Styles.DataArea.Font.Charset = DEFAULT_CHARSET
        Styles.DataArea.Font.Color = clWindowText
        Styles.DataArea.Font.Height = -11
        Styles.DataArea.Font.Name = 'Tahoma'
        Styles.DataArea.Font.Style = []
        Styles.DataCells.TextColor = clBlack
        Styles.DataCells.FillColor = clWhite
        Styles.DataCells.Font.Charset = DEFAULT_CHARSET
        Styles.DataCells.Font.Color = clWindowText
        Styles.DataCells.Font.Height = -11
        Styles.DataCells.Font.Name = 'Tahoma'
        Styles.DataCells.Font.Style = []
        Styles.DataCellsSelected.TextColor = clHighlightText
        Styles.DataCellsSelected.FillColor = clHighlight
        Styles.DataCellsSelected.Font.Charset = DEFAULT_CHARSET
        Styles.DataCellsSelected.Font.Color = clWindowText
        Styles.DataCellsSelected.Font.Height = -11
        Styles.DataCellsSelected.Font.Name = 'Tahoma'
        Styles.DataCellsSelected.Font.Style = []
        Styles.StatusArea.TextColor = clBlack
        Styles.StatusArea.FillColor = clBtnFace
        Styles.StatusArea.Font.Charset = DEFAULT_CHARSET
        Styles.StatusArea.Font.Color = clWindowText
        Styles.StatusArea.Font.Height = -11
        Styles.StatusArea.Font.Name = 'Tahoma'
        Styles.StatusArea.Font.Style = []
        Styles.ActiveDimension.TextColor = clCaptionText
        Styles.ActiveDimension.FillColor = clActiveCaption
        Styles.ActiveDimension.GradientColor = clGradientActiveCaption
        Styles.ActiveDimension.Font.Charset = DEFAULT_CHARSET
        Styles.ActiveDimension.Font.Color = clWindowText
        Styles.ActiveDimension.Font.Height = -11
        Styles.ActiveDimension.Font.Name = 'Tahoma'
        Styles.ActiveDimension.Font.Style = []
        Styles.ActiveDimension.GradientDirection = tgdHorizontal
        Styles.InactiveDimension.TextColor = clInactiveCaptionText
        Styles.InactiveDimension.FillColor = clInactiveCaption
        Styles.InactiveDimension.GradientColor = clGradientInactiveCaption
        Styles.InactiveDimension.Font.Charset = DEFAULT_CHARSET
        Styles.InactiveDimension.Font.Color = clWindowText
        Styles.InactiveDimension.Font.Height = -11
        Styles.InactiveDimension.Font.Name = 'Tahoma'
        Styles.InactiveDimension.Font.Style = []
        Styles.InactiveDimension.GradientDirection = tgdHorizontal
        Styles.Measure.TextColor = clCaptionText
        Styles.Measure.FillColor = clGreen
        Styles.Measure.GradientColor = clMoneyGreen
        Styles.Measure.Font.Charset = DEFAULT_CHARSET
        Styles.Measure.Font.Color = clWindowText
        Styles.Measure.Font.Height = -11
        Styles.Measure.Font.Name = 'Tahoma'
        Styles.Measure.Font.Style = []
        Styles.Measure.GradientDirection = tgdHorizontal
        Styles.DataCellsTotals.TextColor = clBlack
        Styles.DataCellsTotals.FillColor = 15466495
        Styles.DataCellsTotals.GradientColor = clWhite
        Styles.DataCellsTotals.Font.Charset = DEFAULT_CHARSET
        Styles.DataCellsTotals.Font.Color = clWindowText
        Styles.DataCellsTotals.Font.Height = -11
        Styles.DataCellsTotals.Font.Name = 'Tahoma'
        Styles.DataCellsTotals.Font.Style = []
        Styles.FieldsItem.TextColor = clCaptionText
        Styles.FieldsItem.FillColor = clMoneyGreen
        Styles.FieldsItem.Font.Charset = DEFAULT_CHARSET
        Styles.FieldsItem.Font.Color = clWindowText
        Styles.FieldsItem.Font.Height = -11
        Styles.FieldsItem.Font.Name = 'Tahoma'
        Styles.FieldsItem.Font.Style = []
        TabOrder = 0
        XDimsZone.Visible = True
        YDimsZone.Visible = True
        PageDimsZone.Visible = True
        StatusZone.FloatFormat.DecSeparator = ','
        StatusZone.FloatFormat.FormatStr = '#0.##'
        StatusZone.FloatFormat.Kind = fkNumeric
        StatusZone.IntegerFormat.DecSeparator = ','
        StatusZone.IntegerFormat.FormatStr = '#0.##'
        StatusZone.IntegerFormat.Kind = fkNumeric
        FieldsZone.Visible = True
        ExplicitTop = 28
        ExplicitWidth = 1035
        ExplicitHeight = 421
      end
      object fcxSliceGridToolbar1: TfcxSliceGridToolbar
        Left = 0
        Top = 0
        Width = 836
        Height = 22
        AutoSize = True
        Caption = 'fcxSliceGridToolbar1'
        TabOrder = 1
        Version = '2.9'
        ExplicitTop = -6
        ExplicitWidth = 1035
      end
      object Panel4: TPanel
        Left = 0
        Top = 22
        Width = 836
        Height = 25
        Align = alTop
        TabOrder = 2
        ExplicitLeft = -1
        ExplicitTop = 16
        ExplicitWidth = 855
        object Button6: TButton
          Left = 1
          Top = 1
          Width = 97
          Height = 23
          Align = alLeft
          Caption = 'Load 2004 year'
          TabOrder = 0
          OnClick = Button6Click
          ExplicitLeft = -2
          ExplicitTop = -4
        end
        object Button7: TButton
          AlignWithMargins = True
          Left = 108
          Top = 1
          Width = 113
          Height = 23
          Margins.Left = 10
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Append 2005 year'
          TabOrder = 1
          ExplicitLeft = 111
          ExplicitTop = 2
          ExplicitHeight = 17
        end
        object Button8: TButton
          AlignWithMargins = True
          Left = 234
          Top = 1
          Width = 113
          Height = 23
          Margins.Left = 10
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Append 2006 year'
          TabOrder = 2
          ExplicitLeft = 280
          ExplicitTop = -6
          ExplicitHeight = 25
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 47
        Width = 836
        Height = 25
        Align = alTop
        TabOrder = 3
        ExplicitWidth = 855
        object Button3: TButton
          Left = 8
          Top = 0
          Width = 185
          Height = 25
          Caption = 'Load Orders with orderno < 1100'
          TabOrder = 0
        end
        object Button4: TButton
          Left = 208
          Top = 0
          Width = 273
          Height = 25
          Caption = 'Append Orders with orderno between 1100 and 1199'
          TabOrder = 1
        end
        object Button5: TButton
          Left = 496
          Top = 0
          Width = 201
          Height = 25
          Caption = 'Append Orders with orderno >= 1200'
          TabOrder = 2
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 72
        Width = 836
        Height = 25
        Align = alTop
        TabOrder = 4
        ExplicitWidth = 855
        object Button1: TButton
          Left = 8
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Load new'
          TabOrder = 0
        end
        object Button2: TButton
          Left = 96
          Top = 0
          Width = 137
          Height = 25
          Caption = 'Append to current cube'
          TabOrder = 1
        end
      end
    end
    object TabGrafico: TTabSheet
      Caption = 'Gr'#225'fico'
      ImageIndex = 1
      ExplicitWidth = 1035
    end
    object TabGridCube: TTabSheet
      Caption = 'Grid Cube'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitWidth = 1035
    end
  end
  object Tree: TTreeView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 190
    Height = 471
    Align = alLeft
    Indent = 19
    TabOrder = 1
  end
  object fcxXMLExport1: TfcxXMLExport
    Version = '2.9'
    Left = 972
    Top = 304
  end
  object fcxODSExport1: TfcxODSExport
    Version = '2.9'
    CreationTime = 0.000000000000000000
    Creator = 'FastReport'
    Language = 'en'
    Left = 972
    Top = 248
  end
  object fcxBIFFExport1: TfcxBIFFExport
    Version = '2.9'
    Left = 972
    Top = 200
  end
  object fcxHTMLExport1: TfcxHTMLExport
    Version = '2.9'
    HTMLFormat = hfHTML
    RepeatValues = False
    Left = 972
    Top = 152
  end
  object fcxDBFExport1: TfcxDBFExport
    Version = '2.9'
    Left = 972
    Top = 104
  end
  object fcxCSVExport1: TfcxCSVExport
    Version = '2.9'
    OEMCodepage = False
    UTF8 = False
    Separator = ';'
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 972
    Top = 56
  end
  object fcxXLSXExport1: TfcxXLSXExport
    Version = '2.9'
    ExportPageBreaks = False
    Creator = 'FastReport'
    Left = 972
    Top = 10
  end
  object FileOpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 520
    Top = 248
  end
  object TimerOpenFolder: TTimer
    Enabled = False
    OnTimer = TimerOpenFolderTimer
    Left = 776
    Top = 40
  end
end
