object frmCidades: TfrmCidades
  Left = 0
  Top = 0
  Caption = 'Cidades'
  ClientHeight = 316
  ClientWidth = 560
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
    Top = 175
    Width = 560
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 76
    ExplicitWidth = 121
  end
  object panelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 554
    Height = 70
    Align = alTop
    TabOrder = 0
    object buttonBaixarCidades: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 137
      Height = 62
      Align = alLeft
      Caption = 'Baixar Cidades'
      TabOrder = 0
      OnClick = buttonBaixarCidadesClick
      ExplicitLeft = 224
      ExplicitTop = -32
      ExplicitHeight = 73
    end
  end
  object gridDados: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 554
    Height = 93
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object memoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 181
    Width = 554
    Height = 113
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -2
    ExplicitTop = 203
  end
  object status: TStatusBar
    Left = 0
    Top = 297
    Width = 560
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 200
      end>
    ExplicitLeft = -8
    ExplicitTop = 306
  end
  object timerExecute: TTimer
    Enabled = False
    OnTimer = timerExecuteTimer
    Left = 504
    Top = 64
  end
end
