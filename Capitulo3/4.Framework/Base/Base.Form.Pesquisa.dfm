inherited frmBasePesquisa: TfrmBasePesquisa
  Caption = ''
  ClientHeight = 413
  ClientWidth = 690
  PopupMenu = PopupMenu
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 706
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisa: TPanel [0]
    Left = 0
    Top = 0
    Width = 690
    Height = 49
    Align = alTop
    PopupMenu = PopupMenu
    TabOrder = 0
    object btePesquisa: TButtonedEdit
      Left = 56
      Top = 15
      Width = 537
      Height = 21
      Images = dmdConexao.imlBase
      RightButton.ImageIndex = 0
      RightButton.Visible = True
      TabOrder = 0
      TextHint = 'Pesquisar'
      OnKeyDown = btePesquisaKeyDown
      OnRightButtonClick = btePesquisaRightButtonClick
    end
  end
  object pnlControles: TPanel [1]
    Left = 0
    Top = 49
    Width = 690
    Height = 40
    Align = alTop
    PopupMenu = PopupMenu
    TabOrder = 1
    object btnEditar: TBitBtn
      Left = 7
      Top = 6
      Width = 75
      Height = 25
      Action = DatasetEdit1
      Caption = '&Editar'
      TabOrder = 0
    end
    object btnInserir: TBitBtn
      Left = 88
      Top = 6
      Width = 75
      Height = 25
      Action = DatasetInsert1
      Caption = '&Inserir'
      TabOrder = 1
    end
    object btnSelecionar: TBitBtn
      Left = 511
      Top = 6
      Width = 75
      Height = 25
      Action = actSelecionar
      Caption = '&Selecionar'
      TabOrder = 2
    end
    object btnCancelar: TBitBtn
      Left = 592
      Top = 6
      Width = 75
      Height = 25
      Action = actCancelar
      Caption = 'Cancelar'
      TabOrder = 3
    end
  end
  object dbgPesquisa: TDBGrid [2]
    Left = 0
    Top = 89
    Width = 690
    Height = 324
    Align = alClient
    DataSource = dtsDados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgPesquisaDblClick
  end
  inherited dtsDados: TDataSource
    Left = 624
    Top = 136
  end
  object PopupMenu: TPopupMenu [4]
    Left = 528
    Top = 136
    object Editar1: TMenuItem
      Action = DatasetEdit1
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Selecionar1: TMenuItem
      Action = actSelecionar
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Inserir1: TMenuItem
      Action = DatasetInsert1
    end
  end
  inherited ActionList: TActionList
    object actCancelar: TAction
      Category = 'Pesquisar'
      Caption = 'Cancelar'
      Visible = False
      OnExecute = actCancelarExecute
    end
    object actPesquisar: TAction
      Category = 'Pesquisar'
      Caption = '&Pesquisar'
      OnExecute = actPesquisarExecute
    end
    object actSelecionar: TAction
      Category = 'Pesquisar'
      Caption = '&Selecionar'
      Visible = False
      OnExecute = actSelecionarExecute
    end
  end
end
