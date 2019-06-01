object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 410
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 256
    Width = 683
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = 8
    ExplicitTop = 278
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 80
    Width = 677
    Height = 173
    Align = alClient
    DataSource = dtsPessoa
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 677
    Height = 46
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 133
      Height = 38
      Align = alLeft
      Caption = 'Carrega Dados'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 544
      Top = 4
      Width = 129
      Height = 38
      Align = alRight
      Caption = 'Envia Dados'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGrid2: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 262
    Width = 677
    Height = 120
    Align = alBottom
    DataSource = dtsProduto
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 52
    Width = 683
    Height = 25
    DataSource = dtsPessoa
    Align = alTop
    TabOrder = 3
  end
  object DBNavigator2: TDBNavigator
    Left = 0
    Top = 385
    Width = 683
    Height = 25
    DataSource = dtsProduto
    Align = alBottom
    TabOrder = 4
  end
  object dtsPessoa: TDataSource
    DataSet = memPessoa
    Left = 360
    Top = 136
  end
  object memProduto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 456
    Top = 312
  end
  object dtsProduto: TDataSource
    DataSet = memProduto
    Left = 360
    Top = 312
  end
  object memPessoa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 432
    Top = 144
  end
end
