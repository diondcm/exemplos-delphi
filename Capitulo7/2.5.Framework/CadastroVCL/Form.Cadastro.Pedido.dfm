inherited frmCadastroPedido: TfrmCadastroPedido
  Caption = 'Cadastro de Pedido'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 80
    Width = 85
    Height = 13
    Caption = 'Data de Cadastro'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 120
    Width = 51
    Height = 13
    Caption = 'Valor Total'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 24
    Top = 160
    Width = 50
    Height = 13
    Caption = 'Qtd. Itens'
    FocusControl = DBEdit3
  end
  object DBEdit1: TDBEdit [4]
    Left = 24
    Top = 96
    Width = 193
    Height = 21
    DataField = 'DATA_CADASTRO'
    DataSource = dtsCadastro
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [5]
    Left = 24
    Top = 136
    Width = 251
    Height = 21
    DataField = 'VALOR_TOTAL'
    DataSource = dtsCadastro
    TabOrder = 2
  end
  object DBEdit3: TDBEdit [6]
    Left = 24
    Top = 176
    Width = 134
    Height = 21
    DataField = 'QTD_ITENS'
    DataSource = dtsCadastro
    TabOrder = 3
  end
end
