object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Teste Panel'
  ClientHeight = 513
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelObrigatorio: TPanelObrigatorio
    Left = 8
    Top = 14
    Width = 274
    Height = 252
    DataSource = dtsCampos
    DesenhaObrigatorios = False
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel
      Left = 24
      Top = 104
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 24
      Top = 144
      Width = 70
      Height = 13
      Caption = 'Data Cadastro'
    end
    object Label5: TLabel
      Left = 24
      Top = 190
      Width = 54
      Height = 13
      Caption = 'Valor Inicial'
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 37
      Width = 121
      Height = 21
      DataField = 'ID'
      DataSource = dtsCampos
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 83
      Width = 121
      Height = 21
      DataField = 'Codigo'
      DataSource = dtsCampos
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 117
      Width = 121
      Height = 21
      DataField = 'Nome'
      DataSource = dtsCampos
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 24
      Top = 163
      Width = 121
      Height = 21
      DataField = 'DataCadastro'
      DataSource = dtsCampos
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 24
      Top = 203
      Width = 121
      Height = 21
      DataField = 'ValorInicial'
      DataSource = dtsCampos
      TabOrder = 4
    end
  end
  object memLog: TMemo
    Left = 323
    Top = 217
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 635
    Top = 136
    Width = 241
    Height = 124
    Caption = 'Panel1'
    TabOrder = 2
    object Edit1: TEdit
      Left = 64
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 64
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 64
      Top = 83
      Width = 121
      Height = 21
      BevelInner = bvSpace
      BevelOuter = bvRaised
      BevelKind = bkTile
      BevelWidth = 5
      Color = clGrayText
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 312
    Width = 884
    Height = 201
    Align = alBottom
    DataSource = dtsCampos
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object buttonValidaCampos: TButton
    Left = 8
    Top = 272
    Width = 193
    Height = 34
    Caption = 'buttonValidaCampos'
    TabOrder = 4
    OnClick = buttonValidaCamposClick
  end
  object dtsCampos: TDataSource
    DataSet = memCampos
    Left = 456
    Top = 40
  end
  object memCampos: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 40
    object memCamposID: TIntegerField
      FieldName = 'ID'
    end
    object memCamposCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
    end
    object memCamposNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
    object memCamposDataCadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DataCadastro'
    end
    object memCamposValorInicial: TCurrencyField
      DisplayLabel = 'Valor Inicial'
      FieldName = 'ValorInicial'
      Required = True
    end
  end
end
