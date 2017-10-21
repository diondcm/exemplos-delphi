inherited frmBaseCadastro: TfrmBaseCadastro
  ClientWidth = 782
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 798
  PixelsPerInch = 96
  TextHeight = 13
  object panelControles: TPanel [0]
    Left = 0
    Top = 0
    Width = 782
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 635
    object buttonCancelar: TBitBtn
      Left = 577
      Top = 1
      Width = 72
      Height = 55
      Action = DatasetCancel1
      Align = alLeft
      Caption = '&Cancelar'
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitHeight = 95
    end
    object buttonUltimo: TBitBtn
      Left = 217
      Top = 1
      Width = 72
      Height = 55
      Action = DatasetLast1
      Align = alLeft
      Caption = '&'#218'ltimo'
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitHeight = 95
    end
    object buttonProximo: TBitBtn
      Left = 145
      Top = 1
      Width = 72
      Height = 55
      Action = DatasetNext1
      Align = alLeft
      Caption = '&Pr'#243'ximo'
      TabOrder = 2
      ExplicitLeft = 1
      ExplicitHeight = 95
    end
    object buttonAnterior: TBitBtn
      Left = 73
      Top = 1
      Width = 72
      Height = 55
      Action = DatasetPrior1
      Align = alLeft
      Caption = '&Anterior'
      TabOrder = 3
      ExplicitLeft = 1
      ExplicitHeight = 95
    end
    object buttonPrimeiro: TBitBtn
      Left = 1
      Top = 1
      Width = 72
      Height = 55
      Action = DatasetFirst1
      Align = alLeft
      Caption = '&Primeiro'
      TabOrder = 4
      ExplicitHeight = 95
    end
    object buttonSalvar: TBitBtn
      Left = 505
      Top = 1
      Width = 72
      Height = 55
      Action = DatasetPost1
      Align = alLeft
      Caption = '&Salvar'
      TabOrder = 5
      ExplicitLeft = 1
      ExplicitHeight = 95
    end
    object buttonDeletar: TBitBtn
      Left = 433
      Top = 1
      Width = 72
      Height = 55
      Action = DatasetDelete1
      Align = alLeft
      Caption = '&Deletar'
      TabOrder = 6
      ExplicitLeft = 1
      ExplicitHeight = 95
    end
    object buttonEditar: TBitBtn
      Left = 361
      Top = 1
      Width = 72
      Height = 55
      Action = DatasetEdit1
      Align = alLeft
      Caption = '&Editar'
      TabOrder = 7
      ExplicitLeft = 1
      ExplicitHeight = 95
    end
    object buttonInserir: TBitBtn
      Left = 289
      Top = 1
      Width = 72
      Height = 55
      Action = DatasetInsert1
      Align = alLeft
      Caption = '&Inserir'
      TabOrder = 8
      ExplicitLeft = 1
      ExplicitHeight = 95
    end
  end
  inherited MainMenu: TMainMenu
    Left = 744
    Top = 88
  end
  inherited ActionList: TActionList
    Left = 744
    Top = 136
  end
  inherited dtsDados: TDataSource
    Left = 744
    Top = 192
  end
end
