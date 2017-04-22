object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Hotel'
  ClientHeight = 377
  ClientWidth = 363
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
  object memLog: TMemo
    Left = 178
    Top = 0
    Width = 185
    Height = 377
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 168
    ExplicitHeight = 89
  end
  object btnHotel: TButton
    Left = 8
    Top = 24
    Width = 97
    Height = 25
    Caption = 'Hotel'
    TabOrder = 1
    OnClick = btnHotelClick
  end
  object btnHotel3: TButton
    Left = 8
    Top = 55
    Width = 97
    Height = 25
    Caption = 'Hotel 3 estrelas'
    TabOrder = 2
    OnClick = btnHotel3Click
  end
  object btnHotel4: TButton
    Left = 8
    Top = 86
    Width = 97
    Height = 25
    Caption = 'Hotel 4 estrelas'
    TabOrder = 3
    OnClick = btnHotel4Click
  end
  object btnHotel5: TButton
    Left = 8
    Top = 117
    Width = 97
    Height = 25
    Caption = 'Hotel 5 estrelas'
    TabOrder = 4
    OnClick = btnHotel5Click
  end
  object btnClassMethod: TButton
    Left = 8
    Top = 344
    Width = 97
    Height = 25
    Caption = 'Class Method'
    TabOrder = 5
    OnClick = btnClassMethodClick
  end
  object cmbClasse: TComboBox
    Left = 8
    Top = 317
    Width = 105
    Height = 21
    Style = csDropDownList
    TabOrder = 6
  end
end
