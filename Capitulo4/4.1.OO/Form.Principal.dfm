object frmPrinciapal: TfrmPrinciapal
  Left = 0
  Top = 0
  Caption = 'Intro OOP'
  ClientHeight = 381
  ClientWidth = 632
  Color = clBtnFace
  Constraints.MinHeight = 381
  Constraints.MinWidth = 632
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memoLog: TMemo
    AlignWithMargins = True
    Left = 303
    Top = 10
    Width = 319
    Height = 361
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alRight
    TabOrder = 0
  end
  object buttonPessoa: TBitBtn
    Left = 15
    Top = 15
    Width = 121
    Height = 57
    Margins.Left = 10
    Margins.Top = 10
    Align = alCustom
    Caption = 'Pessoa'
    TabOrder = 1
    OnClick = buttonPessoaClick
  end
  object Dependente1: TDependente
    NivelStr = 'Filho'
    Left = 16
    Top = 88
  end
end
