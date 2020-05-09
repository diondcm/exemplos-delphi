object frmPincipal: TfrmPincipal
  Left = 0
  Top = 0
  Caption = 'RTTI & Attributos'
  ClientHeight = 457
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseEnter = FormMouseEnter
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonGeraSQL: TButton
    Left = 16
    Top = 35
    Width = 145
    Height = 57
    Caption = 'Gerar SQL'
    TabOrder = 0
    OnClick = ButtonGeraSQLClick
  end
  object Button1: TButton
    Left = 16
    Top = 98
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ComboBoxSelClasse: TComboBox
    Left = 16
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      'Pessoa'
      'Cidade')
  end
  object Button2: TButton
    Left = 16
    Top = 160
    Width = 145
    Height = 57
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 332
    Top = 3
    Width = 247
    Height = 451
    Align = alRight
    Color = 14678008
    Lines.Strings = (
      'MemoLog')
    TabOrder = 4
  end
end
