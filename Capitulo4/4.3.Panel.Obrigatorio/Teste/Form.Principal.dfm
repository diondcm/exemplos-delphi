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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memoCampos: TMemo
    Left = 170
    Top = 0
    Width = 144
    Height = 277
    Align = alLeft
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 277
    Width = 884
    Height = 236
    Align = alBottom
    DataSource = dtsCampos
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object memoLog: TMemo
    Left = 688
    Top = 0
    Width = 196
    Height = 277
    Align = alRight
    TabOrder = 2
  end
  object panelBaseObrigatorio: TPanel
    Left = 0
    Top = 0
    Width = 170
    Height = 277
    Align = alLeft
    TabOrder = 3
    object Label1: TLabel
      Left = 142
      Top = 24
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 120
      Top = 64
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel
      Left = 126
      Top = 104
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 83
      Top = 144
      Width = 70
      Height = 13
      Caption = 'Data Cadastro'
    end
    object Label5: TLabel
      Left = 99
      Top = 190
      Width = 54
      Height = 13
      Caption = 'Valor Inicial'
    end
    object DBEdit2: TDBEdit
      Left = 32
      Top = 37
      Width = 121
      Height = 21
      DataField = 'ID'
      DataSource = dtsCampos
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 32
      Top = 77
      Width = 121
      Height = 21
      Color = clGradientActiveCaption
      DataField = 'Codigo'
      DataSource = dtsCampos
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 32
      Top = 117
      Width = 121
      Height = 21
      Color = clInfoBk
      DataField = 'Nome'
      DataSource = dtsCampos
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 32
      Top = 159
      Width = 121
      Height = 21
      Color = clGrayText
      DataField = 'DataCadastro'
      DataSource = dtsCampos
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 32
      Top = 204
      Width = 121
      Height = 21
      Color = clHighlight
      DataField = 'ValorInicial'
      DataSource = dtsCampos
      TabOrder = 4
    end
    object buttonValidaCampos: TButton
      Left = 1
      Top = 242
      Width = 168
      Height = 34
      Align = alBottom
      Caption = 'Valida Campos'
      TabOrder = 5
    end
  end
  object DBDateTimePicker1: TDBDateTimePicker
    Left = 368
    Top = 64
    Width = 186
    Height = 21
    Date = 43106.420867476850000000
    Time = 43106.420867476850000000
    TabOrder = 4
    OnChange = DBDateTimePicker1Change
    DataSource = dtsCampos
    DataField = 'DataCadastro'
  end
  object dtsCampos: TDataSource
    DataSet = memCampos
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
