object frmExemplo: TfrmExemplo
  Left = 0
  Top = 0
  Caption = 'Projeto Teste'
  ClientHeight = 363
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 574
    Height = 357
    Align = alClient
    Stretch = True
    ExplicitLeft = 8
    ExplicitTop = -2
  end
  object buttonTest: TButton
    Left = 387
    Top = 274
    Width = 185
    Height = 81
    Caption = 'buttonTest'
    TabOrder = 0
    OnClick = buttonTestClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 334
    Width = 373
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object OpenDialog1: TOpenDialog
    Left = 520
    Top = 216
  end
end
