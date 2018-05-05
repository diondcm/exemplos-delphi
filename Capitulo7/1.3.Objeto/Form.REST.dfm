object frmREST: TfrmREST
  Left = 0
  Top = 0
  Caption = 'REST'
  ClientHeight = 424
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 326
    Width = 586
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 47
    ExplicitWidth = 282
  end
  object memoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 332
    Width = 580
    Height = 89
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 208
    ExplicitTop = 184
    ExplicitWidth = 185
  end
  object panelControle: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 580
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    OnClick = panelControleClick
    object buttonCarregaInfos: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 94
      Height = 48
      Align = alLeft
      Caption = 'Carrega infos'
      TabOrder = 0
      OnClick = buttonCarregaInfosClick
      ExplicitLeft = 163
      ExplicitTop = -5
    end
    object buttonCarregaGrid: TButton
      AlignWithMargins = True
      Left = 103
      Top = 3
      Width = 94
      Height = 48
      Align = alLeft
      Caption = 'Carrega Grid'
      TabOrder = 1
      OnClick = buttonCarregaGridClick
      ExplicitLeft = 147
      ExplicitTop = 6
    end
  end
  object StringGrid1: TStringGrid
    Tag = 2
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 580
    Height = 223
    Align = alClient
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    ExplicitLeft = 144
    ExplicitTop = 58
    ExplicitWidth = 320
    ExplicitHeight = 120
    ColWidths = (
      64
      64)
  end
  object NavigatorBindSourceDB1: TBindNavigator
    Left = 0
    Top = 60
    Width = 586
    Height = 37
    DataSource = BindSourceDB1
    Align = alTop
    Orientation = orHorizontal
    TabOrder = 3
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 440
    Top = 80
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    Params = <>
    HandleRedirects = True
    Left = 240
    Top = 240
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 200
    Top = 168
  end
  object RESTResponse1: TRESTResponse
    Left = 296
    Top = 168
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Dataset = memDados
    FieldDefs = <>
    Response = RESTResponse1
    Left = 360
    Top = 240
  end
  object memDados: TFDMemTable
    OnCalcFields = memDadosCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 312
    Top = 336
    object memDadosdateAt: TStringField
      FieldName = 'dateAt'
    end
    object memDadosvalue: TStringField
      FieldName = 'value'
    end
    object memDadosData: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Data'
      Calculated = True
    end
    object memDadosValor: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Valor'
      Calculated = True
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = memDados
    ScopeMappings = <>
    Left = 296
    Top = 216
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <>
    end
  end
end
