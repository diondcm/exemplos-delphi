inherited frmBasePesquisa: TfrmBasePesquisa
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object panelPesquisa: TPanel [0]
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    TabOrder = 0
    object editPesquisa: TButtonedEdit
      Left = 24
      Top = 11
      Width = 569
      Height = 21
      RightButton.ImageIndex = 0
      RightButton.Visible = True
      TabOrder = 0
      TextHint = 'Pesquisar'
      OnKeyDown = editPesquisaKeyDown
      OnRightButtonClick = editPesquisaRightButtonClick
    end
  end
  object panelControles: TPanel [1]
    Left = 0
    Top = 240
    Width = 635
    Height = 59
    Align = alBottom
    TabOrder = 1
    object buttonSelecionar: TBitBtn
      Left = 408
      Top = 6
      Width = 105
      Height = 47
      Action = actSelecionar
      Caption = 'Selecionar'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
    end
    object buttonCancelar: TBitBtn
      Left = 519
      Top = 6
      Width = 106
      Height = 47
      Action = actCancelar
      Cancel = True
      Caption = 'Cancelar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
    object buttonInserir: TBitBtn
      Left = 119
      Top = 6
      Width = 105
      Height = 47
      Action = DatasetInsert1
      Caption = '&Inserir'
      TabOrder = 2
    end
    object buttonEditar: TBitBtn
      Left = 10
      Top = 6
      Width = 105
      Height = 47
      Action = DatasetEdit1
      Caption = '&Editar'
      TabOrder = 3
    end
  end
  object panelGrid: TPanel [2]
    Left = 0
    Top = 41
    Width = 635
    Height = 199
    Align = alClient
    TabOrder = 2
    object labelStatus: TLabel
      Left = 1
      Top = 185
      Width = 633
      Height = 13
      Align = alBottom
      Alignment = taRightJustify
      ExplicitLeft = 631
      ExplicitWidth = 3
    end
    object gridDados: TDBGrid
      Left = 1
      Top = 1
      Width = 633
      Height = 184
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = gridDadosDblClick
      OnTitleClick = gridDadosTitleClick
    end
  end
  inherited ActionList: TActionList
    object actSelecionar: TAction
      Caption = 'Selecionar'
      OnExecute = actSelecionarExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = actCancelarExecute
    end
    object actPesquisar: TAction
      Caption = 'Pesquisar'
      OnExecute = actPesquisarExecute
    end
  end
end
