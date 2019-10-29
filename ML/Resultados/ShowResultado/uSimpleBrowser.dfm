object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Resultados'
  ClientHeight = 624
  ClientWidth = 1038
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ChromiumWindow1: TChromiumWindow
    Left = 0
    Top = 0
    Width = 1038
    Height = 624
    Align = alClient
    TabStop = True
    TabOrder = 0
    OnClose = ChromiumWindow1Close
    OnBeforeClose = ChromiumWindow1BeforeClose
    ExplicitTop = 30
    ExplicitHeight = 594
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 56
    Top = 88
  end
  object CEFSentinel1: TCEFSentinel
    OnClose = CEFSentinel1Close
    Left = 56
    Top = 160
  end
  object TimerOpen: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerOpenTimer
    Left = 512
    Top = 320
  end
end
