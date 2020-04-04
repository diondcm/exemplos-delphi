object frmCadClienteVCL: TfrmCadClienteVCL
  Left = 0
  Top = 0
  Caption = 'Cadastro Clientes'
  ClientHeight = 404
  ClientWidth = 571
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
  object PageControlCadastro: TPageControl
    Left = 0
    Top = 25
    Width = 571
    Height = 379
    ActivePage = TabPesquisa
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 128
    ExplicitWidth = 289
    ExplicitHeight = 193
    object TabPesquisa: TTabSheet
      Caption = 'Pesquisa'
      ExplicitWidth = 281
      ExplicitHeight = 165
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 563
        Height = 351
        Align = alClient
        DataSource = dtsCliente
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 563
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = -3
        ExplicitTop = -6
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 11
          Height = 41
          Align = alLeft
          Caption = 'ID'
          Layout = tlCenter
          ExplicitLeft = 24
          ExplicitTop = 16
          ExplicitHeight = 13
        end
        object EditID: TEdit
          AlignWithMargins = True
          Left = 31
          Top = 8
          Width = 529
          Height = 25
          Margins.Left = 20
          Margins.Top = 8
          Margins.Bottom = 8
          Align = alClient
          ReadOnly = True
          TabOrder = 0
          ExplicitLeft = 72
          ExplicitTop = 24
          ExplicitWidth = 121
          ExplicitHeight = 21
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 82
        Width = 563
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitTop = 8
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 70
          Height = 41
          Align = alLeft
          Caption = 'Data Cadastro'
          Layout = tlCenter
          ExplicitHeight = 13
        end
        object DBEdit1: TDBEdit
          Left = 96
          Top = 11
          Width = 121
          Height = 21
          DataField = 'DATA_CADASTRO'
          DataSource = dtsCliente
          ReadOnly = True
          TabOrder = 0
        end
        object DateTimePicker1: TDateTimePicker
          Left = 232
          Top = 11
          Width = 186
          Height = 21
          Date = 43925.000000000000000000
          Time = 0.481627916669822300
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 41
        Width = 563
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 8
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 27
          Height = 41
          Align = alLeft
          Caption = 'Nome'
          Layout = tlCenter
          ExplicitHeight = 13
        end
        object EditNome: TEdit
          AlignWithMargins = True
          Left = 47
          Top = 8
          Width = 513
          Height = 25
          Margins.Left = 20
          Margins.Top = 8
          Margins.Bottom = 8
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 31
          ExplicitWidth = 529
          ExplicitHeight = 21
        end
      end
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 571
    Height = 25
    DataSource = dtsCliente
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 563
  end
  object dtsCliente: TDataSource
    DataSet = dmdCliente.qryCliente
    OnStateChange = dtsClienteStateChange
    Left = 488
    Top = 176
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = dmdCliente.qryCliente
    ScopeMappings = <>
    Left = 280
    Top = 208
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 484
    Top = 117
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'ID'
      Control = EditID
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'NOME'
      Control = EditNome
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'DATA_CADASTRO'
      Control = DateTimePicker1
      Track = True
    end
  end
end
