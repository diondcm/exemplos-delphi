inherited frmBasePesquisa: TfrmBasePesquisa
  Caption = 'Pesquisa'
  ClientHeight = 340
  ClientWidth = 468
  OnClose = FormClose
  ExplicitWidth = 484
  ExplicitHeight = 399
  PixelsPerInch = 96
  TextHeight = 13
  object panelFiltro: TPanel [0]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 462
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    object editPesquisa: TButtonedEdit
      AlignWithMargins = True
      Left = 50
      Top = 10
      Width = 362
      Height = 21
      Margins.Left = 50
      Margins.Top = 10
      Margins.Right = 50
      Margins.Bottom = 10
      Align = alClient
      Constraints.MaxWidth = 362
      Images = dmdImagens.ImageList
      RightButton.ImageIndex = 0
      TabOrder = 0
      TextHint = 'Texto para pesquisa'
      OnKeyDown = editPesquisaKeyDown
      OnRightButtonClick = editPesquisaRightButtonClick
      ExplicitLeft = 168
      ExplicitTop = 11
      ExplicitWidth = 121
    end
  end
  object panelControles: TPanel [1]
    AlignWithMargins = True
    Left = 3
    Top = 296
    Width = 462
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 152
    ExplicitTop = 176
    ExplicitWidth = 185
    object buttonInserir: TButton
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 85
      Height = 35
      Action = DatasetInsert1
      Align = alLeft
      Images = dmdImagens.ImageList
      TabOrder = 0
    end
    object buttonEditar: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 35
      Action = DatasetEdit1
      Align = alLeft
      Images = dmdImagens.ImageList
      TabOrder = 1
      ExplicitTop = 0
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 248
      Top = 3
      Width = 106
      Height = 35
      Action = actionSelecionar
      Align = alRight
      Images = dmdImagens.ImageList
      TabOrder = 2
      ExplicitLeft = 272
      ExplicitTop = 0
    end
    object buttonCancelar: TButton
      AlignWithMargins = True
      Left = 360
      Top = 3
      Width = 99
      Height = 35
      Action = actionCancelar
      Align = alRight
      TabOrder = 3
      ExplicitTop = 0
    end
  end
  object gridPesquisa: TDBGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 462
    Height = 240
    Align = alClient
    DataSource = dtsPesquisa
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridPesquisaDblClick
  end
  inherited ActionList: TActionList
    Images = dmdImagens.ImageList
    object actionSelecionar: TAction
      Caption = 'Selecionar'
      ImageIndex = 1
      OnExecute = actionSelecionarExecute
    end
    object actionCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = actionCancelarExecute
    end
    object actionPesquisar: TAction
      Caption = 'Pesquisar'
      OnExecute = actionPesquisarExecute
    end
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Inserir'
      Hint = 'Insert'
      ImageIndex = 2
      OnExecute = DatasetInsert1Execute
    end
    object DatasetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Editar'
      Hint = 'Edit'
      ImageIndex = 3
      OnExecute = DatasetEdit1Execute
    end
  end
  object dtsPesquisa: TDataSource
    Left = 408
    Top = 80
  end
end
