object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplo'
  ClientHeight = 434
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnExemplos: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exemplos'
    TabOrder = 0
    OnClick = btnExemplosClick
  end
  object lbeCalculaDobro: TLabeledEdit
    Left = 24
    Top = 136
    Width = 121
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'Calcula Dorbo'
    TabOrder = 1
  end
  object btnCalculaDobro: TButton
    Left = 24
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Calcula Dobro'
    TabOrder = 2
    OnClick = btnCalculaDobroClick
  end
  object memLog: TMemo
    Left = 378
    Top = 0
    Width = 185
    Height = 434
    Align = alRight
    TabOrder = 3
    ExplicitLeft = 272
    ExplicitTop = 56
    ExplicitHeight = 89
  end
end
