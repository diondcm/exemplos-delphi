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
  object ActionList1: TActionList
    Left = 432
    Top = 56
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
  end
  object MainMenu1: TMainMenu
    Left = 432
    Top = 104
    object Exemplos1: TMenuItem
      Caption = 'Exemplos'
      object MasterDetail1: TMenuItem
        Action = actMasterDetail
      end
    end
  end
end
