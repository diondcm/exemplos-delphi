object frmMensagens: TfrmMensagens
  Left = 0
  Top = 0
  Caption = 'Mensagens'
  ClientHeight = 299
  ClientWidth = 635
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
    Left = 354
    Top = 0
    Height = 299
    Align = alRight
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitHeight = 100
  end
  object listBoxJanelas: TListBox
    AlignWithMargins = True
    Left = 360
    Top = 10
    Width = 265
    Height = 279
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alRight
    ItemHeight = 13
    TabOrder = 0
    ExplicitLeft = 357
    ExplicitTop = 5
  end
  object FlowPanel: TFlowPanel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 341
    Height = 279
    Margins.Left = 10
    Margins.Top = 10
    Margins.Bottom = 10
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 13
    ExplicitTop = 5
    object buttonGetHandle: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Get Handle'
      TabOrder = 0
      OnClick = buttonGetHandleClick
    end
    object checkAtivarCaptura: TCheckBox
      Left = 76
      Top = 1
      Width = 97
      Height = 17
      Caption = 'Ativar Captura'
      TabOrder = 1
    end
  end
  object timerCaptura: TTimer
    Enabled = False
    Interval = 3000
    Left = 216
    Top = 8
  end
end
