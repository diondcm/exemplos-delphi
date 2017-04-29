inherited frmBaseCadastro: TfrmBaseCadastro
  Caption = ''
  ClientHeight = 385
  ClientWidth = 511
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 527
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 511
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitWidth = 622
    object btnPrimeiro: TBitBtn
      Left = 0
      Top = 8
      Width = 49
      Height = 57
      Action = DatasetFirst1
      Caption = '&Primeiro'
      TabOrder = 0
    end
    object btnAnterior: TBitBtn
      Left = 55
      Top = 8
      Width = 49
      Height = 57
      Action = DatasetPrior1
      Caption = '&Anterior'
      TabOrder = 1
    end
    object btnProximo: TBitBtn
      Left = 110
      Top = 8
      Width = 49
      Height = 57
      Action = DatasetNext1
      Caption = '&Pr'#243'ximo'
      TabOrder = 2
    end
  end
  object btnUltimo: TBitBtn [1]
    Left = 165
    Top = 8
    Width = 49
    Height = 57
    Action = DatasetLast1
    Caption = '&'#218'ltimo'
    TabOrder = 1
  end
  object btnInserir: TBitBtn [2]
    Left = 231
    Top = 8
    Width = 49
    Height = 57
    Action = DatasetInsert1
    Caption = '&Inserir'
    TabOrder = 2
  end
  object btnDeletar: TBitBtn [3]
    Left = 286
    Top = 8
    Width = 49
    Height = 57
    Action = DatasetDelete1
    Caption = '&Deletar'
    TabOrder = 3
  end
  object btnEditar: TBitBtn [4]
    Left = 352
    Top = 8
    Width = 49
    Height = 57
    Action = DatasetEdit1
    Caption = '&Editar'
    TabOrder = 4
  end
  object btnSalvar: TBitBtn [5]
    Left = 407
    Top = 8
    Width = 49
    Height = 57
    Action = DatasetPost1
    Caption = '&Salvar'
    TabOrder = 5
  end
  object btnCancelar: TBitBtn [6]
    Left = 462
    Top = 8
    Width = 49
    Height = 57
    Action = DatasetCancel1
    Caption = '&Cancelar'
    TabOrder = 6
  end
  inherited dtsDados: TDataSource
    Left = 328
    Top = 232
  end
end
