object frmBaseCadastro: TfrmBaseCadastro
  Left = 0
  Top = 0
  Caption = 'Base Cadastro'
  ClientHeight = 356
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBotoes: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 735
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 312
    ExplicitTop = 152
    ExplicitWidth = 185
    object ButtonUltimo: TBitBtn
      AlignWithMargins = True
      Left = 652
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetLast1
      Align = alLeft
      Caption = '&'#218'ltimo'
      TabOrder = 0
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ButtonProximo: TBitBtn
      AlignWithMargins = True
      Left = 571
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetNext1
      Align = alLeft
      Caption = '&Pr'#243'ximo'
      TabOrder = 1
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ButtonAnterior: TBitBtn
      AlignWithMargins = True
      Left = 490
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetPrior1
      Align = alLeft
      Caption = '&Anterior'
      TabOrder = 2
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ButtonPrimeiro: TBitBtn
      AlignWithMargins = True
      Left = 409
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetFirst1
      Align = alLeft
      Caption = '&Primeiro'
      TabOrder = 3
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ButtonDeletar: TBitBtn
      AlignWithMargins = True
      Left = 328
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetDelete1
      Align = alLeft
      Caption = '&Deletar'
      TabOrder = 4
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ButtonSalvar: TBitBtn
      AlignWithMargins = True
      Left = 247
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetPost1
      Align = alLeft
      Caption = '&Salvar'
      TabOrder = 5
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ButtonCancelar: TBitBtn
      AlignWithMargins = True
      Left = 166
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetCancel1
      Align = alLeft
      Caption = '&Cancelar'
      TabOrder = 6
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ButtonEditar: TBitBtn
      AlignWithMargins = True
      Left = 85
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetEdit1
      Align = alLeft
      Caption = '&Editar'
      TabOrder = 7
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ButtonInsert: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetInsert1
      Align = alLeft
      Caption = '&Inserir'
      TabOrder = 8
      ExplicitLeft = 272
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 47
    Width = 741
    Height = 290
    ActivePage = TabPesquisa
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 309
    object TabPesquisa: TTabSheet
      Caption = 'Pesquisa'
      ExplicitHeight = 281
      object DBGridDados: TDBGrid
        Left = 0
        Top = 0
        Width = 733
        Height = 262
        Align = alClient
        DataSource = dtsDados
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitHeight = 281
    end
  end
  object StatusBarCadastro: TStatusBar
    Left = 0
    Top = 337
    Width = 741
    Height = 19
    Panels = <
      item
        Width = 240
      end
      item
        Width = 240
      end
      item
        Width = 240
      end>
    ExplicitLeft = 376
    ExplicitTop = 192
    ExplicitWidth = 0
  end
  object dtsDados: TDataSource
    OnDataChange = dtsDadosDataChange
    Left = 368
    Top = 184
  end
  object ActionList: TActionList
    Left = 512
    Top = 184
    object DatasetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Primeiro'
      Hint = 'First'
      ImageIndex = 0
      DataSource = dtsDados
    end
    object DatasetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Anterior'
      Hint = 'Prior'
      ImageIndex = 1
      DataSource = dtsDados
    end
    object DatasetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Pr'#243'ximo'
      Hint = 'Next'
      ImageIndex = 2
      DataSource = dtsDados
    end
    object DatasetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&'#218'ltimo'
      Hint = 'Last'
      ImageIndex = 3
      DataSource = dtsDados
    end
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Inserir'
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = dtsDados
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Deletar'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = dtsDados
    end
    object DatasetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Editar'
      Hint = 'Edit'
      ImageIndex = 6
      DataSource = dtsDados
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = '&Salvar'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dtsDados
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancel'
      ImageIndex = 8
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
  object TimerOpne: TTimer
    Enabled = False
    OnTimer = TimerOpneTimer
    Left = 608
    Top = 176
  end
end
