object frmRegrassao: TfrmRegrassao
  Left = 0
  Top = 0
  ActiveControl = ButtonGSL
  Caption = 'Regress'#227'o Linear'
  ClientHeight = 495
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 0
    Top = 360
    Width = 737
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -32
    ExplicitTop = 315
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 731
    Height = 41
    Align = alTop
    TabOrder = 0
    object ButtonGSL: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 173
      Height = 33
      Align = alLeft
      Caption = 'Regress'#227'o Via API Cient'#237'fica'
      TabOrder = 0
      OnClick = ButtonGSLClick
    end
    object ButtonResultados: TButton
      AlignWithMargins = True
      Left = 597
      Top = 4
      Width = 130
      Height = 33
      Align = alRight
      Caption = 'Resultados'
      TabOrder = 1
      OnClick = ButtonResultadosClick
    end
    object ButtonETL: TButton
      AlignWithMargins = True
      Left = 516
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'ETL'
      TabOrder = 2
      OnClick = ButtonETLClick
    end
    object ButtonNN: TButton
      AlignWithMargins = True
      Left = 183
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'NN'
      TabOrder = 3
      OnClick = ButtonNNClick
    end
  end
  object DBChart1: TDBChart
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 731
    Height = 307
    Title.Text.Strings = (
      'Regress'#227'o Linear-Polinomial')
    Align = alClient
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      12
      15
      12)
    ColorPaletteIndex = 13
    object Series2: TPointSeries
      DataSource = dmdDados.memDadosSaidaLinear
      Title = 'Proje'#231#245'es'
      ClickableLine = False
      Pointer.InflateMargins = True
      Pointer.Style = psCross
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'x'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'y'
    end
    object Series1: TLineSeries
      Marks.Callout.Length = 0
      DataSource = memDadosEntrada
      Title = 'Entradas'
      Brush.BackColor = clDefault
      ClickableLine = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'x'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'y'
    end
    object Series3: TLineSeries
      DataSource = dmdDados.qryCompras
      Title = 'Compras'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'total'
    end
    object Series4: TLineSeries
      DataSource = dmdDados.memDadosSaidaComprasLinear
      Title = 'Proj - Compras'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'x'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'y'
    end
  end
  object PanelDosDados: TPanel
    Left = 0
    Top = 454
    Width = 737
    Height = 41
    Align = alBottom
    TabOrder = 2
    object ButtonRegressaoCompras: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 133
      Height = 33
      Align = alLeft
      Caption = 'Regress'#227'o via Compras'
      TabOrder = 0
      OnClick = ButtonRegressaoComprasClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 363
    Width = 737
    Height = 91
    Align = alBottom
    TabOrder = 3
    object Splitter1: TSplitter
      Left = 593
      Top = 1
      Height = 89
      Align = alRight
      ExplicitLeft = 368
      ExplicitTop = -8
      ExplicitHeight = 100
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 586
      Height = 83
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object MemoLog: TMemo
      AlignWithMargins = True
      Left = 599
      Top = 4
      Width = 134
      Height = 83
      Align = alRight
      TabOrder = 1
    end
  end
  object memDadosEntrada: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 272
    Top = 120
    object memDadosEntradax: TFloatField
      FieldName = 'x'
    end
    object memDadosEntraday: TFloatField
      FieldName = 'y'
    end
  end
  object DataSource1: TDataSource
    DataSet = dmdDados.qryCompras
    Left = 480
    Top = 416
  end
end
