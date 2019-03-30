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
    ExplicitLeft = -2
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
    object Button3: TButton
      Left = 451
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      AlignWithMargins = True
      Left = 166
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Importar DB'
      TabOrder = 4
      OnClick = Button4Click
      ExplicitLeft = 376
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object Button14: TButton
      AlignWithMargins = True
      Left = 247
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Objeto'
      TabOrder = 5
      OnClick = Button14Click
      ExplicitTop = 8
    end
    object ButtonQRCode: TButton
      AlignWithMargins = True
      Left = 328
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'QRCode'
      TabOrder = 6
      OnClick = ButtonQRCodeClick
      ExplicitLeft = 370
      ExplicitTop = 16
      ExplicitHeight = 25
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
    object TabPesquisa: TTabSheet
      Caption = 'Pesquisa'
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 817
        Height = 353
        Align = alClient
        DataSource = dtsClientes
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object StatusBar: TStatusBar
        Left = 0
        Top = 359
        Width = 823
        Height = 19
        Panels = <>
        SimplePanel = True
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastrar'
      ImageIndex = 1
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
    object Shape1: TShape
      AlignWithMargins = True
      Left = 328
      Top = 4
      Width = 9
      Height = 33
      Align = alLeft
      Brush.Color = clMedGray
      Pen.Style = psClear
    end
    object Button5: TButton
      AlignWithMargins = True
      Left = 247
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetLast1
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 0
    end
    object Button6: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetFirst1
      Align = alLeft
      TabOrder = 1
      ExplicitLeft = 12
      ExplicitTop = 8
    end
    object Button7: TButton
      AlignWithMargins = True
      Left = 166
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetNext1
      Align = alLeft
      TabOrder = 2
      ExplicitTop = 0
    end
    object Button8: TButton
      AlignWithMargins = True
      Left = 85
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetPrior1
      Align = alLeft
      TabOrder = 3
      ExplicitLeft = 93
      ExplicitTop = 8
    end
    object Button9: TButton
      AlignWithMargins = True
      Left = 586
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetPost1
      Align = alLeft
      TabOrder = 4
      ExplicitLeft = 424
      ExplicitTop = 12
    end
    object Button10: TButton
      AlignWithMargins = True
      Left = 505
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetCancel1
      Align = alLeft
      TabOrder = 5
      ExplicitLeft = 424
      ExplicitTop = 12
    end
    object Button11: TButton
      AlignWithMargins = True
      Left = 424
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetEdit1
      Align = alLeft
      TabOrder = 6
      ExplicitTop = 12
    end
    object Button12: TButton
      AlignWithMargins = True
      Left = 343
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetInsert1
      Align = alLeft
      TabOrder = 7
      ExplicitLeft = 424
      ExplicitTop = 12
    end
    object Button13: TButton
      AlignWithMargins = True
      Left = 752
      Top = 4
      Width = 75
      Height = 33
      Action = DatasetDelete1
      Align = alRight
      TabOrder = 8
      ExplicitLeft = 424
      ExplicitTop = 12
    end
  end
  object dtsClientes: TDataSource
    DataSet = cdsClientes
    OnStateChange = dtsClientesStateChange
    Left = 464
    Top = 224
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 168
    object cdsClientesID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object cdsClientesNome: TStringField
      DisplayWidth = 40
      FieldName = 'Nome'
      Size = 100
    end
    object cdsClientesDataNascimento: TDateField
      DisplayLabel = 'Dt. Nasc.'
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
      DisplayLabel = 'Cr'#233'dito'
      FieldName = 'Credito'
      DisplayFormat = '0.,00'
      EditFormat = '0.00'
    end
  end
  object ActionList1: TActionList
    Left = 664
    Top = 232
    object DatasetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&First'
      Hint = 'First'
      ImageIndex = 0
      DataSource = dtsClientes
    end
    object DatasetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Prior'
      Hint = 'Prior'
      ImageIndex = 1
      DataSource = dtsClientes
    end
    object DatasetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Next'
      Hint = 'Next'
      ImageIndex = 2
      DataSource = dtsClientes
    end
    object DatasetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&Last'
      Hint = 'Last'
      ImageIndex = 3
      DataSource = dtsClientes
    end
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = dtsClientes
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = dtsClientes
    end
    object DatasetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Edit'
      Hint = 'Edit'
      ImageIndex = 6
      DataSource = dtsClientes
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dtsClientes
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dtsClientes
    end
    object DatasetRefresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = '&Refresh'
      Hint = 'Refresh'
      ImageIndex = 9
      DataSource = dtsClientes
    end
  end
end
