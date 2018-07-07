object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 275
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 240
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 16
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 16
    Top = 184
  end
end
