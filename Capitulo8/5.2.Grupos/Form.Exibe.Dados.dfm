object frmExibeDados: TfrmExibeDados
  Left = 0
  Top = 0
  Caption = 'Dados'
  ClientHeight = 389
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 290
    Width = 671
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 68
    ExplicitWidth = 225
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 665
    Height = 216
    Align = alClient
    DataSource = dtsDados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 665
    Height = 62
    DataSource = dtsDados
    Align = alTop
    TabOrder = 1
  end
  object PanelDetalhes: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 296
    Width = 665
    Height = 90
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 293
    object DBGrid2: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 657
      Height = 82
      Align = alClient
      DataSource = dtsDetalhes
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dtsDados: TDataSource
    Left = 568
    Top = 112
  end
  object dtsDetalhes: TDataSource
    Left = 568
    Top = 312
  end
end
