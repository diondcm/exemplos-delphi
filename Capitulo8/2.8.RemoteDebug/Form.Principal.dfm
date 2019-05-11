object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Remote Debug'
  ClientHeight = 385
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonTesteDebug: TButton
    Left = 8
    Top = 8
    Width = 137
    Height = 57
    Caption = 'Teste debug'
    TabOrder = 0
    OnClick = ButtonTesteDebugClick
  end
  object ButtonZip: TButton
    Left = 379
    Top = 104
    Width = 137
    Height = 57
    Caption = 'Zippa FIles'
    TabOrder = 1
    OnClick = ButtonZipClick
  end
  object Button2: TButton
    Left = 16
    Top = 119
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 16
    Top = 150
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
  end
  object ButtonExtract: TButton
    Left = 379
    Top = 167
    Width = 137
    Height = 57
    Caption = 'Extract FIles'
    TabOrder = 4
    OnClick = ButtonExtractClick
  end
end
