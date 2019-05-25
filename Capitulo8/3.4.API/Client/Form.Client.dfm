object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Client Balance'
  ClientHeight = 436
  ClientWidth = 559
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
  object Splitter1: TSplitter
    Left = 0
    Top = 161
    Width = 559
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 275
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 104
    ExplicitTop = 128
    ExplicitWidth = 185
    object Button1: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Get Balance'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 0
      ExplicitTop = 2
    end
    object ButtonInvalidate: TButton
      AlignWithMargins = True
      Left = 480
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Invalidate'
      TabOrder = 1
      OnClick = ButtonInvalidateClick
      ExplicitLeft = 120
      ExplicitTop = 10
      ExplicitHeight = 25
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 559
    Height = 120
    Align = alTop
    DataSource = dtsBalance
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 167
    Width = 553
    Height = 266
    Align = alClient
    DataSource = dtsTransactions
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dtsTransactions: TDataSource
    DataSet = memTransactions
    Left = 328
    Top = 200
  end
  object dtsBalance: TDataSource
    DataSet = memBalance
    Left = 304
    Top = 96
  end
  object memTransactions: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 416
    Top = 200
  end
  object memBalance: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 392
    Top = 96
  end
end
