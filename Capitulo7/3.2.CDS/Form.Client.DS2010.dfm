object frmClientDS2010: TfrmClientDS2010
  Left = 0
  Top = 0
  Caption = 'DS 2010'
  ClientHeight = 346
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object navigator2010: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 501
    Height = 38
    DataSource = dtsDS2010
    Align = alTop
    TabOrder = 0
  end
  object gridDS2010: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 501
    Height = 296
    Align = alClient
    DataSource = dtsDS2010
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object timerOpen: TTimer
    Enabled = False
    OnTimer = timerOpenTimer
    Left = 424
    Top = 64
  end
  object cdsDS2010: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dtsOrders'
    RemoteServer = DSProviderConnection1
    Left = 424
    Top = 168
  end
  object dtsDS2010: TDataSource
    DataSet = cdsDS2010
    Left = 424
    Top = 216
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = ClientModule1.SQLConnection1
    Left = 424
    Top = 112
  end
end
