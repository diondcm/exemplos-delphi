object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal de cadastro'
  ClientHeight = 404
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 288
    Top = 208
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
        OnClick = Sobre1Click
      end
      object SobreHerdado1: TMenuItem
        Caption = 'Sobre Herdado'
        OnClick = SobreHerdado1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Categoria1: TMenuItem
        Caption = 'Categoria'
        OnClick = Categoria1Click
      end
    end
  end
end
