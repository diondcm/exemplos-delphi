object Form1: TForm1
  Left = 271
  Top = 114
  Caption = 'Form1'
  ClientHeight = 407
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object ButtonStart: TButton
    Left = 24
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 105
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 24
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 24
    Top = 112
    Width = 107
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 305
    Top = 3
    Width = 313
    Height = 401
    Align = alRight
    Lines.Strings = (
      'MemoLog')
    TabOrder = 4
    ExplicitLeft = 300
    ExplicitTop = 8
  end
  object ButtonGet: TButton
    Left = 24
    Top = 176
    Width = 107
    Height = 41
    Caption = 'Get'
    TabOrder = 5
    OnClick = ButtonGetClick
  end
  object Edit1: TEdit
    Left = 24
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 288
    Top = 24
  end
  object RESTClient: TRESTClient
    BaseURL = 
      'https://rest.bitcoin.com/v2/address/details/bitcoincash:qzs02v05' +
      'l7qs5s24srqju498qu55dwuj0cx5ehjm2c'
    Params = <>
    Left = 472
    Top = 120
  end
  object RESTResponse1: TRESTResponse
    Left = 520
    Top = 184
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 424
    Top = 184
  end
end
