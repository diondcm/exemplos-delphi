object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Heran'#231'a Visual'
  ClientHeight = 421
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MemoLogAcesso: TMemo
    AlignWithMargins = True
    Left = 412
    Top = 3
    Width = 185
    Height = 415
    Align = alRight
    Lines.Strings = (
      'MemoLogAcesso')
    TabOrder = 0
    ExplicitLeft = 216
    ExplicitTop = 200
    ExplicitHeight = 89
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 144
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
      object Parmetros1: TMenuItem
        Caption = 'Par'#226'metros'
        OnClick = Parmetros1Click
      end
      object ConfigImpresso1: TMenuItem
        Caption = 'Config. Impress'#227'o'
        OnClick = ConfigImpresso1Click
      end
      object rocausurio1: TMenuItem
        Caption = 'Troca usu'#225'rio'
        OnClick = rocausurio1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
    end
  end
  object TimerLogin: TTimer
    Enabled = False
    OnTimer = TimerLoginTimer
    Left = 352
    Top = 16
  end
end
