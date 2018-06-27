object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Classes e LookUps'
  ClientHeight = 324
  ClientWidth = 471
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
  object buttonClasses: TButton
    Left = 248
    Top = 40
    Width = 145
    Height = 89
    Caption = 'Classes'
    TabOrder = 0
    OnClick = buttonClassesClick
  end
  object buttonLookup: TButton
    Left = 40
    Top = 40
    Width = 145
    Height = 89
    Caption = 'LookUp'
    TabOrder = 1
  end
end
