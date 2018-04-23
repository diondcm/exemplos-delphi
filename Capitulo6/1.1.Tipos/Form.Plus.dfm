object frmPlus: TfrmPlus
  Left = 0
  Top = 0
  Caption = 'Generics & Atributos'
  ClientHeight = 464
  ClientWidth = 806
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
  object buttonLeAtributos: TButton
    Left = 8
    Top = 8
    Width = 137
    Height = 57
    Caption = 'buttonLeAtributos'
    TabOrder = 0
    OnClick = buttonLeAtributosClick
  end
  object memoLog: TMemo
    AlignWithMargins = True
    Left = 502
    Top = 10
    Width = 294
    Height = 444
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 512
    ExplicitTop = 0
    ExplicitHeight = 464
  end
  object buttonGenerics: TButton
    Left = 8
    Top = 80
    Width = 137
    Height = 57
    Caption = 'buttonGenerics'
    TabOrder = 2
    OnClick = buttonGenericsClick
  end
  object buttonMetodosA: TButton
    Left = 8
    Top = 143
    Width = 137
    Height = 66
    Caption = 'buttonMetodosA'
    TabOrder = 3
    OnClick = buttonMetodosAClick
  end
  object buttonServico: TButton
    Left = 151
    Top = 143
    Width = 106
    Height = 25
    Caption = 'buttonServico'
    TabOrder = 4
    OnClick = buttonServicoClick
  end
  object buttonInterface: TButton
    Left = 151
    Top = 184
    Width = 106
    Height = 25
    Caption = 'buttonInterface'
    TabOrder = 5
    OnClick = buttonInterfaceClick
  end
end
