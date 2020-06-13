object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'OO'
  ClientHeight = 380
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 544
    Top = 47
    Height = 333
    Align = alRight
    ExplicitLeft = 550
    ExplicitTop = 39
  end
  object PanelCotacao: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 839
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 738
    object ButtonCotacao: TButton
      AlignWithMargins = True
      Left = 741
      Top = 4
      Width = 94
      Height = 33
      Align = alRight
      Caption = 'Gera Cotacao'
      TabOrder = 0
      OnClick = ButtonCotacaoClick
      ExplicitLeft = 640
    end
    object ButtonLoad: TButton
      AlignWithMargins = True
      Left = 637
      Top = 4
      Width = 98
      Height = 33
      Align = alRight
      Caption = 'Carrega Cota'#231#227'o'
      TabOrder = 1
      OnClick = ButtonLoadClick
      ExplicitLeft = 536
    end
    object EditAcao: TEdit
      Left = 8
      Top = 10
      Width = 137
      Height = 21
      TabOrder = 2
      TextHint = 'Informe a sigla da A'#231#227'o'
      OnKeyDown = EditAcaoKeyDown
    end
    object ComboAcoes: TComboBox
      Left = 151
      Top = 10
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnClick = ComboAcoesClick
    end
  end
  object DBChart1: TDBChart
    Left = 0
    Top = 47
    Width = 544
    Height = 333
    Title.Text.Strings = (
      'TDBChart')
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 610
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      DataSource = memAcao1
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'data'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'valor'
    end
    object Series2: TLineSeries
      DataSource = memAcao2
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'data'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'valor'
    end
    object Series3: TLineSeries
      DataSource = memAcao3
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'data'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'valor'
    end
    object Series4: TLineSeries
      DataSource = memAcao4
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'data'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'valor'
    end
    object Series5: TLineSeries
      DataSource = memAcao5
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'data'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'valor'
    end
  end
  object PanelLateral: TPanel
    Left = 547
    Top = 47
    Width = 298
    Height = 333
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 544
    object MemoLog: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 169
      Width = 290
      Height = 160
      Align = alClient
      TabOrder = 0
      ExplicitTop = 172
      ExplicitHeight = 157
    end
    inline fraAcao1: TfraAcao
      Left = 1
      Top = 1
      Width = 296
      Height = 165
      Align = alTop
      TabOrder = 1
      ExplicitLeft = -31
      ExplicitTop = 3
      ExplicitWidth = 296
      inherited LabelEmpresa: TLabel
        Width = 290
        ExplicitLeft = -53
        ExplicitTop = 113
        ExplicitWidth = 290
      end
    end
  end
  object memAcao1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 488
    Top = 232
    object memAcao1valor: TCurrencyField
      FieldName = 'valor'
    end
    object memAcao1data: TDateTimeField
      FieldName = 'data'
    end
  end
  object TimerTeste: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TimerTesteTimer
    Left = 424
    Top = 192
  end
  object memAcao3: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 616
    Top = 232
    object memAcao3valor: TCurrencyField
      FieldName = 'valor'
    end
    object memAcao3data: TDateTimeField
      FieldName = 'data'
    end
  end
  object memAcao4: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 680
    Top = 232
    object memAcao4valor: TCurrencyField
      FieldName = 'valor'
    end
    object memAcao4data: TDateTimeField
      FieldName = 'data'
    end
  end
  object memAcao5: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 736
    Top = 232
    object memAcao5valor: TCurrencyField
      FieldName = 'valor'
    end
    object memAcao5data: TDateTimeField
      FieldName = 'data'
    end
  end
  object memAcao2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 552
    Top = 232
    object memAcao2valor: TCurrencyField
      FieldName = 'valor'
    end
    object memAcao2data: TDateTimeField
      FieldName = 'data'
    end
  end
end
