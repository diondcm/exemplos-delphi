object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ActiveControl = BitBtn1
  Caption = 'Cadastro com Objetos'
  ClientHeight = 305
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 518
    Height = 49
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 72
    Width = 161
    Height = 73
    Action = actionCadastroPessoa
    Caption = 'Cadastro Pessoa'
    TabOrder = 1
  end
  object buttonREST: TButton
    Left = 8
    Top = 160
    Width = 161
    Height = 65
    Action = actionREST
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 368
    Top = 176
    object actionCadastroPessoa: TAction
      Category = 'Cadastros'
      Caption = 'Cadastro Pessoa'
      OnExecute = actionCadastroPessoaExecute
    end
    object actionREST: TAction
      Caption = 'REST'
      OnExecute = actionRESTExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 328
    Top = 96
  end
end
