object frmConsultaPessoa: TfrmConsultaPessoa
  Left = 0
  Top = 0
  Caption = 'Exportador de Pessoas'
  ClientHeight = 528
  ClientWidth = 1255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gridPessoa: TDBGrid
    Left = 0
    Top = 41
    Width = 1255
    Height = 431
    Align = alClient
    DataSource = dtsPessoal
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object NavigatorPessoa: TDBNavigator
    Left = 0
    Top = 472
    Width = 1255
    Height = 56
    DataSource = dtsPessoal
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
    Align = alBottom
    TabOrder = 1
  end
  object panelControles: TPanel
    Left = 0
    Top = 0
    Width = 1255
    Height = 41
    Align = alTop
    Caption = 'panelControles'
    ShowCaption = False
    TabOrder = 2
    object buttonAtualizar: TButton
      Left = 24
      Top = 4
      Width = 153
      Height = 31
      Caption = 'Atualizar informa'#231#245'es'
      TabOrder = 0
      OnClick = buttonAtualizarClick
    end
    object buttonCadastro: TButton
      Left = 183
      Top = 4
      Width = 170
      Height = 31
      Caption = 'Cadastrar Pessoa'
      TabOrder = 1
      OnClick = buttonCadastroClick
    end
    object buttonAlterarPessoa: TButton
      Left = 359
      Top = 4
      Width = 178
      Height = 31
      Caption = 'Alterar Pessoa'
      TabOrder = 2
      OnClick = buttonAlterarPessoaClick
    end
  end
  object dtsPessoal: TDataSource
    DataSet = cdsPessoa
    Left = 800
    Top = 200
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsPessoaNewRecord
    Left = 800
    Top = 144
    object cdsPessoaID: TIntegerField
      FieldName = 'ID'
    end
    object cdsPessoaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsPessoaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object cdsPessoaDataNascimento: TDateField
      FieldName = 'DataNascimento'
    end
    object cdsPessoaDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
  end
end
