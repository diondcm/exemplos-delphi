object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Messages'
  ClientHeight = 408
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 236
    Top = 64
    Height = 344
    ExplicitLeft = 288
    ExplicitTop = 176
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 750
    Height = 58
    Align = alTop
    TabOrder = 0
    object CheckBoxBusca: TCheckBox
      Left = 8
      Top = 7
      Width = 97
      Height = 17
      Caption = 'Ativar Busca'
      TabOrder = 0
      OnClick = CheckBoxBuscaClick
    end
    object Panel2: TPanel
      Left = 528
      Top = 1
      Width = 221
      Height = 56
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object EditCaption: TEdit
        Left = 7
        Top = 1
        Width = 202
        Height = 21
        Color = clInfoBk
        TabOrder = 0
        Text = 'Sem t'#237'tulo - Paint'
      end
      object ButtonGetHandle: TButton
        Left = 7
        Top = 26
        Width = 75
        Height = 25
        Caption = 'Get Handle'
        TabOrder = 1
        OnClick = ButtonGetHandleClick
      end
      object EditHandle: TEdit
        Left = 88
        Top = 28
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
    object ButtonWinForm: TButton
      Left = 224
      Top = 11
      Width = 113
      Height = 38
      Caption = 'Win Form'
      TabOrder = 2
      OnClick = ButtonWinFormClick
    end
    object ButtonHost: TButton
      Left = 343
      Top = 11
      Width = 113
      Height = 38
      Caption = 'Host'
      TabOrder = 3
      OnClick = ButtonHostClick
    end
  end
  object ListBoxJanelas: TListBox
    AlignWithMargins = True
    Left = 3
    Top = 67
    Width = 230
    Height = 338
    Align = alLeft
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListBoxJanelasClick
  end
  object FlowPanel1: TFlowPanel
    Left = 239
    Top = 64
    Width = 517
    Height = 344
    Align = alClient
    TabOrder = 2
    object ButtonClose: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 120
      Height = 42
      Caption = 'Close'
      TabOrder = 0
      OnClick = ButtonCloseClick
    end
    object ButtonClick: TButton
      AlignWithMargins = True
      Left = 130
      Top = 4
      Width = 120
      Height = 42
      Align = alTop
      Caption = 'Click'
      TabOrder = 1
      OnClick = ButtonClickClick
    end
    object ButtonSetText: TButton
      AlignWithMargins = True
      Left = 256
      Top = 4
      Width = 120
      Height = 42
      Align = alTop
      Caption = 'Set Text'
      TabOrder = 2
      OnClick = ButtonSetTextClick
    end
    object ButtonAviso: TButton
      AlignWithMargins = True
      Left = 382
      Top = 4
      Width = 120
      Height = 42
      Align = alTop
      Caption = 'Aviso - Custom'
      TabOrder = 3
      OnClick = ButtonAvisoClick
    end
    object ButtonPostMessage: TButton
      AlignWithMargins = True
      Left = 4
      Top = 52
      Width = 120
      Height = 42
      Align = alTop
      Caption = 'Aviso - Post'
      TabOrder = 4
      OnClick = ButtonPostMessageClick
    end
    object ButtonookWndProc: TButton
      AlignWithMargins = True
      Left = 130
      Top = 52
      Width = 120
      Height = 42
      Align = alTop
      Caption = 'Wnd - Proc'
      TabOrder = 5
      OnClick = ButtonookWndProcClick
    end
    object ButtonUnHookWndProc: TButton
      AlignWithMargins = True
      Left = 256
      Top = 52
      Width = 120
      Height = 42
      Align = alTop
      Caption = 'UnHook WndProc'
      TabOrder = 6
      OnClick = ButtonUnHookWndProcClick
    end
    object ButtonPerform: TButton
      AlignWithMargins = True
      Left = 382
      Top = 52
      Width = 120
      Height = 42
      Align = alTop
      Caption = 'Perform'
      TabOrder = 7
      OnClick = ButtonPerformClick
    end
    object ButtonSetParent: TButton
      AlignWithMargins = True
      Left = 4
      Top = 100
      Width = 120
      Height = 42
      Align = alTop
      Caption = 'Set Parent'
      TabOrder = 8
      OnClick = ButtonSetParentClick
    end
  end
  object TimerBusca: TTimer
    Enabled = False
    Interval = 3500
    OnTimer = TimerBuscaTimer
    Left = 264
    Top = 104
  end
  object TimerAviso: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TimerAvisoTimer
    Left = 400
    Top = 272
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 664
    Top = 272
  end
end
