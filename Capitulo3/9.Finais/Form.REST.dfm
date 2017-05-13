object frmREST: TfrmREST
  Left = 0
  Top = 0
  Caption = 'REST'
  ClientHeight = 436
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memLog: TMemo
    Left = 220
    Top = 0
    Width = 211
    Height = 436
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 440
  end
  object btnExecuta: TButton
    Left = 8
    Top = 8
    Width = 129
    Height = 49
    Caption = 'Executa'
    TabOrder = 1
    OnClick = btnExecutaClick
  end
  object edtURL: TEdit
    Left = 8
    Top = 63
    Width = 169
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'https://httpbin.org/get'
    TextHint = 'URL'
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
    Left = 8
    Top = 96
  end
end
