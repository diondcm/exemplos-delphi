object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Start'
  ClientHeight = 201
  ClientWidth = 705
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
    Left = 511
    Top = 97
    Height = 104
    Align = alRight
    ExplicitLeft = 517
    ExplicitTop = 20
    ExplicitHeight = 154
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 94
    Width = 705
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 47
    ExplicitWidth = 154
  end
  object PanelParametro: TPanel
    AlignWithMargins = True
    Left = 517
    Top = 100
    Width = 185
    Height = 98
    Align = alRight
    TabOrder = 0
    ExplicitTop = 53
    ExplicitHeight = 145
    object LabelParametroCotacao: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 13
      Align = alTop
      Caption = 'Valor da cota'#231#227'o'
      ExplicitWidth = 80
    end
    object EditParametroCotacao: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 23
      Width = 177
      Height = 21
      Align = alTop
      TabOrder = 0
      Text = '5,10'
      OnKeyDown = EditParametroCotacaoKeyDown
    end
  end
  object PanelConvercao: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 505
    Height = 98
    Align = alClient
    TabOrder = 1
    ExplicitTop = 53
    ExplicitHeight = 145
    object EditValorResultado: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 73
      Width = 497
      Height = 21
      Align = alBottom
      Color = clInactiveCaption
      TabOrder = 0
      TextHint = 'Resultado'
      ExplicitTop = 120
    end
    object PanelValorEntrada: TPanel
      Left = 1
      Top = 1
      Width = 503
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object EditValorMoeda: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 497
        Height = 23
        Align = alClient
        TabOrder = 0
        TextHint = 'Valor'
        ExplicitHeight = 21
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 30
      Width = 503
      Height = 41
      Align = alTop
      TabOrder = 2
      object ButtonRealParaDolar: TButton
        AlignWithMargins = True
        Left = 207
        Top = 4
        Width = 143
        Height = 33
        Align = alRight
        Caption = 'Real para D'#243'lar'
        TabOrder = 0
        OnClick = ButtonRealParaDolarClick
      end
      object ButtonDolarParaReal: TButton
        AlignWithMargins = True
        Left = 356
        Top = 4
        Width = 143
        Height = 33
        Align = alRight
        Caption = 'D'#243'lar para Real'
        TabOrder = 1
        OnClick = ButtonDolarParaRealClick
      end
    end
  end
  object PanelExibeValores: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 699
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitTop = 3
    object buttonCotacao: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 89
      Height = 33
      Align = alLeft
      Caption = 'Exibe cota'#231#227'o'
      TabOrder = 0
      OnClick = buttonCotacaoClick
    end
    object labelCotacao: TStaticText
      AlignWithMargins = True
      Left = 99
      Top = 16
      Width = 44
      Height = 21
      Margins.Top = 15
      Align = alLeft
      Caption = 'Cota'#231#227'o'
      TabOrder = 1
    end
    object ButtonHistorico: TButton
      AlignWithMargins = True
      Left = 620
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Hist'#243'rico'
      TabOrder = 2
      OnClick = ButtonHistoricoClick
    end
  end
  object PanelStyle: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 699
    Height = 41
    Align = alTop
    TabOrder = 3
    ExplicitTop = -22
    ExplicitWidth = 705
    object LabelStyles: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 53
      Height = 33
      Align = alLeft
      Caption = 'Style'
      Layout = tlCenter
    end
    object ComboBoxStyle: TComboBox
      AlignWithMargins = True
      Left = 63
      Top = 9
      Width = 202
      Height = 21
      Margins.Top = 8
      Align = alLeft
      Style = csDropDownList
      TabOrder = 0
      OnChange = ComboBoxStyleChange
      ExplicitLeft = 87
      ExplicitTop = 11
    end
  end
  object TimerAtualizaCotacao: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TimerAtualizaCotacaoTimer
    Left = 392
    Top = 96
  end
end
