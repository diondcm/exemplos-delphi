object frmPalavras: TfrmPalavras
  Left = 0
  Top = 0
  Caption = 'Palavras'
  ClientHeight = 490
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 32
    Width = 75
    Height = 25
    Caption = '&&Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 568
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 657
    Top = 3
    Width = 185
    Height = 484
    Align = alRight
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    ExplicitLeft = 652
    ExplicitTop = -2
  end
  object buttonInterface: TButton
    Left = 80
    Top = 200
    Width = 161
    Height = 73
    Caption = 'buttonInterface'
    TabOrder = 4
    OnClick = buttonInterfaceClick
  end
end
