object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste Class of'
  ClientHeight = 334
  ClientWidth = 660
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
  object buttonHotel: TButton
    Left = 32
    Top = 24
    Width = 137
    Height = 49
    Caption = 'Hotel Convencional'
    TabOrder = 0
    OnClick = buttonHotelClick
  end
  object memo: TMemo
    Left = 475
    Top = 0
    Width = 185
    Height = 334
    Align = alRight
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object button3Estrelas: TButton
    Left = 32
    Top = 79
    Width = 137
    Height = 50
    Caption = 'Hotel 3 Estrelas'
    TabOrder = 2
    OnClick = button3EstrelasClick
  end
  object button4Estrelas: TButton
    Left = 32
    Top = 135
    Width = 137
    Height = 50
    Caption = 'Hotel 4 Estrelas'
    TabOrder = 3
    OnClick = button4EstrelasClick
  end
  object button5Estrelas: TButton
    Left = 32
    Top = 191
    Width = 137
    Height = 50
    Caption = 'Hotel 5 Estrelas'
    TabOrder = 4
    OnClick = button5EstrelasClick
  end
  object comboHotel: TComboBox
    Left = 32
    Top = 280
    Width = 177
    Height = 21
    Style = csDropDownList
    TabOrder = 5
    OnCloseUp = comboHotelCloseUp
  end
  object Button1: TButton
    Left = 280
    Top = 91
    Width = 145
    Height = 78
    Caption = 'Button1'
    TabOrder = 6
    OnClick = Button1Click
  end
end
