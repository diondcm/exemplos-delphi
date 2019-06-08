object frmPanelTest: TfrmPanelTest
  Left = 0
  Top = 0
  Caption = 'Teste Panel'
  ClientHeight = 383
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 263
    Width = 740
    Height = 120
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 224
    Width = 740
    Height = 39
    DataSource = DataSource1
    Align = alBottom
    TabOrder = 1
  end
  object PanelObrigatorio1: TPanelObrigatorio
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 734
    Height = 218
    Align = alClient
    DataSource = DataSource1
    object DBEdit1: TDBEdit
      Left = 224
      Top = 48
      Width = 121
      Height = 21
      DataField = 'Nome'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 224
      Top = 88
      Width = 121
      Height = 21
      DataField = 'id'
      DataSource = DataSource1
      TabOrder = 1
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 88
    Top = 192
    object FDMemTable1id: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object FDMemTable1Nome: TStringField
      FieldName = 'Nome'
      Required = True
    end
    object FDMemTable1DataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 88
    Top = 272
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 368
    Top = 200
  end
end
