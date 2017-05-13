object frmMAsterDetail: TfrmMAsterDetail
  Left = 0
  Top = 0
  Caption = 'Mestre/Detalhe'
  ClientHeight = 489
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 205
    Width = 655
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 0
    ExplicitWidth = 256
  end
  object dbgDetail: TDBGrid
    Left = 0
    Top = 208
    Width = 655
    Height = 281
    Align = alBottom
    DataSource = dtsDetail
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbgMaster: TDBGrid
    Left = 0
    Top = 41
    Width = 655
    Height = 164
    Align = alClient
    DataSource = dtsMaster
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 192
    ExplicitTop = 77
    ExplicitWidth = 185
    object btnAtualizaDados: TButton
      Left = 8
      Top = 10
      Width = 113
      Height = 25
      Caption = 'Atualiza Dados'
      TabOrder = 0
      OnClick = btnAtualizaDadosClick
    end
  end
  object dtsMaster: TDataSource
    DataSet = cdsMaster
    OnDataChange = dtsMasterDataChange
    Left = 184
    Top = 128
  end
  object dtsDetail: TDataSource
    DataSet = cdsDetail
    Left = 328
    Top = 256
  end
  object cdsMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 80
    object cdsMasterID: TIntegerField
      FieldName = 'ID'
    end
    object cdsMasterDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object cdsMasterDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsMasterUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 50
    end
    object cdsMasterVALOR_TOTAL: TCurrencyField
      FieldName = 'VALOR_TOTAL'
    end
  end
  object cdsDetail: TClientDataSet
    Aggregates = <>
    MasterSource = dtsMaster
    PacketRecords = 0
    Params = <>
    Left = 328
    Top = 216
    object cdsDetailID: TIntegerField
      FieldName = 'ID'
    end
    object cdsDetailDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsDetailVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object cdsDetailID_MASTER: TIntegerField
      FieldName = 'ID_MASTER'
    end
  end
end
