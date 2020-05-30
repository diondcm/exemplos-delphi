object frmPrincipalCliente: TfrmPrincipalCliente
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 454
  ClientWidth = 571
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
  object PageControlGeral: TPageControl
    Left = 0
    Top = 0
    Width = 571
    Height = 454
    ActivePage = TabCliente
    Align = alClient
    TabOrder = 0
    object TabDados: TTabSheet
      Caption = 'Cliente'
      ExplicitWidth = 465
      ExplicitHeight = 357
      object PanelControles: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 557
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 11
        ExplicitWidth = 459
        object ButtonGetDados: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 75
          Height = 33
          Align = alLeft
          Caption = 'Get Dados'
          TabOrder = 0
          OnClick = ButtonGetDadosClick
        end
        object ButtonArqs: TButton
          AlignWithMargins = True
          Left = 478
          Top = 4
          Width = 75
          Height = 33
          Align = alRight
          Caption = 'Arquivos'
          TabOrder = 1
          ExplicitLeft = 380
        end
      end
      object DBNavigatorCliente: TDBNavigator
        AlignWithMargins = True
        Left = 3
        Top = 50
        Width = 557
        Height = 25
        DataSource = dtsCliente
        Align = alTop
        TabOrder = 1
        ExplicitTop = 67
      end
      object DBGridCliente: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 81
        Width = 557
        Height = 342
        Align = alClient
        DataSource = dtsCliente
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabImagem: TTabSheet
      Caption = 'Imagem'
      ImageIndex = 1
      ExplicitWidth = 465
      ExplicitHeight = 357
      object Image1: TImage
        Left = 304
        Top = 50
        Width = 249
        Height = 167
        Proportional = True
      end
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 557
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 11
        object ButtonImagem: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 75
          Height = 33
          Align = alLeft
          Caption = 'Imagem'
          TabOrder = 0
          OnClick = ButtonImagemClick
          ExplicitLeft = 478
        end
        object ButtonGetItem: TButton
          AlignWithMargins = True
          Left = 85
          Top = 4
          Width = 75
          Height = 33
          Align = alLeft
          Caption = 'Itens'
          TabOrder = 1
          OnClick = ButtonGetItemClick
          ExplicitLeft = 144
          ExplicitTop = 8
          ExplicitHeight = 25
        end
        object ComboItems: TComboBox
          AlignWithMargins = True
          Left = 166
          Top = 9
          Width = 145
          Height = 21
          Margins.Top = 8
          Margins.Bottom = 8
          Align = alLeft
          Style = csDropDownList
          TabOrder = 2
          Items.Strings = (
            'Logo'
            'Background'
            'Help')
        end
      end
    end
    object TabCliente: TTabSheet
      Caption = 'Cliente Com Adapter'
      ImageIndex = 2
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 557
        Height = 379
        Align = alClient
        DataSource = dtsCleintesAdapter
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 563
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitLeft = 192
        ExplicitTop = 192
        ExplicitWidth = 185
        object DBNavigator1: TDBNavigator
          AlignWithMargins = True
          Left = 85
          Top = 4
          Width = 474
          Height = 33
          DataSource = dtsCleintesAdapter
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 4
          ExplicitWidth = 200
          ExplicitHeight = 25
        end
        object ButtonOpen: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 75
          Height = 33
          Align = alLeft
          Caption = 'Open'
          TabOrder = 1
          OnClick = ButtonOpenClick
          ExplicitLeft = 248
          ExplicitTop = 8
          ExplicitHeight = 25
        end
      end
    end
  end
  object EMSProvider1: TEMSProvider
    ApiVersion = '2'
    URLHost = 'localhost'
    URLPort = 8080
    Left = 16
    Top = 72
  end
  object EMSFireDACClient1: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter1
    Resource = 'cliente'
    Left = 16
    Top = 136
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 16
    Top = 216
  end
  object FDTableAdapter1: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter1
    DatSTableName = 'CLIENTE'
    Left = 16
    Top = 264
  end
  object memCliente: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = FDTableAdapter1
    Left = 16
    Top = 320
  end
  object dtsCliente: TDataSource
    DataSet = memCliente
    Left = 16
    Top = 376
  end
  object IdHTTPImagem: TIdHTTP
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
    Left = 112
    Top = 64
  end
  object dtsCleintesAdapter: TDataSource
    Left = 432
    Top = 344
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json'
    BaseURL = 'http://localhost:8080/cliente/CLIENTE'
    Params = <>
    Left = 352
    Top = 112
  end
  object RESTResponse1: TRESTResponse
    Left = 296
    Top = 168
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 408
    Top = 168
  end
end
