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
  object memoCampos: TMemo
    Left = 193
    Top = 0
    Width = 144
    Height = 312
    Align = alLeft
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 441
    Top = 117
    Width = 241
    Height = 124
    Caption = 'Panel1'
    TabOrder = 1
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
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PanelObrigatorio1: TPanelObrigatorio
    Left = 0
    Top = 0
    Width = 193
    Height = 312
    Align = alLeft
    DataSource = dtsCampos
    DesenhaObrigatorios = False
    object Label1: TLabel
      Left = 118
      Top = 16
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 96
      Top = 56
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel
      Left = 102
      Top = 96
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 59
      Top = 136
      Width = 70
      Height = 13
      Caption = 'Data Cadastro'
    end
    object Label5: TLabel
      Left = 75
      Top = 182
      Width = 54
      Height = 13
      Caption = 'Valor Inicial'
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 29
      Width = 121
      Height = 21
      DataField = 'ID'
      DataSource = dtsCampos
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 75
      Width = 121
      Height = 21
      DataField = 'Codigo'
      DataSource = dtsCampos
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 109
      Width = 121
      Height = 21
      DataField = 'Nome'
      DataSource = dtsCampos
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 155
      Width = 121
      Height = 21
      DataField = 'DataCadastro'
      DataSource = dtsCampos
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 201
      Width = 121
      Height = 21
      DataField = 'ValorInicial'
      DataSource = dtsCampos
      TabOrder = 4
    end
    object buttonValidaCampos: TButton
      Left = 0
      Top = 278
      Width = 193
      Height = 34
      Align = alBottom
      Caption = 'Valida Campos'
      TabOrder = 5
    end
  end
  object memoLog: TMemo
    Left = 688
    Top = 0
    Width = 196
    Height = 312
    Align = alRight
    TabOrder = 4
  end
  object checkStado: TCheckBox
    Left = 423
    Top = 8
    Width = 97
    Height = 17
    Caption = 'checkStado'
    TabOrder = 5
  end
  object Button2: TButton
    Left = 423
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 6
    OnClick = Button2Click
  end
  object dtsCampos: TDataSource
    DataSet = memCampos
    OnStateChange = dtsCamposStateChange
    OnDataChange = dtsCamposDataChange
    Left = 288
    Top = 416
  end
  object memCampos: TFDMemTable
    Active = True
    BeforePost = memCamposBeforePost
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DataCadastro'
        DataType = ftDate
      end
      item
        Name = 'ValorInicial'
        Attributes = [faRequired]
        DataType = ftCurrency
        Precision = 19
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 360
    Top = 416
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
