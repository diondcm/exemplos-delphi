object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'C'#243'digos & Din'#226'mico'
  ClientHeight = 501
  ClientWidth = 989
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
    Top = 73
    Width = 989
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = 8
    ExplicitTop = 49
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 378
    Width = 989
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 196
    ExplicitWidth = 185
  end
  object Splitter3: TSplitter
    Left = 0
    Top = 196
    Width = 989
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 182
  end
  object panelControles: TFlowPanel
    Left = 0
    Top = 0
    Width = 989
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object buttonListaCodigos: TButton
      Left = 0
      Top = 0
      Width = 137
      Height = 57
      Caption = 'Lista C'#243'digos'
      TabOrder = 0
      OnClick = buttonListaCodigosClick
    end
    object buttonImpressao: TButton
      Left = 137
      Top = 0
      Width = 128
      Height = 57
      Caption = 'Impress'#227'o'
      TabOrder = 1
      OnClick = buttonImpressaoClick
    end
    object buttonCarregarRelatorio: TButton
      Left = 265
      Top = 0
      Width = 136
      Height = 57
      Caption = 'Carregar Rel.'
      TabOrder = 2
      OnClick = buttonCarregarRelatorioClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 76
    Width = 989
    Height = 120
    Align = alTop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 199
    Width = 989
    Height = 179
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 381
    Width = 989
    Height = 120
    Align = alBottom
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
