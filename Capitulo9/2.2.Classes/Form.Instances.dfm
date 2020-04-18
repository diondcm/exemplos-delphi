object frmInstance: TfrmInstance
  Left = 0
  Top = 0
  Caption = 'Inst'#226'ncias'
  ClientHeight = 321
  ClientWidth = 584
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
    Left = 16
    Top = 16
    Width = 121
    Height = 49
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 160
    Width = 578
    Height = 158
    Align = alBottom
    Lines.Strings = (
      'MemoLog')
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 304
    Top = 16
    Width = 257
    Height = 113
    Caption = 'Panel1'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 16
    Top = 71
    Width = 121
    Height = 50
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 143
    Top = 49
    Width = 121
    Height = 50
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button3Click
  end
  object CheckBoxGeraErro: TCheckBox
    Left = 143
    Top = 112
    Width = 97
    Height = 17
    Caption = 'Gerar Erro'
    TabOrder = 5
  end
  object Button4: TButton
    Left = 255
    Top = 96
    Width = 121
    Height = 50
    Caption = 'Button2'
    TabOrder = 6
    OnClick = Button4Click
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 168
    Top = 200
  end
end
