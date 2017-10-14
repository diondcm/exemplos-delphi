object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Classes e Objetos'
  ClientHeight = 263
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object buttonCriaObjetos: TButton
    Left = 16
    Top = 16
    Width = 113
    Height = 49
    Caption = 'Criar Objetos'
    TabOrder = 0
    OnClick = buttonCriaObjetosClick
  end
  object memoPropriedades: TMemo
    Left = 312
    Top = 0
    Width = 323
    Height = 263
    Align = alRight
    TabOrder = 1
  end
  object Button1: TButton
    Left = 16
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 111
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 104
    Top = 113
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '90'
  end
end
