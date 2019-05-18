object frmPrincipalJson: TfrmPrincipalJson
  Left = 0
  Top = 0
  Caption = 'JSON Test'
  ClientHeight = 404
  ClientWidth = 596
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
    Left = 8
    Top = 8
    Width = 201
    Height = 57
    Caption = 'To Json'
    TabOrder = 0
    OnClick = Button1Click
  end
  object MemoJson: TMemo
    Left = 8
    Top = 112
    Width = 201
    Height = 284
    TabOrder = 1
  end
  object Button2: TButton
    Left = 387
    Top = 8
    Width = 201
    Height = 57
    Caption = 'To Obj'
    TabOrder = 2
    OnClick = Button2Click
  end
  object MemoObj: TMemo
    Left = 387
    Top = 112
    Width = 201
    Height = 284
    TabOrder = 3
  end
end
