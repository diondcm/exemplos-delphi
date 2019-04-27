object frmCadBase: TfrmCadBase
  Left = 0
  Top = 0
  ClientHeight = 412
  ClientWidth = 691
  Color = clBtnFace
  Constraints.MinHeight = 237
  Constraints.MinWidth = 619
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 52
    Width = 685
    Height = 357
    ActivePage = TabPesquisa
    Align = alClient
    TabOrder = 0
    object TabPesquisa: TTabSheet
      Caption = 'Pesquisar'
      object DBGridPEsquisa: TDBGrid
        Left = 0
        Top = 0
        Width = 677
        Height = 310
        Align = alClient
        DataSource = dtsDados
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object StatusBar: TStatusBar
        Left = 0
        Top = 310
        Width = 677
        Height = 19
        Panels = <
          item
            Width = 200
          end
          item
            Width = 200
          end
          item
            Width = 200
          end>
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastrar'
      ImageIndex = 1
    end
  end
  object PanelNavigator: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 685
    Height = 43
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      AlignWithMargins = True
      Left = 604
      Top = 4
      Width = 69
      Height = 35
      Action = DatasetLast1
      Align = alLeft
      TabOrder = 0
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 454
      Top = 4
      Width = 69
      Height = 35
      Action = DatasetPrior1
      Align = alLeft
      TabOrder = 1
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 229
      Top = 4
      Width = 69
      Height = 35
      Action = DatasetPost1
      Align = alLeft
      TabOrder = 2
    end
    object Button4: TButton
      AlignWithMargins = True
      Left = 529
      Top = 4
      Width = 69
      Height = 35
      Action = DatasetNext1
      Align = alLeft
      TabOrder = 3
    end
    object Button5: TButton
      AlignWithMargins = True
      Left = 379
      Top = 4
      Width = 69
      Height = 35
      Action = DatasetFirst1
      Align = alLeft
      TabOrder = 4
    end
    object Button6: TButton
      AlignWithMargins = True
      Left = 79
      Top = 4
      Width = 69
      Height = 35
      Action = DatasetEdit1
      Align = alLeft
      TabOrder = 5
    end
    object Button7: TButton
      AlignWithMargins = True
      Left = 304
      Top = 4
      Width = 69
      Height = 35
      Action = DatasetDelete1
      Align = alLeft
      TabOrder = 6
    end
    object Button8: TButton
      AlignWithMargins = True
      Left = 154
      Top = 4
      Width = 69
      Height = 35
      Action = DatasetCancel1
      Align = alLeft
      TabOrder = 7
    end
    object Button9: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 69
      Height = 35
      Action = DatasetInsert1
      Align = alLeft
      ImageIndex = 0
      Images = dmdImanges.ImageList
      TabOrder = 8
    end
  end
  object dtsDados: TDataSource
    DataSet = dmdBase.qryDados
    OnStateChange = dtsDadosStateChange
    Left = 320
    Top = 56
  end
  object ActionList: TActionList
    Images = dmdImanges.ImageList
    Left = 424
    Top = 56
    object DatasetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&First'
      Hint = 'First'
      ImageIndex = 0
      DataSource = dtsDados
    end
    object DatasetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Prior'
      Hint = 'Prior'
      ImageIndex = 1
      DataSource = dtsDados
    end
    object DatasetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Next'
      Hint = 'Next'
      ImageIndex = 2
      DataSource = dtsDados
    end
    object DatasetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&Last'
      Hint = 'Last'
      ImageIndex = 3
      DataSource = dtsDados
    end
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = dtsDados
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = dtsDados
    end
    object DatasetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Edit'
      Hint = 'Edit'
      ImageIndex = 6
      DataSource = dtsDados
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dtsDados
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dtsDados
    end
  end
  object TimerOpen: TTimer
    Enabled = False
    Interval = 400
    OnTimer = TimerOpenTimer
    Left = 520
    Top = 56
  end
end
