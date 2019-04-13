object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Heran'#231'a Visual'
  ClientHeight = 271
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 256
    Top = 144
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
        OnClick = Sobre1Click
      end
    end
  end
  object TimerLogin: TTimer
    Interval = 400
    OnTimer = TimerLoginTimer
    Left = 320
    Top = 144
  end
end
