object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'ClientRest'
  ClientHeight = 341
  ClientWidth = 489
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
  object gridClientes: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 483
    Height = 279
    Align = alClient
    DataSource = dtsClientes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object navigatorClientes: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 288
    Width = 483
    Height = 50
    DataSource = dtsClientes
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates]
    Align = alBottom
    TabOrder = 1
    OnClick = navigatorClientesClick
  end
  object Button1: TButton
    Left = 392
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object dtsClientes: TDataSource
    DataSet = memClientes
    Left = 240
    Top = 184
  end
  object memClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 240
    Top = 120
  end
  object timerOpen: TTimer
    Enabled = False
    OnTimer = timerOpenTimer
    Left = 432
    Top = 16
  end
end
