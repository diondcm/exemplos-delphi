object frmHash: TfrmHash
  Left = 0
  Top = 0
  Caption = 'Teste Hash'
  ClientHeight = 301
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object editTexto: TEdit
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 454
    Height = 21
    Align = alTop
    TabOrder = 0
    OnKeyDown = editTextoKeyDown
    ExplicitTop = 8
    ExplicitWidth = 121
  end
  object memoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 152
    Width = 454
    Height = 146
    Align = alBottom
    TabOrder = 1
  end
end
