object frmThreads: TfrmThreads
  Left = 0
  Top = 0
  Caption = 'Teste Threads'
  ClientHeight = 573
  ClientWidth = 1247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    1247
    573)
  PixelsPerInch = 96
  TextHeight = 13
  object gaugeProcesso1: TGauge
    Left = 24
    Top = 72
    Width = 1149
    Height = 86
    Anchors = [akLeft, akTop, akRight]
    ForeColor = clGreen
    Progress = 0
    ExplicitWidth = 1193
  end
  object gaugeProcesso2: TGauge
    Left = 24
    Top = 168
    Width = 1149
    Height = 86
    Anchors = [akLeft, akTop, akRight]
    ForeColor = clGreen
    Progress = 0
    ExplicitWidth = 1193
  end
  object gaugeProcesso3: TGauge
    Left = 24
    Top = 264
    Width = 1149
    Height = 86
    Anchors = [akLeft, akTop, akRight]
    ForeColor = clGreen
    Progress = 0
    ExplicitWidth = 1193
  end
  object gaugeProcesso4: TGauge
    Left = 24
    Top = 360
    Width = 1149
    Height = 86
    Anchors = [akLeft, akTop, akRight]
    ForeColor = clGreen
    Progress = 0
    ExplicitWidth = 1193
  end
  object gaugeProcesso5: TGauge
    Left = 24
    Top = 459
    Width = 1149
    Height = 86
    Anchors = [akLeft, akTop, akRight]
    ForeColor = clGreen
    Progress = 0
    ExplicitWidth = 1193
  end
  object buttonStart: TButton
    Left = 24
    Top = 8
    Width = 105
    Height = 49
    Caption = 'Start'
    TabOrder = 0
    OnClick = buttonStartClick
  end
end
