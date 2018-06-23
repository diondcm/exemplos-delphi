inherited frmBaseCadastro: TfrmBaseCadastro
  Caption = ''
  ClientHeight = 456
  ClientWidth = 749
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 765
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 743
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 327
      Top = 3
      Width = 5
      Height = 56
      Align = alLeft
      ExplicitLeft = 324
      ExplicitTop = 0
      ExplicitHeight = 62
    end
    object BitBtn1: TBitBtn
      AlignWithMargins = True
      Left = 662
      Top = 3
      Width = 75
      Height = 56
      Action = DatasetCancel1
      Align = alLeft
      Caption = '&Cancel'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      AlignWithMargins = True
      Left = 581
      Top = 3
      Width = 75
      Height = 56
      Action = DatasetPost1
      Align = alLeft
      Caption = 'P&ost'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      AlignWithMargins = True
      Left = 500
      Top = 3
      Width = 75
      Height = 56
      Action = DatasetDelete1
      Align = alLeft
      Caption = '&Delete'
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      AlignWithMargins = True
      Left = 419
      Top = 3
      Width = 75
      Height = 56
      Action = DatasetEdit1
      Align = alLeft
      Caption = '&Edit'
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      AlignWithMargins = True
      Left = 338
      Top = 3
      Width = 75
      Height = 56
      Action = DatasetInsert1
      Align = alLeft
      Caption = '&Insert'
      TabOrder = 4
    end
    object BitBtn6: TBitBtn
      AlignWithMargins = True
      Left = 246
      Top = 3
      Width = 75
      Height = 56
      Action = DatasetLast1
      Align = alLeft
      Caption = '&Last'
      TabOrder = 5
    end
    object BitBtn7: TBitBtn
      AlignWithMargins = True
      Left = 165
      Top = 3
      Width = 75
      Height = 56
      Action = DatasetNext1
      Align = alLeft
      Caption = '&Next'
      TabOrder = 6
    end
    object BitBtn8: TBitBtn
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 56
      Action = DatasetPrior1
      Align = alLeft
      Caption = '&Prior'
      TabOrder = 7
    end
    object BitBtn9: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 56
      Action = DatasetFirst1
      Align = alLeft
      Caption = '&First'
      TabOrder = 8
    end
  end
  inherited MainMenu: TMainMenu
    Left = 672
    Top = 192
  end
  inherited ActionList: TActionList
    Left = 672
    Top = 120
    object DatasetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&First'
      Hint = 'First'
      ImageIndex = 0
      OnExecute = DatasetFirst1Execute
      DataSource = dtsCadastro
    end
    object DatasetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Prior'
      Hint = 'Prior'
      ImageIndex = 1
      OnExecute = DatasetPrior1Execute
      DataSource = dtsCadastro
    end
    object DatasetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Next'
      Hint = 'Next'
      ImageIndex = 2
      OnExecute = DatasetNext1Execute
      DataSource = dtsCadastro
    end
    object DatasetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&Last'
      Hint = 'Last'
      ImageIndex = 3
      OnExecute = DatasetLast1Execute
      DataSource = dtsCadastro
    end
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
      OnExecute = DatasetInsert1Execute
      DataSource = dtsCadastro
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      OnExecute = DatasetDelete1Execute
      DataSource = dtsCadastro
    end
    object DatasetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Edit'
      Hint = 'Edit'
      ImageIndex = 6
      OnExecute = DatasetEdit1Execute
      DataSource = dtsCadastro
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      OnExecute = DatasetPost1Execute
      DataSource = dtsCadastro
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      OnExecute = DatasetCancel1Execute
      DataSource = dtsCadastro
    end
    object DatasetRefresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = '&Refresh'
      Hint = 'Refresh'
      ImageIndex = 9
      OnExecute = DatasetRefresh1Execute
      DataSource = dtsCadastro
    end
  end
  object dtsCadastro: TDataSource
    Left = 672
    Top = 264
  end
end
