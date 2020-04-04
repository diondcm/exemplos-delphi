object frmCadProduto: TfrmCadProduto
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 378
  ClientWidth = 831
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 353
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 616
    object Splitter1: TSplitter
      Left = 1
      Top = 177
      Width = 550
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 42
      ExplicitWidth = 313
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 550
      Height = 176
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 614
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 548
        Height = 174
        Align = alClient
        DataSource = dtsProduto
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 180
      Width = 550
      Height = 172
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 614
      object LabelID: TLabel
        Left = 16
        Top = 6
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object Label2: TLabel
        Left = 16
        Top = 40
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label1: TLabel
        Left = 16
        Top = 67
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel
        Left = 16
        Top = 94
        Width = 23
        Height = 13
        Caption = 'Peso'
      end
      object Label4: TLabel
        Left = 16
        Top = 136
        Width = 70
        Height = 13
        Caption = 'Data Cadastro'
      end
      object EditDescricao: TEdit
        Left = 68
        Top = 37
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object EditCodigo: TEdit
        Left = 68
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object EditPeso: TEdit
        Left = 68
        Top = 91
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object DatePicker1: TDatePicker
        Left = 104
        Top = 126
        Date = 43929.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 3
      end
      object ButtonCarregaProdutos: TButton
        Left = 232
        Top = 3
        Width = 154
        Height = 25
        Caption = 'Carregar Produtos'
        TabOrder = 4
        OnClick = ButtonCarregaProdutosClick
      end
      object ListBoxProdutos: TListBox
        AlignWithMargins = True
        Left = 392
        Top = 4
        Width = 154
        Height = 164
        Align = alRight
        ItemHeight = 13
        TabOrder = 5
        ExplicitLeft = 456
      end
      object Button1: TButton
        Left = 311
        Top = 34
        Width = 75
        Height = 25
        Caption = 'Show Lista'
        TabOrder = 6
        OnClick = Button1Click
      end
      object DateTimePicker1: TDateTimePicker
        Left = 272
        Top = 129
        Width = 114
        Height = 21
        Date = 43925.000000000000000000
        Time = 0.664076273147657100
        TabOrder = 7
      end
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 353
    Width = 831
    Height = 25
    DataSource = dtsProduto
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 616
  end
  object Panel4: TPanel
    Left = 552
    Top = 0
    Width = 279
    Height = 353
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 553
    ExplicitTop = -6
    object ImageQrCode: TImage
      Left = 56
      Top = 94
      Width = 169
      Height = 145
      Stretch = True
    end
  end
  object dtsProduto: TDataSource
    DataSet = dmdProduto.qryProduto
    OnDataChange = dtsProdutoDataChange
    Left = 384
    Top = 64
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = dmdProduto.qryProduto
    ScopeMappings = <>
    Left = 136
    Top = 24
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'ID'
      Component = LabelID
      ComponentProperty = 'Caption'
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'DESCRICAO'
      Control = EditDescricao
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'CODIGO'
      Control = EditCodigo
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'PESO'
      Control = EditPeso
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'DATA_CADASTRO'
      Control = DateTimePicker1
      Track = True
    end
    object LinkPropertyToFieldDate: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'DATA_CADASTRO'
      Component = DatePicker1
      ComponentProperty = 'Date'
    end
  end
end
