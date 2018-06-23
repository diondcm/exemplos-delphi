inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de clientes'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 80
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 120
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 160
    Width = 70
    Height = 13
    Caption = 'Data Cadastro'
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 200
    Width = 76
    Height = 13
    Caption = 'Saldo dispon'#237'vel'
    FocusControl = DBEdit4
  end
  object DBEdit1: TDBEdit [5]
    Left = 8
    Top = 96
    Width = 134
    Height = 21
    DataField = 'CODIGO'
    DataSource = dtsCadastro
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [6]
    Left = 8
    Top = 136
    Width = 200
    Height = 21
    DataField = 'NOME'
    DataSource = dtsCadastro
    TabOrder = 2
  end
  object DBEdit3: TDBEdit [7]
    Left = 8
    Top = 176
    Width = 169
    Height = 21
    DataField = 'DATA_CADASTRO'
    DataSource = dtsCadastro
    TabOrder = 3
  end
  object DBEdit4: TDBEdit [8]
    Left = 8
    Top = 216
    Width = 134
    Height = 21
    DataField = 'SALDO_DISPONIVEL'
    DataSource = dtsCadastro
    TabOrder = 4
  end
end
