object frmThreads: TfrmThreads
  Left = 0
  Top = 0
  Caption = 'Threads'
  ClientHeight = 474
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
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
  object buttonStrToInt: TButton
    Left = 89
    Top = 8
    Width = 112
    Height = 25
    Caption = 'Str To Int'
    TabOrder = 1
    OnClick = buttonStrToIntClick
  end
  object buttonStrToIntExcept: TButton
    Left = 207
    Top = 8
    Width = 106
    Height = 25
    Caption = 'Str To Int Except'
    TabOrder = 2
    OnClick = buttonStrToIntExceptClick
  end
  object memoLog: TMemo
    Left = 507
    Top = 48
    Width = 185
    Height = 409
    TabOrder = 3
  end
  object Button1: TButton
    Left = 319
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
end
