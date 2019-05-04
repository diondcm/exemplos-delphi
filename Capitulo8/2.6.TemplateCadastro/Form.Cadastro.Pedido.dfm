inherited frmCadPedido: TfrmCadPedido
  Caption = 'Pedidos'
  OnCreate = FormCreate
  ExplicitWidth = 707
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = TabCadastro
    inherited TabPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 677
      ExplicitHeight = 329
    end
    inherited TabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 677
      ExplicitHeight = 329
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 33
        Height = 13
        Caption = 'Cliente'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 24
        Top = 64
        Width = 44
        Height = 13
        Caption = 'Cadastro'
        FocusControl = DBEdit2
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
      object DBEdit1: TDBEdit
        Left = 24
        Top = 37
        Width = 108
        Height = 21
        DataField = 'IDCLIENTE'
        DataSource = dtsDados
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 24
        Top = 80
        Width = 108
        Height = 21
        DataField = 'DATA_CADASTRO'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 24
        Top = 120
        Width = 108
        Height = 21
        DataField = 'DATA_ENTREGA'
        DataSource = dtsDados
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 24
        Top = 160
        Width = 108
        Height = 21
        DataField = 'DESCONTO'
        DataSource = dtsDados
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 24
        Top = 200
        Width = 147
        Height = 21
        DataField = 'VALOR_TOTAL'
        DataSource = dtsDados
        TabOrder = 4
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 150
        Top = 37
        Width = 145
        Height = 21
        DataField = 'IDCLIENTE'
        DataSource = dtsDados
        KeyField = 'IDCLIENTE'
        ListField = 'NOME'
        ListSource = dtsCliente
        TabOrder = 5
      end
    end
  end
  inherited dtsDados: TDataSource
    DataSet = dmdPedido.qryDados
  end
  object dtsCliente: TDataSource
    DataSet = dmdPedido.qryCliente
    Left = 320
    Top = 112
  end
end
