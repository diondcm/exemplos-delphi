object frmPrincpial: TfrmPrincpial
  Left = 0
  Top = 0
  Caption = 'Client DS'
  ClientHeight = 468
  ClientWidth = 763
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
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 757
    Height = 462
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'idHTTP'
      ExplicitLeft = 0
      object MemoLog: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 30
        Width = 743
        Height = 401
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 200
        ExplicitTop = 128
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
      object EditURL: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 743
        Height = 21
        Align = alTop
        TabOrder = 1
        OnKeyDown = EditURLKeyDown
        ExplicitLeft = 312
        ExplicitTop = 208
        ExplicitWidth = 121
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'RESTAdapter'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
    object TabSheet3: TTabSheet
      Caption = 'Proxys'
      ImageIndex = 2
      ExplicitLeft = 0
      object Button1: TButton
        Left = 16
        Top = 16
        Width = 137
        Height = 49
        Caption = 'Get Pessoas'
        TabOrder = 0
        OnClick = Button1Click
      end
      object ListBoxPessoa: TListBox
        Left = 16
        Top = 112
        Width = 273
        Height = 319
        ItemHeight = 13
        TabOrder = 1
      end
    end
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
    Left = 680
    Top = 120
  end
  object RESTClient1: TRESTClient
    Params = <>
    Left = 608
    Top = 288
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 512
    Top = 232
  end
  object RESTResponse1: TRESTResponse
    Left = 607
    Top = 235
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    FieldDefs = <>
    Left = 608
    Top = 344
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 608
    Top = 400
  end
end
