inherited frmCadPedido: TfrmCadPedido
  Caption = 'Cadastro de Pedidos'
  ClientHeight = 514
  ExplicitHeight = 553
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlCadastro: TPageControl
    Height = 448
    ActivePage = TabCadastro
    inherited TabPesquisa: TTabSheet
      object LabelPedidos: TLabel [0]
        Left = 0
        Top = 0
        Width = 733
        Height = 19
        Align = alTop
        Caption = 'Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 64
      end
      object Splitter1: TSplitter [1]
        Left = 0
        Top = 290
        Width = 733
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 19
        ExplicitWidth = 116
      end
      inherited DBGridDados: TDBGrid
        Top = 19
        Height = 271
      end
      object PanelItens: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 296
        Width = 727
        Height = 121
        Align = alBottom
        TabOrder = 1
        ExplicitLeft = 56
        ExplicitTop = 64
        ExplicitWidth = 369
        object Label2: TLabel
          Left = 1
          Top = 1
          Width = 725
          Height = 19
          Align = alTop
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 42
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 20
          Width = 725
          Height = 100
          Align = alClient
          DataSource = dtsItens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitLeft = -148
      ExplicitTop = 32
      ExplicitWidth = 733
      ExplicitHeight = 262
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 3
        Top = 88
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 3
        Top = 128
        Width = 63
        Height = 13
        Caption = 'Data Compra'
      end
      object Label5: TLabel
        Left = 3
        Top = 168
        Width = 24
        Height = 13
        Caption = 'Total'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 3
        Top = 45
        Width = 33
        Height = 13
        Caption = 'Cliente'
        FocusControl = DBEdit6
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 95
        Height = 21
        DataField = 'IDPEDIDO'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 61
        Width = 63
        Height = 21
        DataField = 'IDCLIENTE'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 104
        Width = 300
        Height = 21
        DataField = 'ENDERECO'
        DataSource = dtsDados
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 3
        Top = 184
        Width = 147
        Height = 21
        DataField = 'VLR_TOTAL'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 72
        Top = 61
        Width = 231
        Height = 21
        DataField = 'CLIENTE'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 2
      end
      object DateTimePicker1: TDateTimePicker
        Left = 3
        Top = 144
        Width = 95
        Height = 21
        Date = 43953.000000000000000000
        Time = 0.495241226853977400
        TabOrder = 5
      end
      object buttonPesquisa: TBitBtn
        Left = 309
        Top = 59
        Width = 28
        Height = 25
        Caption = 'Peq.'
        TabOrder = 3
        OnClick = buttonPesquisaClick
      end
      object PanelCadItens: TPanel
        Left = 0
        Top = 211
        Width = 733
        Height = 209
        Align = alBottom
        TabOrder = 7
        object Label7: TLabel
          Left = 1
          Top = 1
          Width = 731
          Height = 19
          Align = alTop
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 42
        end
        object DBGrid2: TDBGrid
          Left = 1
          Top = 20
          Width = 669
          Height = 188
          Align = alClient
          DataSource = dtsItens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object PanelCadItemControle: TPanel
          Left = 670
          Top = 20
          Width = 62
          Height = 188
          Align = alRight
          TabOrder = 1
          object ButtonAddItem: TBitBtn
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 54
            Height = 25
            Align = alTop
            Caption = 'Add'
            TabOrder = 0
            OnClick = ButtonAddItemClick
            ExplicitLeft = -8
            ExplicitTop = 40
            ExplicitWidth = 75
          end
          object ButtonEditItem: TBitBtn
            AlignWithMargins = True
            Left = 4
            Top = 35
            Width = 54
            Height = 25
            Align = alTop
            Caption = 'Edit'
            TabOrder = 1
            OnClick = ButtonEditItemClick
            ExplicitLeft = -8
            ExplicitTop = 65
            ExplicitWidth = 75
          end
          object ButtonDelete: TBitBtn
            AlignWithMargins = True
            Left = 4
            Top = 66
            Width = 54
            Height = 25
            Align = alTop
            Caption = 'Del'
            TabOrder = 2
            OnClick = ButtonDeleteClick
            ExplicitLeft = 8
            ExplicitTop = 96
            ExplicitWidth = 75
          end
        end
      end
    end
  end
  inherited StatusBarCadastro: TStatusBar
    Top = 495
  end
  inherited dtsDados: TDataSource
    Left = 408
    Top = 88
  end
  inherited ActionList: TActionList
    Left = 472
    Top = 96
  end
  inherited TimerOpen: TTimer
    Left = 552
    Top = 96
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = dmdPedido.qryDados
    ScopeMappings = <>
    Left = 104
    Top = 24
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'DATA_COMPRA'
      Control = DateTimePicker1
      Track = True
    end
  end
  object dtsItens: TDataSource
    OnDataChange = dtsItensDataChange
    Left = 408
    Top = 144
  end
end
