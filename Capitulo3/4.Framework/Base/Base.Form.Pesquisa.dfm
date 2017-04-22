inherited frmBasePesquisa: TfrmBasePesquisa
  Caption = ''
  ClientHeight = 413
  ClientWidth = 690
  ExplicitWidth = 706
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 675
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
    end
  end
  object pnlControles: TPanel
    Left = 0
    Top = 352
    Width = 690
    Height = 61
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 675
    object btnEditar: TBitBtn
      Left = 7
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Editar'
      TabOrder = 0
    end
    object btnInserir: TBitBtn
      Left = 96
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Inserir'
      TabOrder = 1
    end
    object btnSelecionar: TBitBtn
      Left = 511
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Selecionar'
      TabOrder = 2
    end
    object btnCancelar: TBitBtn
      Left = 592
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 3
    end
  end
  object dbgPesquisa: TDBGrid
    Left = 0
    Top = 49
    Width = 690
    Height = 303
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dtsPesquisa: TDataSource
    Left = 616
    Top = 144
  end
  object PopupMenu: TPopupMenu
    Left = 528
    Top = 136
  end
end
