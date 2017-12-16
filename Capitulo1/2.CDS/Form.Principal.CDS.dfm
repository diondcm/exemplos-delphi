object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 485
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgAcao: TDBGrid
    Left = 0
    Top = 175
    Width = 902
    Height = 108
    Align = alClient
    DataSource = dtsAcao
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SIGLA'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_TOTAL_ACOES'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_ACOES_QUE_PODE_COMPRAR'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERCENTUAL_DE_COMPRA'
        Visible = True
      end>
  end
  object dbnAcao: TDBNavigator
    Left = 0
    Top = 150
    Width = 902
    Height = 25
    DataSource = dtsAcao
    Align = alTop
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 902
    Height = 150
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
    object Label2: TLabel
      Left = 24
      Top = 6
      Width = 29
      Height = 13
      Caption = 'SIGLA'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 24
      Top = 46
      Width = 59
      Height = 13
      Caption = 'DESCRICAO'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 24
      Top = 86
      Width = 33
      Height = 13
      Caption = 'VALOR'
      FocusControl = DBEdit4
    end
    object lblQuantidade: TLabel
      Left = 630
      Top = 93
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object lblValorInvestimento: TLabel
      Left = 441
      Top = 46
      Width = 71
      Height = 13
      Caption = 'Valor a investir'
    end
    object Label1: TLabel
      Left = 190
      Top = 86
      Width = 99
      Height = 13
      Caption = 'QTD_TOTAL_ACOES'
      FocusControl = DBEdit1
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 22
      Width = 134
      Height = 21
      DataField = 'SIGLA'
      DataSource = dtsAcao
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 62
      Width = 300
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = dtsAcao
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 102
      Width = 134
      Height = 21
      DataField = 'VALOR'
      DataSource = dtsAcao
      TabOrder = 2
    end
    object edtQuantidade: TEdit
      Left = 630
      Top = 112
      Width = 56
      Height = 21
      NumbersOnly = True
      TabOrder = 3
      Text = '200'
    end
    object edtValorInvestimento: TEdit
      Left = 441
      Top = 62
      Width = 121
      Height = 21
      TabOrder = 4
      OnKeyPress = edtValorInvestimentoKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 190
      Top = 102
      Width = 134
      Height = 21
      DataField = 'QTD_TOTAL_ACOES'
      DataSource = dtsAcao
      TabOrder = 5
    end
  end
  object pnlResumo: TPanel
    Left = 0
    Top = 283
    Width = 902
    Height = 41
    Align = alBottom
    TabOrder = 3
    object lblVlrMedioAcao: TLabel
      Left = 107
      Top = 9
      Width = 64
      Height = 13
      Caption = 'VlrMedioA'#231#227'o'
    end
    object dbeVlrMedioAcao: TDBEdit
      Left = 181
      Top = 6
      Width = 121
      Height = 21
      DataField = 'VLR_MEDIO_ACAO'
      DataSource = dtsAcao
      TabOrder = 0
    end
  end
  object pnlHistorico: TPanel
    Left = 0
    Top = 324
    Width = 902
    Height = 41
    Align = alBottom
    TabOrder = 4
    object btnVisualizaHistorico: TButton
      Left = 24
      Top = 6
      Width = 131
      Height = 25
      Caption = 'Visualiza Historico'
      TabOrder = 0
      OnClick = btnVisualizaHistoricoClick
    end
  end
  object dbgHistorico: TDBGrid
    Left = 0
    Top = 365
    Width = 902
    Height = 120
    Align = alBottom
    DataSource = dtsHistorico
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dtsAcao: TDataSource
    DataSet = cdsAcao
    Left = 760
    Top = 208
  end
  object cdsAcao: TClientDataSet
    PersistDataPacket.Data = {
      A40000009619E0BD010000001800000006000000000003000000A40002494404
      00010000000000055349474C410100490000000100055749445448020002000A
      000944455343524943414F010049000000010005574944544802000200640005
      56414C4F52080004000000010007535542545950450200490006004D6F6E6579
      00044441544108000800000000000F5154445F544F54414C5F41434F45530400
      0100000000000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    AfterPost = cdsAcaoAfterPost
    OnCalcFields = cdsAcaoCalcFields
    OnNewRecord = cdsAcaoNewRecord
    Left = 760
    Top = 256
    object cdsAcaoID: TIntegerField
      DisplayWidth = 12
      FieldName = 'ID'
    end
    object cdsAcaoSIGLA: TStringField
      DisplayWidth = 20
      FieldName = 'SIGLA'
      Size = 10
    end
    object cdsAcaoDESCRICAO: TStringField
      DisplayWidth = 120
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsAcaoVALOR: TCurrencyField
      DisplayWidth = 12
      FieldName = 'VALOR'
    end
    object cdsAcaoDATA: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DATA'
    end
    object cdsAcaoQTD_TOTAL_ACOES: TIntegerField
      FieldName = 'QTD_TOTAL_ACOES'
    end
    object cdsAcaoQTD_ACOES_QUE_PODE_COMPRAR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'QTD_ACOES_QUE_PODE_COMPRAR'
    end
    object cdsAcaoVALOR_TOTAL: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOTAL'
    end
    object cdsAcaoPERCENTUAL_DE_COMPRA: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'PERCENTUAL_DE_COMPRA'
    end
    object cdsAcaoVLR_MEDIO_ACAO: TAggregateField
      FieldName = 'VLR_MEDIO_ACAO'
      Active = True
      DisplayName = ''
      Expression = 'AVG(VALOR)'
    end
  end
  object dtsHistorico: TDataSource
    DataSet = cdsHistorico
    Left = 744
    Top = 376
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 744
    Top = 432
  end
end
