object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplo'
  ClientHeight = 201
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnTestaDebug: TButton
    Left = 120
    Top = 80
    Width = 113
    Height = 25
    Caption = 'Testa Debug'
    TabOrder = 0
    OnClick = btnTestaDebugClick
  end
  object edtSeparador: TEdit
    Left = 120
    Top = 111
    Width = 113
    Height = 21
    TabOrder = 1
    Text = ','
  end
end
