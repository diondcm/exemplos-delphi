object frmPrincipalMensagens: TfrmPrincipalMensagens
  Left = 0
  Top = 0
  Caption = 'Windows Messages'
  ClientHeight = 410
  ClientWidth = 593
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
    Left = 191
    Top = 164
    Height = 246
    ExplicitLeft = 304
    ExplicitTop = 176
    ExplicitHeight = 100
  end
  object PanelHandles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 167
    Width = 185
    Height = 240
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 136
    ExplicitHeight = 41
    object CheckBoxBusca: TCheckBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 17
      Align = alTop
      Caption = 'Ativar Busca'
      TabOrder = 0
      OnClick = CheckBoxBuscaClick
      ExplicitLeft = 8
      ExplicitTop = 7
      ExplicitWidth = 97
    end
    object ListBoxHandles: TListBox
      Left = 1
      Top = 24
      Width = 183
      Height = 215
      Align = alClient
      ItemHeight = 13
      TabOrder = 1
      OnClick = ListBoxHandlesClick
      ExplicitLeft = 32
      ExplicitTop = 120
      ExplicitWidth = 121
      ExplicitHeight = 97
    end
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 587
    Height = 158
    Align = alTop
    TabOrder = 1
    object ButtonSendClick: TButton
      Left = 4
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Click'
      TabOrder = 0
      OnClick = ButtonSendClickClick
    end
    object ButtonAviso: TButton
      Left = 488
      Top = 7
      Width = 91
      Height = 25
      Caption = 'Aviso'
      TabOrder = 1
      OnClick = ButtonAvisoClick
    end
    object EditHandle: TEdit
      Left = 4
      Top = 38
      Width = 177
      Height = 21
      TabOrder = 2
    end
    object ButtonSendText: TButton
      Left = 85
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Send Text'
      TabOrder = 3
      OnClick = ButtonSendTextClick
    end
    object ButtonClose: TButton
      Left = 166
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 4
      OnClick = ButtonCloseClick
    end
    object ButtonNotificacao: TButton
      Left = 187
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Notifica'#231#227'o'
      TabOrder = 5
      OnClick = ButtonNotificacaoClick
    end
    object ButtonShake: TButton
      Left = 247
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Shake'
      TabOrder = 6
      OnClick = ButtonShakeClick
    end
    object ButtonSetParent: TButton
      Left = 328
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Set Parent'
      TabOrder = 7
      OnClick = ButtonSetParentClick
    end
    object ButtonWinClass: TButton
      Left = 352
      Top = 100
      Width = 91
      Height = 25
      Caption = 'WinClass'
      TabOrder = 8
      OnClick = ButtonWinClassClick
    end
    object Button1: TButton
      Left = 268
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 9
      OnClick = Button1Click
    end
    object ButtonCustomAviso: TButton
      Left = 488
      Top = 38
      Width = 91
      Height = 25
      Caption = 'Aviso Custom'
      TabOrder = 10
      OnClick = ButtonCustomAvisoClick
    end
    object Button2: TButton
      Left = 488
      Top = 69
      Width = 91
      Height = 25
      Caption = 'Aviso Custom'
      TabOrder = 11
      OnClick = Button2Click
    end
    object ButtonPerform: TButton
      Left = 488
      Top = 100
      Width = 91
      Height = 25
      Caption = 'Perform Aviso'
      TabOrder = 12
      OnClick = ButtonPerformClick
    end
  end
  object PanelComps: TPanel
    AlignWithMargins = True
    Left = 197
    Top = 167
    Width = 393
    Height = 240
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 296
    ExplicitTop = 208
    ExplicitWidth = 233
    ExplicitHeight = 121
  end
  object TimerBusca: TTimer
    Enabled = False
    Interval = 3500
    OnTimer = TimerBuscaTimer
    Left = 72
    Top = 128
  end
  object TimerAviso: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerAvisoTimer
    Left = 72
    Top = 184
  end
end
