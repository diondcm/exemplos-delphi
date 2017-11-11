object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'T'#243'picos Gerais'
  ClientHeight = 611
  ClientWidth = 1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object buttonQRCode: TBitBtn
    Left = 24
    Top = 32
    Width = 145
    Height = 73
    Action = ExibeQRCode
    Caption = 'QR Code'
    TabOrder = 0
  end
  object buttonMapas: TBitBtn
    Left = 24
    Top = 111
    Width = 145
    Height = 73
    Action = ExibeMapas
    Caption = 'Maps'
    TabOrder = 1
  end
  object buttonErrorTypes: TBitBtn
    Left = 24
    Top = 190
    Width = 145
    Height = 73
    Action = ExibeError
    Caption = 'Error Types'
    TabOrder = 2
  end
  object ActionList: TActionList
    Left = 840
    Top = 176
    object ExibeQRCode: TAction
      Caption = 'QR Code'
      OnExecute = ExibeQRCodeExecute
    end
    object ExibeMapas: TAction
      Caption = 'Maps'
      OnExecute = ExibeMapasExecute
    end
    object ExibeError: TAction
      Caption = 'Error Types'
      ShortCut = 16453
      OnExecute = ExibeErrorExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 840
    Top = 224
    object QRCode2: TMenuItem
      Action = ExibeQRCode
    end
    object Mapas1: TMenuItem
      Action = ExibeMapas
    end
    object ErrorTypes2: TMenuItem
      Action = ExibeError
    end
  end
  object MainMenu: TMainMenu
    Left = 840
    Top = 128
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object QRCode1: TMenuItem
        Action = ExibeQRCode
        ShortCut = 16465
      end
      object Maps1: TMenuItem
        Action = ExibeMapas
        ShortCut = 16461
      end
      object ErrorTypes1: TMenuItem
        Action = ExibeError
      end
    end
  end
end
