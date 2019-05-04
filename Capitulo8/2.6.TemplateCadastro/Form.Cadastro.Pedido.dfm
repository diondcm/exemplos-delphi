inherited frmCadPedido: TfrmCadPedido
  Caption = 'Pedidos'
  ClientHeight = 519
  ClientWidth = 758
  OnCreate = FormCreate
  ExplicitWidth = 774
  ExplicitHeight = 558
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 752
    Height = 464
    ActivePage = TabCadastro
    ExplicitWidth = 752
    ExplicitHeight = 464
    inherited TabPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 744
      ExplicitHeight = 436
      object Label6: TLabel [0]
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 724
        Height = 23
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = 'Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 75
      end
      object Splitter1: TSplitter [1]
        Left = 0
        Top = 245
        Width = 744
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = 3
        ExplicitTop = 135
        ExplicitWidth = 677
      end
      inherited DBGridPEsquisa: TDBGrid
        Top = 29
        Width = 744
        Height = 216
      end
      inherited StatusBar: TStatusBar
        Top = 417
        Width = 744
        ExplicitTop = 417
        ExplicitWidth = 744
      end
      object Panel1: TPanel
        Left = 0
        Top = 248
        Width = 744
        Height = 169
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Label7: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 3
          Width = 724
          Height = 23
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 50
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 29
          Width = 744
          Height = 140
          Align = alClient
          DataSource = dtsItens
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 744
      ExplicitHeight = 436
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object Label2: TLabel
        Left = 24
        Top = 64
        Width = 44
        Height = 13
        Caption = 'Cadastro'
      end
      object Label3: TLabel
        Left = 24
        Top = 104
        Width = 38
        Height = 13
        Caption = 'Entrega'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 24
        Top = 144
        Width = 45
        Height = 13
        Caption = 'Desconto'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 24
        Top = 184
        Width = 51
        Height = 13
        Caption = 'Valor Total'
        FocusControl = DBEdit5
      end
      object DBText1: TDBText
        Left = 24
        Top = 81
        Width = 147
        Height = 17
        DataField = 'DATA_CADASTRO'
        DataSource = dtsDados
      end
      object DBEdit3: TDBEdit
        Left = 24
        Top = 120
        Width = 108
        Height = 21
        DataField = 'DATA_ENTREGA'
        DataSource = dtsDados
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 24
        Top = 160
        Width = 108
        Height = 21
        DataField = 'DESCONTO'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 24
        Top = 200
        Width = 147
        Height = 21
        DataField = 'VALOR_TOTAL'
        DataSource = dtsDados
        TabOrder = 2
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 24
        Top = 39
        Width = 177
        Height = 21
        DataField = 'IDCLIENTE'
        DataSource = dtsDados
        KeyField = 'IDCLIENTE'
        ListField = 'NOME'
        ListSource = dtsCliente
        TabOrder = 3
      end
      object PanelItens: TPanel
        Left = 0
        Top = 240
        Width = 744
        Height = 196
        Align = alBottom
        TabOrder = 4
        object Label8: TLabel
          Left = 1
          Top = 1
          Width = 742
          Height = 23
          Align = alTop
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 50
        end
        object DBGrid2: TDBGrid
          Left = 1
          Top = 24
          Width = 703
          Height = 171
          Align = alClient
          DataSource = dtsItens
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object Panel2: TPanel
          Left = 704
          Top = 24
          Width = 39
          Height = 171
          Align = alRight
          TabOrder = 1
          ExplicitLeft = 710
          ExplicitTop = 30
          object ShapeAddItem: TShape
            Left = 1
            Top = 1
            Width = 37
            Height = 32
            Align = alTop
            Brush.Color = clGreen
            Shape = stRoundSquare
            ExplicitLeft = -2
            ExplicitTop = 6
            ExplicitWidth = 38
          end
          object LabelAddItem: TLabel
            Left = 1
            Top = 0
            Width = 37
            Height = 31
            Alignment = taCenter
            AutoSize = False
            Caption = '+'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clCream
            Font.Height = -32
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            OnClick = LabelAddItemClick
          end
          object ShapeEditItem: TShape
            AlignWithMargins = True
            Left = 1
            Top = 36
            Width = 37
            Height = 32
            Margins.Left = 0
            Margins.Right = 0
            Align = alTop
            Brush.Color = clTeal
            Shape = stRoundSquare
          end
          object LabelEditItem: TLabel
            Left = 4
            Top = 35
            Width = 30
            Height = 30
            Alignment = taCenter
            AutoSize = False
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clCream
            Font.Height = -32
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = LabelEditItemClick
          end
          object Shape1: TShape
            Left = 1
            Top = 71
            Width = 37
            Height = 32
            Align = alTop
            Brush.Color = 3487231
            Shape = stRoundSquare
            ExplicitLeft = 6
            ExplicitTop = 129
          end
          object LabelDeleteItem: TLabel
            Left = 5
            Top = 68
            Width = 29
            Height = 37
            Alignment = taCenter
            AutoSize = False
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clCream
            Font.Height = -32
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            OnClick = LabelDeleteItemClick
          end
        end
      end
    end
  end
  inherited PanelNavigator: TPanel
    Width = 752
    ExplicitWidth = 752
  end
  inherited dtsDados: TDataSource
    DataSet = dmdPedido.qryDados
  end
  object dtsCliente: TDataSource
    DataSet = dmdPedido.qryCliente
    Left = 320
    Top = 112
  end
  object dtsItens: TDataSource
    DataSet = dmdPedido.qryItens
    Left = 320
    Top = 168
  end
end
