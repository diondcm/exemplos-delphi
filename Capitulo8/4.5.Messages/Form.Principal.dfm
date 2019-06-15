object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Messages'
  ClientHeight = 408
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonClose: TButton
    Left = 8
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = ButtonCloseClick
  end
  object ButtonGetHandle: TButton
    Left = 8
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Get Handle'
    TabOrder = 1
    OnClick = ButtonGetHandleClick
  end
  object EditHandle: TEdit
    Left = 89
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object EditCaption: TEdit
    Left = 8
    Top = 24
    Width = 202
    Height = 21
    Color = clInfoBk
    TabOrder = 3
    Text = 'Sem t'#237'tulo - Paint'
  end
  object ButtonClick: TButton
    Left = 8
    Top = 207
    Width = 75
    Height = 25
    Caption = 'Click'
    TabOrder = 4
    OnClick = ButtonClickClick
  end
  object ButtonSetText: TButton
    Left = 8
    Top = 238
    Width = 75
    Height = 25
    Caption = 'Set Text'
    TabOrder = 5
    OnClick = ButtonSetTextClick
  end
end
