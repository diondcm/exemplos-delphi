object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 560
  ClientWidth = 1176
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object buttonSingleRandom: TButton
    Left = 16
    Top = 168
    Width = 137
    Height = 49
    Caption = 'buttonSingleRandom'
    TabOrder = 0
    OnClick = buttonSingleRandomClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 368
    Width = 1176
    Height = 192
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object editRange: TEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '1000000'
    TextHint = 'Informe o Range'
  end
  object editLoops: TEdit
    Left = 16
    Top = 59
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '10000'
    TextHint = 'N'#250'mero de Loops'
  end
  object buttomMultiRandom: TButton
    Left = 184
    Top = 168
    Width = 137
    Height = 49
    Caption = 'buttomMultiRandom'
    TabOrder = 4
    OnClick = buttomMultiRandomClick
  end
  object Button1: TButton
    Left = 392
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Thr'
    TabOrder = 5
    OnClick = Button1Click
  end
end
