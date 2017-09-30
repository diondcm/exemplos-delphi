object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Converor de Moeda'
  ClientHeight = 578
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtValor: TEdit
    Left = 40
    Top = 24
    Width = 185
    Height = 21
    TabOrder = 0
    TextHint = 'Informe o valor'
  end
  object btnDolarParaReal: TButton
    Left = 40
    Top = 104
    Width = 185
    Height = 25
    Caption = 'Dolar Para Real'
    TabOrder = 1
    OnClick = btnDolarParaRealClick
  end
  object btnRealParaDolar: TButton
    Left = 40
    Top = 73
    Width = 185
    Height = 25
    Caption = 'Real Para Dolar'
    TabOrder = 2
    OnClick = btnRealParaDolarClick
  end
  object pnlResultado: TPanel
    Left = 40
    Top = 152
    Width = 185
    Height = 41
    TabOrder = 3
  end
end
