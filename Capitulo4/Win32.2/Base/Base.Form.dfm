object frmBase: TfrmBase
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 635
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
    Left = 424
    Top = 88
    object menuAjuda: TMenuItem
      Caption = 'Ajuda'
      object menuSobre: TMenuItem
        Caption = 'Sobre'
        OnClick = menuSobreClick
      end
    end
  end
end
