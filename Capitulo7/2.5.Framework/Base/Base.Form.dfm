object frmBase: TfrmBase
  Left = 0
  Top = 0
  Caption = 'frmBase'
  ClientHeight = 201
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Images = dmdImagens.ImageList
    Left = 144
    Top = 48
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
        OnClick = Sobre1Click
      end
    end
  end
  object ActionList: TActionList
    Left = 216
    Top = 48
  end
end
