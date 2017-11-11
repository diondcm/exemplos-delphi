object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplos'
  ClientHeight = 679
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object memoExtrato: TMemo
    Left = 615
    Top = 0
    Width = 291
    Height = 499
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 608
    ExplicitHeight = 384
  end
  object buttonExtrato: TBitBtn
    Left = 16
    Top = 166
    Width = 105
    Height = 73
    Caption = 'Consulta Extrato'
    TabOrder = 1
    OnClick = buttonExtratoClick
  end
  object buttonAddTransacao: TBitBtn
    Left = 16
    Top = 8
    Width = 105
    Height = 73
    Caption = 'Add Transacao'
    TabOrder = 2
    OnClick = buttonAddTransacaoClick
  end
  object buttonGerarTrs: TBitBtn
    Left = 16
    Top = 87
    Width = 105
    Height = 73
    Caption = 'Gerar Transa'#231#245'es'
    TabOrder = 3
    OnClick = buttonGerarTrsClick
  end
  object editCodigo: TEdit
    Left = 144
    Top = 34
    Width = 105
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    TextHint = 'C'#243'digo'
  end
  object editValor: TEdit
    Left = 255
    Top = 34
    Width = 106
    Height = 21
    TabOrder = 5
    TextHint = 'Valor'
  end
  object dateData: TDateTimePicker
    Left = 376
    Top = 34
    Width = 106
    Height = 21
    Date = 43036.680301631950000000
    Time = 43036.680301631950000000
    TabOrder = 6
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 660
    Width = 906
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitTop = 545
    ExplicitWidth = 899
  end
  object gridTransacoes: TDBGrid
    Left = 0
    Top = 499
    Width = 906
    Height = 161
    Align = alBottom
    DataSource = dtsTransacoes
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object buttonAplicar: TBitBtn
    Left = 144
    Top = 87
    Width = 105
    Height = 73
    Caption = 'Aplica Comiss'#227'o'
    TabOrder = 9
    OnClick = buttonAplicarClick
  end
  object buttonCarregaObjs: TBitBtn
    Left = 16
    Top = 245
    Width = 105
    Height = 73
    Caption = 'Carrega Objs'
    TabOrder = 10
    OnClick = buttonCarregaObjsClick
  end
  object buttomGeraArquivo: TButton
    Left = 16
    Top = 324
    Width = 105
    Height = 77
    Caption = 'Gerar Arquivo'
    TabOrder = 11
    OnClick = buttomGeraArquivoClick
  end
  object TimerStatus: TTimer
    Enabled = False
    Interval = 2500
    OnTimer = TimerStatusTimer
    Left = 440
    Top = 288
  end
  object memTransacoes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 112
    object memTransacoesDATA: TDateField
      FieldName = 'DATA'
    end
    object memTransacoesVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object memTransacoesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
  object dtsTransacoes: TDataSource
    DataSet = memTransacoes
    Left = 544
    Top = 432
  end
end
