object frmWinClasses: TfrmWinClasses
  Left = 0
  Top = 0
  Caption = 'Classes'
  ClientHeight = 455
  ClientWidth = 408
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
  object checkAtivo: TCheckBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 402
    Height = 17
    Align = alTop
    Caption = 'Capturar'
    TabOrder = 0
    OnClick = checkAtivoClick
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 97
  end
  object buttonClose: TButton
    Left = 35
    Top = 104
    Width = 121
    Height = 57
    Caption = 'Close NotePad'
    TabOrder = 1
    OnClick = buttonCloseClick
  end
  object panelList: TPanel
    AlignWithMargins = True
    Left = 202
    Top = 26
    Width = 203
    Height = 426
    Align = alRight
    BevelOuter = bvNone
    Caption = 'panelList'
    ShowCaption = False
    TabOrder = 2
    ExplicitLeft = 184
    ExplicitTop = 72
    ExplicitHeight = 263
    object labelCaption: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 197
      Height = 19
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 11
      ExplicitTop = 0
    end
    object labelClass: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 28
      Width = 197
      Height = 19
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 5
    end
    object listHandles: TListBox
      AlignWithMargins = True
      Left = 3
      Top = 53
      Width = 197
      Height = 370
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnClick = listHandlesClick
      ExplicitLeft = 78
      ExplicitTop = 0
      ExplicitWidth = 121
      ExplicitHeight = 255
    end
  end
  object buttonSimulaKey: TButton
    Left = 35
    Top = 167
    Width = 121
    Height = 58
    Caption = 'Simula Key'
    TabOrder = 3
    OnClick = buttonSimulaKeyClick
  end
  object editTexto: TEdit
    Left = 3
    Top = 26
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object buttonParent: TButton
    Left = 35
    Top = 231
    Width = 121
    Height = 50
    Caption = 'Parent'
    TabOrder = 5
    OnClick = buttonParentClick
  end
  object timerCaptura: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = timerCapturaTimer
    Left = 64
    Top = 40
  end
end
