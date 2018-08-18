object frmPrincipalTestes: TfrmPrincipalTestes
  Left = 0
  Top = 0
  Caption = 'Teste Comps'
  ClientHeight = 357
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 112
    Width = 564
    Height = 245
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    object gridDados: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 50
      Width = 556
      Height = 191
      Align = alClient
      DataSource = dtsDados
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object navigatorDados: TDBNavigator
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 556
      Height = 40
      DataSource = dtsDados
      Align = alTop
      TabOrder = 0
    end
  end
  object PanelObrigatorio1: TPanelObrigatorio
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 294
    Height = 106
    Align = alLeft
    DataSource = dtsDados
    DesenhaObrigatorios = False
    Notifica = PanelObrigatorio1Notifica
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Codigo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 134
      Height = 21
      DataField = 'Codigo'
      DataSource = dtsDados
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 72
      Width = 2604
      Height = 21
      DataField = 'Nome'
      DataSource = dtsDados
      TabOrder = 1
    end
  end
  object dtsDados: TDataSource
    DataSet = memDados
    Left = 216
    Top = 264
  end
  object memDados: TFDMemTable
    BeforePost = memDadosBeforePost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 312
    Top = 256
    object memDadosCodigo: TIntegerField
      FieldName = 'Codigo'
      Required = True
    end
    object memDadosNome: TStringField
      DisplayWidth = 200
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
  end
end
