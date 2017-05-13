object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplos finais App Desktop'
  ClientHeight = 357
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnMasterDetail: TButton
    Left = 24
    Top = 24
    Width = 113
    Height = 49
    Action = actMasterDetail
    TabOrder = 0
  end
  object btnREST: TButton
    Left = 24
    Top = 79
    Width = 113
    Height = 58
    Action = actREST
    TabOrder = 1
  end
  object btnSerealizador: TButton
    Left = 24
    Top = 143
    Width = 113
    Height = 58
    Action = actSerealizador
    TabOrder = 2
  end
  object btnNASAAPI: TButton
    Left = 24
    Top = 207
    Width = 113
    Height = 58
    Action = actNasaAPI
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 536
    Top = 16
    object actMasterDetail: TAction
      Caption = 'Master Detail'
      OnExecute = actMasterDetailExecute
    end
    object actREST: TAction
      Caption = 'REST'
      OnExecute = actRESTExecute
    end
    object actSerealizador: TAction
      Caption = 'Serealizador'
      OnExecute = actSerealizadorExecute
    end
    object actNasaAPI: TAction
      Caption = 'NASA API'
      OnExecute = actNasaAPIExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 536
    Top = 64
    object Exemplos1: TMenuItem
      Caption = 'Exemplos'
      object MasterDetail1: TMenuItem
        Action = actMasterDetail
      end
    end
  end
end
