object frmDadosDB: TfrmDadosDB
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Dados DB'
  ClientHeight = 400
  ClientWidth = 683
  Color = clBtnFace
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
  object Splitter1: TSplitter
    Left = 0
    Top = 224
    Width = 683
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 60
    ExplicitWidth = 167
  end
  object PanelSair: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 356
    Width = 677
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 256
    ExplicitTop = 144
    ExplicitWidth = 185
    object ButtonSair: TButton
      AlignWithMargins = True
      Left = 573
      Top = 4
      Width = 100
      Height = 33
      Align = alRight
      Caption = 'Ok'
      TabOrder = 0
      OnClick = ButtonSairClick
      ExplicitLeft = 448
      ExplicitTop = 0
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 677
    Height = 158
    Align = alClient
    DataSource = dtsLogImportacao
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PanelImportar: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 677
    Height = 54
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitWidth = 544
    object ButtonImportar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 93
      Height = 46
      Align = alLeft
      Caption = 'Importar'
      TabOrder = 0
      OnClick = ButtonImportarClick
      ExplicitLeft = 0
      ExplicitTop = 8
    end
    object EditDescImportacao: TEdit
      Left = 120
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object DBGrid2: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 230
    Width = 677
    Height = 120
    Align = alBottom
    DataSource = dtsClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo8\1.2.DB' +
        '\Win32\Debug\dados.db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 328
    Top = 40
  end
  object qryClientes: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from cliente')
    Left = 328
    Top = 88
    object qryClientesID: TFDAutoIncField
      DisplayWidth = 6
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryClientesNOME: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qryClientesDataNascimento: TDateTimeField
      DisplayLabel = 'Dt Nasc.'
      DisplayWidth = 10
      FieldName = 'DataNascimento'
      Origin = 'DataNascimento'
    end
    object qryClientesCPF: TWideStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object qryClientesDataCadastro: TDateTimeField
      DisplayLabel = 'Cadastro'
      DisplayWidth = 10
      FieldName = 'DataCadastro'
      Origin = 'DataCadastro'
    end
    object qryClientesCredito: TBCDField
      DisplayLabel = 'Cr'#233'dito'
      DisplayWidth = 8
      FieldName = 'Credito'
      Origin = 'Credito'
      Precision = 15
      Size = 2
    end
  end
  object qryCriaTabelaCliente: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS CLIENTE ('
      '    ID             INTEGER         PRIMARY KEY AUTOINCREMENT,'
      '    NOME           STRING (100),'
      '    DataNascimento DATETIME,'
      '    CPF            STRING (14),'
      '    DataCadastro   DATETIME        DEFAULT (CURRENT_TIMESTAMP),'
      '    Credito        DECIMAL (15, 2) DEFAULT (0) '
      ')')
    Left = 416
    Top = 88
  end
  object qryCriaTabelaImport: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS LOG_IMPORTACAO ('
      '    ID                INTEGER  PRIMARY KEY AUTOINCREMENT,'
      '    DATA_IMPORTACAO   DATETIME DEFAULT (CURRENT_TIMESTAMP),'
      '    DESCRICAO         STRING,'
      '    QTD_REG_ANTERIOR  INTEGER,'
      '    QTD_REG_POSTERIOR INTEGER'
      ')')
    Left = 416
    Top = 144
  end
  object dtsLogImportacao: TDataSource
    DataSet = qryLogImportacao
    Left = 264
    Top = 152
  end
  object qryLogImportacao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from LOG_IMPORTACAO')
    Left = 144
    Top = 128
    object qryLogImportacaoID: TFDAutoIncField
      DisplayWidth = 6
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryLogImportacaoDATA_IMPORTACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATA_IMPORTACAO'
      Origin = 'DATA_IMPORTACAO'
    end
    object qryLogImportacaoDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 70
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 32767
    end
    object qryLogImportacaoQTD_REG_ANTERIOR: TIntegerField
      DisplayLabel = 'Qtd. Anterior'
      FieldName = 'QTD_REG_ANTERIOR'
      Origin = 'QTD_REG_ANTERIOR'
    end
    object qryLogImportacaoQTD_REG_POSTERIOR: TIntegerField
      DisplayLabel = 'Qtd. Posterior'
      FieldName = 'QTD_REG_POSTERIOR'
      Origin = 'QTD_REG_POSTERIOR'
    end
  end
  object TimerOpen: TTimer
    Enabled = False
    OnTimer = TimerOpenTimer
    Left = 464
    Top = 8
  end
  object cdsClienteImportacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 40
  end
  object dtsClientes: TDataSource
    DataSet = qryClientes
    Left = 440
    Top = 248
  end
end
