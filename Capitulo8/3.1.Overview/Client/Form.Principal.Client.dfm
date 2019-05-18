object frmTesteCargaPrincipal: TfrmTesteCargaPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste Carga Simples'
  ClientHeight = 447
  ClientWidth = 662
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
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 656
    Height = 62
    Align = alTop
    TabOrder = 0
    object EditURL: TEdit
      Left = 8
      Top = 20
      Width = 425
      Height = 21
      TabOrder = 0
      Text = 'http://localhost:8080/datasnap/rest/TSMGeral/GetDataServer'
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 577
      Top = 4
      Width = 75
      Height = 54
      Align = alRight
      Caption = 'GET'
      TabOrder = 1
      OnClick = Button1Click
      ExplicitTop = 8
    end
    object Button2: TButton
      Left = 488
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 656
    Height = 247
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitHeight = 373
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 324
    Width = 656
    Height = 120
    Align = alBottom
    DataSource = dtsPessoa
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object IdHTTP1: TIdHTTP
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
    Left = 480
    Top = 16
  end
  object dtsPessoa: TDataSource
    DataSet = memPessoa
    Left = 296
    Top = 344
  end
  object memPessoa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 384
    Top = 344
  end
end
