object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste Threads'
  ClientHeight = 576
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gauThread: TGauge
    Left = 32
    Top = 224
    Width = 433
    Height = 76
    ForeColor = clGreen
    MaxValue = 1000000000
    Progress = 0
  end
  object gauMain: TGauge
    Left = 32
    Top = 312
    Width = 433
    Height = 52
    ForeColor = clGreen
    MaxValue = 1000000000
    Progress = 0
  end
  object Label1: TLabel
    Left = 9
    Top = 256
    Width = 17
    Height = 13
    Caption = 'THr'
  end
  object Label2: TLabel
    Left = 8
    Top = 336
    Width = 22
    Height = 13
    Caption = 'Main'
  end
  object Label3: TLabel
    Left = 9
    Top = 402
    Width = 17
    Height = 13
    Caption = 'THr'
  end
  object Gauge1: TGauge
    Left = 32
    Top = 370
    Width = 433
    Height = 76
    ForeColor = clGreen
    MaxValue = 1000000000
    Progress = 0
  end
  object Label4: TLabel
    Left = 9
    Top = 484
    Width = 17
    Height = 13
    Caption = 'THr'
  end
  object Gauge2: TGauge
    Left = 32
    Top = 452
    Width = 433
    Height = 76
    ForeColor = clGreen
    MaxValue = 1000000000
    Progress = 0
  end
  object btnSleep: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Sleep'
    TabOrder = 0
    OnClick = btnSleepClick
  end
  object btnSleepThread: TButton
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Sleep Thread'
    TabOrder = 1
    OnClick = btnSleepThreadClick
  end
  object btnStart: TButton
    Left = 32
    Top = 193
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 2
    OnClick = btnStartClick
  end
end
