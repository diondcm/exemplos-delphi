object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Panel Obrigat'#243'rio'
  ClientHeight = 544
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 400
    Top = 0
    Width = 331
    Height = 385
    Align = alRight
    Caption = 'Panel1'
    TabOrder = 0
    object Label9: TLabel
      Left = 16
      Top = 11
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label10: TLabel
      Left = 16
      Top = 52
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label11: TLabel
      Left = 16
      Top = 98
      Width = 70
      Height = 13
      Caption = 'Data Cadastro'
    end
    object Label12: TLabel
      Left = 16
      Top = 144
      Width = 26
      Height = 13
      Caption = 'Saldo'
      FocusControl = DBEdit12
    end
    object Label13: TLabel
      Left = 16
      Top = 184
      Width = 78
      Height = 13
      Caption = 'DataNascimento'
      FocusControl = DBEdit13
    end
    object Label14: TLabel
      Left = 16
      Top = 224
      Width = 14
      Height = 13
      Caption = 'RG'
      FocusControl = DBEdit14
    end
    object Label15: TLabel
      Left = 16
      Top = 264
      Width = 19
      Height = 13
      Caption = 'CPF'
      FocusControl = DBEdit15
    end
    object Label16: TLabel
      Left = 16
      Top = 304
      Width = 25
      Height = 13
      Caption = 'CNPJ'
      FocusControl = DBEdit16
    end
    object DBEdit9: TDBEdit
      Left = 16
      Top = 71
      Width = 121
      Height = 21
      DataField = 'Nome'
      DataSource = dtsCadastro
      TabOrder = 0
    end
    object DBEdit10: TDBEdit
      Left = 16
      Top = 30
      Width = 121
      Height = 21
      DataField = 'id'
      DataSource = dtsCadastro
      TabOrder = 1
    end
    object DBEdit11: TDBEdit
      Left = 16
      Top = 117
      Width = 121
      Height = 21
      DataField = 'DataCadastro'
      DataSource = dtsCadastro
      TabOrder = 2
    end
    object DBEdit12: TDBEdit
      Left = 16
      Top = 160
      Width = 134
      Height = 21
      DataField = 'Saldo'
      DataSource = dtsCadastro
      TabOrder = 3
    end
    object DBEdit13: TDBEdit
      Left = 16
      Top = 200
      Width = 134
      Height = 21
      DataField = 'DataNascimento'
      DataSource = dtsCadastro
      TabOrder = 4
    end
    object DBEdit14: TDBEdit
      Left = 16
      Top = 240
      Width = 186
      Height = 21
      DataField = 'RG'
      DataSource = dtsCadastro
      TabOrder = 5
    end
    object DBEdit15: TDBEdit
      Left = 16
      Top = 280
      Width = 147
      Height = 21
      DataField = 'CPF'
      DataSource = dtsCadastro
      TabOrder = 6
    end
    object DBEdit16: TDBEdit
      Left = 16
      Top = 320
      Width = 186
      Height = 21
      DataField = 'CNPJ'
      DataSource = dtsCadastro
      TabOrder = 7
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 424
    Width = 731
    Height = 120
    Align = alBottom
    DataSource = dtsCadastro
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 385
    Width = 731
    Height = 39
    DataSource = dtsCadastro
    Align = alBottom
    TabOrder = 2
  end
  object PanelObrigatorio1: TPanelObrigatorio
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 394
    Height = 379
    Align = alClient
    Ativo = True
    DataSource = dtsCadastro
    DesenhaObrigatorios = True
    ConfiguraTabOrder = True
    object Label1: TLabel
      Left = 8
      Top = 3
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 8
      Top = 90
      Width = 70
      Height = 13
      Caption = 'Data Cadastro'
    end
    object Label4: TLabel
      Left = 8
      Top = 136
      Width = 26
      Height = 13
      Caption = 'Saldo'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 8
      Top = 176
      Width = 78
      Height = 13
      Caption = 'DataNascimento'
    end
    object Label6: TLabel
      Left = 8
      Top = 216
      Width = 14
      Height = 13
      Caption = 'RG'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 8
      Top = 256
      Width = 19
      Height = 13
      Caption = 'CPF'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 8
      Top = 296
      Width = 25
      Height = 13
      Caption = 'CNPJ'
      FocusControl = DBEdit8
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 63
      Width = 121
      Height = 21
      DataField = 'Nome'
      DataSource = dtsCadastro
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 22
      Width = 121
      Height = 21
      DataField = 'id'
      DataSource = dtsCadastro
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 109
      Width = 121
      Height = 21
      DataField = 'DataCadastro'
      DataSource = dtsCadastro
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 152
      Width = 134
      Height = 21
      DataField = 'Saldo'
      DataSource = dtsCadastro
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 232
      Width = 186
      Height = 21
      DataField = 'RG'
      DataSource = dtsCadastro
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 8
      Top = 272
      Width = 147
      Height = 21
      DataField = 'CPF'
      DataSource = dtsCadastro
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 8
      Top = 312
      Width = 186
      Height = 21
      DataField = 'CNPJ'
      DataSource = dtsCadastro
      TabOrder = 7
    end
    object DBDateTimePiker1: TDBDateTimePiker
      Left = 8
      Top = 193
      Width = 93
      Height = 21
      Date = 43995.000000000000000000
      Time = 0.628969398145272800
      TabOrder = 4
      DataField = 'DataNascimento'
      DataSource = dtsCadastro
    end
  end
  object memCadastro: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 568
    Top = 472
    object memCadastroid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object memCadastroNome: TStringField
      FieldName = 'Nome'
      Required = True
    end
    object memCadastroDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object memCadastroSaldo: TCurrencyField
      FieldName = 'Saldo'
      Required = True
    end
    object memCadastroDataNascimento: TDateField
      FieldName = 'DataNascimento'
    end
    object memCadastroRG: TStringField
      FieldName = 'RG'
      Required = True
      Size = 14
    end
    object memCadastroCPF: TStringField
      FieldName = 'CPF'
      Required = True
      Size = 11
    end
    object memCadastroCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
  end
  object dtsCadastro: TDataSource
    DataSet = memCadastro
    Left = 472
    Top = 480
  end
end
