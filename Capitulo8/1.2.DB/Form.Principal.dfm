object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'DB'
  ClientHeight = 506
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 831
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 336
    ExplicitTop = 208
    ExplicitWidth = 185
    object Label7: TLabel
      Left = 532
      Top = 13
      Width = 102
      Height = 13
      Caption = 'Selecione o seu estilo'
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 0
      ExplicitLeft = 520
      ExplicitTop = 16
      ExplicitHeight = 25
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 85
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Carregar'
      Enabled = False
      TabOrder = 1
      ExplicitLeft = 376
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ComboBoxTema: TComboBox
      Left = 640
      Top = 10
      Width = 184
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = ComboBoxTemaChange
    end
  end
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 831
    Height = 406
    ActivePage = TabPesquisa
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 398
    object TabPesquisa: TTabSheet
      Caption = 'Pesquisa'
      ExplicitWidth = 281
      ExplicitHeight = 165
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 817
        Height = 372
        Align = alClient
        DataSource = dtsClientes
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastrar'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 11
        Height = 13
        Caption = 'ID'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 88
        Width = 78
        Height = 13
        Caption = 'DataNascimento'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 16
        Top = 128
        Width = 19
        Height = 13
        Caption = 'CPF'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 16
        Top = 168
        Width = 67
        Height = 13
        Caption = 'DataCadastro'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 16
        Top = 208
        Width = 35
        Height = 13
        Caption = 'Credito'
        FocusControl = DBEdit6
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 134
        Height = 21
        DataField = 'ID'
        DataSource = dtsClientes
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 64
        Width = 250
        Height = 21
        DataField = 'Nome'
        DataSource = dtsClientes
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 104
        Width = 134
        Height = 21
        DataField = 'DataNascimento'
        DataSource = dtsClientes
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 144
        Width = 186
        Height = 21
        DataField = 'CPF'
        DataSource = dtsClientes
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 184
        Width = 238
        Height = 21
        DataField = 'DataCadastro'
        DataSource = dtsClientes
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 224
        Width = 134
        Height = 21
        DataField = 'Credito'
        DataSource = dtsClientes
        TabOrder = 5
      end
    end
  end
  object PanelNavigator: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 462
    Width = 831
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -2
  end
  object dtsClientes: TDataSource
    DataSet = cdsClientes
    Left = 464
    Top = 224
  end
  object cdsClientes: TClientDataSet
    PersistDataPacket.Data = {
      A60000009619E0BD010000001800000006000000000003000000A60002494404
      00010000000000044E6F6D650100490000000100055749445448020002006400
      0E446174614E617363696D656E746F0400060000000000034350460100490000
      000100055749445448020002000E000C44617461436164617374726F08000800
      00000000074372656469746F0800040000000100075355425459504502004900
      06004D6F6E6579000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 168
    object cdsClientesID: TIntegerField
      FieldName = 'ID'
    end
    object cdsClientesNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object cdsClientesDataNascimento: TDateField
      FieldName = 'DataNascimento'
    end
    object cdsClientesCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsClientesDataCadastro: TDateTimeField
      FieldName = 'DataCadastro'
    end
    object cdsClientesCredito: TCurrencyField
      FieldName = 'Credito'
    end
  end
end
