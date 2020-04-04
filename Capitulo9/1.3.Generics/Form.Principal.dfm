object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Generics'
  ClientHeight = 395
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ListBoxCores: TListBox
    AlignWithMargins = True
    Left = 448
    Top = 60
    Width = 193
    Height = 332
    Align = alRight
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBoxCoresClick
    ExplicitTop = 3
    ExplicitHeight = 389
  end
  object PanelAddCor: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 57
    Align = alTop
    TabOrder = 1
    object EditCor: TEdit
      AlignWithMargins = True
      Left = 155
      Top = 16
      Width = 121
      Height = 25
      Margins.Top = 15
      Margins.Bottom = 15
      Align = alLeft
      TabOrder = 0
      OnKeyDown = EditCorKeyDown
      ExplicitLeft = 180
    end
    object ButtonAdd: TButton
      AlignWithMargins = True
      Left = 282
      Top = 4
      Width = 75
      Height = 49
      Align = alLeft
      Caption = 'Add'
      TabOrder = 1
      OnClick = ButtonAddClick
      ExplicitLeft = 411
      ExplicitTop = 5
    end
    object ColorBoxCor: TColorBox
      AlignWithMargins = True
      Left = 4
      Top = 16
      Width = 145
      Height = 22
      Margins.Top = 15
      Margins.Bottom = 15
      Align = alLeft
      TabOrder = 2
      ExplicitLeft = 248
    end
    object Button1: TButton
      Left = 376
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 457
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 566
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 5
      OnClick = Button3Click
    end
  end
  object PanelCor: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 439
    Height = 332
    Align = alClient
    Caption = 'Cor Selecionada'
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 128
    ExplicitTop = 232
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 185
      Height = 330
      Align = alLeft
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
      ExplicitLeft = 144
      ExplicitTop = 120
      ExplicitHeight = 89
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 264
    Top = 160
    Width = 300
    Height = 150
    TabOrder = 3
    ControlData = {
      4C000000021F0000810F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
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
    Left = 520
  end
  object Timer1: TTimer
    Left = 552
    Top = 104
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 520
    Top = 48
  end
end
