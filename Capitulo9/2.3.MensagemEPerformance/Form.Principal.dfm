object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Mensagens & Performance'
  ClientHeight = 201
  ClientWidth = 447
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
  object Button1: TButton
    Left = 40
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Aviso'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Confirma'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 296
    Top = 40
    Width = 75
    Height = 25
    Caption = 'StopWhatch'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 296
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Performance'
    TabOrder = 3
    OnClick = Button4Click
  end
end
