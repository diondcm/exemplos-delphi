object frmError: TfrmError
  Left = 0
  Top = 0
  Caption = 'Tipos de Erro'
  ClientHeight = 533
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 768
    Top = 31
    Width = 122
    Height = 13
    Caption = 'Clicar 6 vz para ativar log'
  end
  object editValor: TEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    TextHint = 'Informe um valor'
  end
  object buttonProcessaValor: TButton
    Left = 16
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Processar'
    TabOrder = 1
    OnClick = buttonProcessaValorClick
  end
  object chekAtivarLog: TCheckBox
    Left = 800
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Ativar Log'
    TabOrder = 2
    Visible = False
    OnClick = chekAtivarLogClick
  end
  object buttonSair: TButton
    Left = 16
    Top = 464
    Width = 121
    Height = 49
    Caption = 'Sair'
    TabOrder = 3
    OnClick = buttonSairClick
  end
end
