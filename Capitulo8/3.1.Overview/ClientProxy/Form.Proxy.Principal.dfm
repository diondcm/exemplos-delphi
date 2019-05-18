object frmProxyPrincipal: TfrmProxyPrincipal
  Left = 0
  Top = 0
  Caption = 'Client Proxy'
  ClientHeight = 410
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MemoTexto: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 64
    Width = 789
    Height = 343
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitWidth = 508
  end
  object ButtonGet: TButton
    Left = 8
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get'
    TabOrder = 1
    OnClick = ButtonGetClick
  end
  object Button1: TButton
    Left = 159
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get Data'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 310
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get Version'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 461
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get Valor'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 612
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get Obj'
    TabOrder = 5
    OnClick = Button4Click
  end
end
