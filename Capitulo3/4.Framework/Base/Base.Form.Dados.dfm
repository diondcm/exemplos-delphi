inherited frmBaseDados: TfrmBaseDados
  Caption = 'frmBaseDados'
  ClientHeight = 298
  ClientWidth = 469
  Menu = MainMenu
  ExplicitWidth = 485
  ExplicitHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  object dtsDados: TDataSource
    Left = 392
    Top = 144
  end
  object MainMenu: TMainMenu
    Left = 256
    Top = 144
  end
  object ActionList: TActionList
    Left = 320
    Top = 144
    object DatasetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Primeiro'
      Hint = 'First'
      ImageIndex = 0
      OnExecute = DatasetFirst1Execute
      DataSource = dtsDados
    end
    object DatasetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Anterior'
      Hint = 'Prior'
      ImageIndex = 1
      OnExecute = DatasetPrior1Execute
      DataSource = dtsDados
    end
    object DatasetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Pr'#243'ximo'
      Hint = 'Next'
      ImageIndex = 2
      OnExecute = DatasetNext1Execute
      DataSource = dtsDados
    end
    object DatasetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&'#218'ltimo'
      Hint = 'Last'
      ImageIndex = 3
      OnExecute = DatasetLast1Execute
      DataSource = dtsDados
    end
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Inserir'
      Hint = 'Insert'
      ImageIndex = 4
      OnExecute = DatasetInsert1Execute
      DataSource = dtsDados
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Deletar'
      Hint = 'Delete'
      ImageIndex = 5
      OnExecute = DatasetDelete1Execute
      DataSource = dtsDados
    end
    object DatasetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Editar'
      Hint = 'Edit'
      ImageIndex = 6
      OnExecute = DatasetEdit1Execute
      DataSource = dtsDados
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = '&Salvar'
      Hint = 'Post'
      ImageIndex = 7
      OnExecute = DatasetPost1Execute
      DataSource = dtsDados
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancel'
      ImageIndex = 8
      OnExecute = DatasetCancel1Execute
      DataSource = dtsDados
    end
    object DatasetRefresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = '&Atualizar'
      Hint = 'Refresh'
      ImageIndex = 9
      DataSource = dtsDados
    end
  end
end
