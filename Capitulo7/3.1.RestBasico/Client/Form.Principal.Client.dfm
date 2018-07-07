object frmPrincipalClient: TfrmPrincipalClient
  Left = 0
  Top = 0
  Caption = 'Client REST'
  ClientHeight = 402
  ClientWidth = 450
  Color = clBtnFace
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panelDatas: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 33
    Width = 430
    Height = 359
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 24
    ExplicitWidth = 416
    object labelDataDelphi: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 422
      Height = 19
      Align = alTop
      Caption = 'Data Delphi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 96
    end
    object labelDataIso8601: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 29
      Width = 422
      Height = 19
      Align = alTop
      Caption = 'Iso 8601'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 70
    end
    object labelDataUnix: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 54
      Width = 422
      Height = 19
      Align = alTop
      Caption = 'Data Unix'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 81
    end
  end
  object checkAtualizaData: TCheckBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 444
    Height = 17
    Align = alTop
    Caption = 'Atualizar'
    TabOrder = 1
    OnClick = checkAtualizaDataClick
    ExplicitLeft = 16
    ExplicitTop = 32
    ExplicitWidth = 97
  end
  object timerData: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = timerDataTimer
    Left = 336
    Top = 176
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
    Left = 184
    Top = 160
  end
end
