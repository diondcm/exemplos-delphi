object frmETLExemplo: TfrmETLExemplo
  Left = 0
  Top = 0
  Caption = 'Exemplo ETL'
  ClientHeight = 385
  ClientWidth = 642
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 642
    Height = 385
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Componentes'
      object PanelControles: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 628
        Height = 41
        Align = alTop
        TabOrder = 0
        object ButtonDadosToDados: TButton
          AlignWithMargins = True
          Left = 528
          Top = 4
          Width = 96
          Height = 33
          Align = alRight
          Caption = 'Dados -> Dados'
          TabOrder = 0
          OnClick = ButtonDadosToDadosClick
        end
        object ButtonTextoToText: TButton
          AlignWithMargins = True
          Left = 426
          Top = 4
          Width = 96
          Height = 33
          Align = alRight
          Caption = 'Text -> Text'
          TabOrder = 1
          OnClick = ButtonTextoToTextClick
        end
        object ButtonTextToDados: TButton
          AlignWithMargins = True
          Left = 106
          Top = 4
          Width = 96
          Height = 33
          Align = alLeft
          Caption = 'Text -> Dados'
          TabOrder = 2
          OnClick = ButtonTextToDadosClick
        end
        object ButtonDadosToText: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 96
          Height = 33
          Align = alLeft
          Caption = 'Dados -> Text'
          TabOrder = 3
          OnClick = ButtonDadosToTextClick
        end
      end
      object PanelDados: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 50
        Width = 628
        Height = 304
        Align = alClient
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 297
          Top = 1
          Height = 302
          ExplicitLeft = 353
          ExplicitTop = -47
        end
        object PanelEntrada: TPanel
          Left = 1
          Top = 1
          Width = 296
          Height = 302
          Align = alLeft
          TabOrder = 0
          object Splitter2: TSplitter
            Left = 1
            Top = 145
            Width = 294
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitTop = 90
            ExplicitWidth = 211
          end
          object MemoDadosEntrada: TMemo
            Left = 1
            Top = 1
            Width = 294
            Height = 144
            Align = alTop
            TabOrder = 0
          end
          object DBGridEntrada: TDBGrid
            Left = 1
            Top = 148
            Width = 294
            Height = 153
            Align = alClient
            DataSource = DataSource1
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object PanelSaida: TPanel
          Left = 300
          Top = 1
          Width = 327
          Height = 302
          Align = alClient
          TabOrder = 1
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 325
            Height = 300
            Align = alClient
            TabOrder = 0
            object Splitter3: TSplitter
              Left = 1
              Top = 152
              Width = 323
              Height = 3
              Cursor = crVSplit
              Align = alTop
              ExplicitLeft = 5
              ExplicitTop = 209
            end
            object MemoDadosSaida: TMemo
              Left = 1
              Top = 155
              Width = 323
              Height = 144
              Align = alClient
              TabOrder = 0
            end
            object DBGridDadosSaida: TDBGrid
              Left = 1
              Top = 1
              Width = 323
              Height = 151
              Align = alTop
              DataSource = DataSource2
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Processo'
      ImageIndex = 1
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 628
        Height = 21
        Align = alTop
        Caption = 'Processo de Exemplo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 181
      end
      object Label2: TLabel
        Left = 271
        Top = 64
        Width = 68
        Height = 57
        Caption = '=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -47
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 56
        Top = 189
        Width = 549
        Height = 116
        AutoSize = False
        Caption = 'Realizar For; em toda a lista de clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -47
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Memo1: TMemo
        Left = 3
        Top = 32
        Width = 262
        Height = 113
        Lines.Strings = (
          '-- Agrupa clientes com pedidos'
          'select IDCLIENTE, count(distinct '
          'IDPEDIDO)'
          'from pedido'
          'group by IDCLIENTE'
          'having count(distinct IDPEDIDO) >  12'
          ''
          '--[4822, 3118, 3822]')
        TabOrder = 0
      end
      object Memo2: TMemo
        Left = 355
        Top = 30
        Width = 262
        Height = 113
        Lines.Strings = (
          '-- Classifica os dados dos Clientes'
          'select sum(p.total) total, strftime('#39'%Y%m'#39', '
          'p.emissao) ano'
          'from pedido p'
          'where p.idcliente = 4822'
          'group by strftime('#39'%Y%m'#39', p.emissao)'
          ''
          '--Um dos clientes da lista anterior [4822]')
        TabOrder = 1
      end
    end
  end
  object FDBatchMove1: TFDBatchMove
    Reader = FDBatchMoveTextReader1
    Writer = FDBatchMoveTextWriter1
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 296
    Top = 88
  end
  object FDBatchMoveTextReader1: TFDBatchMoveTextReader
    DataDef.Fields = <>
    Left = 112
    Top = 136
  end
  object FDBatchMoveTextWriter1: TFDBatchMoveTextWriter
    DataDef.Fields = <>
    Left = 480
    Top = 128
  end
  object FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader
    Left = 112
    Top = 264
  end
  object FDBatchMoveDataSetWriter1: TFDBatchMoveDataSetWriter
    Left = 480
    Top = 264
  end
  object DataSource1: TDataSource
    DataSet = qryExport
    Left = 112
    Top = 320
  end
  object DataSource2: TDataSource
    DataSet = qryImport
    Left = 480
    Top = 320
  end
  object qryImport: TFDQuery
    Connection = dmdDados.FDConnection
    SQL.Strings = (
      'select * from import')
    Left = 376
    Top = 224
  end
  object qryExport: TFDQuery
    Connection = dmdDados.FDConnection
    SQL.Strings = (
      'select * from export')
    Left = 184
    Top = 224
  end
end
