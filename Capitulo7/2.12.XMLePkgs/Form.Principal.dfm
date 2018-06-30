object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'XML e Pkages'
  ClientHeight = 304
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object labelXML: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 471
    Height = 13
    Align = alTop
    Caption = 'Exemplos de Xml em: Capitulo4\Essentials.7'
    ExplicitWidth = 209
  end
  object buttonCalculo: TButton
    Left = 3
    Top = 40
    Width = 137
    Height = 73
    Caption = 'Calculo'
    TabOrder = 0
    OnClick = buttonCalculoClick
  end
  object buttonDynamic: TButton
    Left = 3
    Top = 208
    Width = 137
    Height = 73
    Caption = 'Dynamic'
    TabOrder = 1
    OnClick = buttonDynamicClick
  end
end
