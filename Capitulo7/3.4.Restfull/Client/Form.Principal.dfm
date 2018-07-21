object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'ClientRest'
  ClientHeight = 471
  ClientWidth = 801
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
  object Splitter1: TSplitter
    Left = 0
    Top = 233
    Width = 801
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 159
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 233
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = 40
    ExplicitTop = 64
    ExplicitWidth = 497
    object gridClientes: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 793
      Height = 169
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
      Left = 4
      Top = 179
      Width = 793
      Height = 50
      DataSource = dtsClientes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates]
      Align = alBottom
      TabOrder = 1
      OnClick = navigatorClientesClick
      ExplicitLeft = 3
      ExplicitTop = 288
      ExplicitWidth = 483
    end
    object Button1: TButton
      Left = 4
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 85
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object panelCotacao: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 239
    Width = 795
    Height = 229
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 8
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 381
      Height = 221
      Align = alClient
      DataSource = dtsCotacao
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBChart1: TDBChart
      AlignWithMargins = True
      Left = 391
      Top = 4
      Width = 400
      Height = 221
      Title.Text.Strings = (
        'TDBChart')
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 200
      ExplicitTop = 3
      ExplicitHeight = 250
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TLineSeries
        DataSource = memCotacao
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        XValues.ValueSource = 'data'
        YValues.Name = 'Y'
        YValues.Order = loNone
        YValues.ValueSource = 'valor'
      end
    end
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
    Left = 504
    Top = 16
  end
  object memCotacao: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 208
    Top = 248
  end
  object dtsCotacao: TDataSource
    DataSet = memCotacao
    Left = 208
    Top = 304
  end
end
