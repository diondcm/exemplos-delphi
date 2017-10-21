inherited frmBaseDados: TfrmBaseDados
  PixelsPerInch = 96
  TextHeight = 13
  inherited MainMenu: TMainMenu
    Left = 512
    Top = 32
  end
  object ActionList: TActionList
    Left = 512
    Top = 80
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
      OnExecute = DatasetRefresh1Execute
      DataSource = dtsDados
    end
  end
  object dtsDados: TDataSource
    Left = 512
    Top = 136
  end
end
