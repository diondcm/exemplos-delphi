object frmThreads: TfrmThreads
  Left = 0
  Top = 0
  Caption = 'Threads'
  ClientHeight = 474
  ClientWidth = 509
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
  object Gauge1: TGauge
    Left = 8
    Top = 48
    Width = 493
    Height = 65
    ForeColor = clLime
    Progress = 20
  end
  object Gauge2: TGauge
    Left = 8
    Top = 136
    Width = 493
    Height = 65
    ForeColor = clLime
    Progress = 20
  end
  object Gauge3: TGauge
    Left = 8
    Top = 224
    Width = 493
    Height = 65
    ForeColor = clLime
    Progress = 20
  end
  object Gauge4: TGauge
    Left = 8
    Top = 310
    Width = 493
    Height = 65
    ForeColor = clLime
    Progress = 20
  end
  object Gauge5: TGauge
    Left = 8
    Top = 392
    Width = 493
    Height = 65
    ForeColor = clLime
    Progress = 20
  end
  object buttonStart: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = buttonStartClick
  end
end
