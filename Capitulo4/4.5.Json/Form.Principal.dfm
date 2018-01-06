object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'JSON com RTTI'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object buttonSalvar: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 49
    Caption = 'buttonSalvar'
    TabOrder = 0
    OnClick = buttonSalvarClick
  end
  object memoPropriedades: TMemo
    AlignWithMargins = True
    Left = 444
    Top = 6
    Width = 185
    Height = 287
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 128
    ExplicitHeight = 89
  end
end
