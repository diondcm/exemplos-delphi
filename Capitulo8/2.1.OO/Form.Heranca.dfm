object frmHeranca: TfrmHeranca
  Left = 0
  Top = 0
  Caption = 'Heran'#231'a'
  ClientHeight = 380
  ClientWidth = 592
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
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 56
    Width = 121
    Height = 33
    Caption = 'Heran'#231'a'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 404
    Top = 3
    Width = 185
    Height = 374
    Align = alRight
    Color = clScrollBar
    TabOrder = 0
    ExplicitLeft = 216
    ExplicitTop = 168
    ExplicitHeight = 89
  end
  object ButtonClassMethods: TButton
    Left = 8
    Top = 112
    Width = 121
    Height = 33
    Caption = 'Class Methods'
    TabOrder = 1
    OnClick = ButtonClassMethodsClick
  end
end
