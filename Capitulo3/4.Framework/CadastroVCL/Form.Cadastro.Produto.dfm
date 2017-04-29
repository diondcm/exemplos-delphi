inherited frmCadastroProduto: TfrmCadastroProduto
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 38
    Top = 96
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 38
    Top = 136
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = cxDBTextEdit1
  end
  object Label3: TLabel [2]
    Left = 38
    Top = 176
    Width = 17
    Height = 13
    Caption = 'Cor'
  end
  object Label4: TLabel [3]
    Left = 38
    Top = 216
    Width = 23
    Height = 13
    Caption = 'Peso'
  end
  object cxDBTextEdit1: TcxDBTextEdit [11]
    Left = 38
    Top = 152
    DataBinding.DataField = 'DESCRICAO'
    DataBinding.DataSource = DataSource1
    TabOrder = 7
    Width = 121
  end
  object cxDBTextEdit2: TcxDBTextEdit [12]
    Left = 38
    Top = 112
    DataBinding.DataField = 'CODIGO'
    DataBinding.DataSource = DataSource1
    TabOrder = 8
    Width = 121
  end
  object cxDBTextEdit3: TcxDBTextEdit [13]
    Left = 38
    Top = 189
    DataBinding.DataField = 'COR'
    DataBinding.DataSource = DataSource1
    TabOrder = 9
    Width = 121
  end
  object cxDBTextEdit4: TcxDBTextEdit [14]
    Left = 38
    Top = 235
    DataBinding.DataField = 'PESO'
    DataBinding.DataSource = DataSource1
    TabOrder = 10
    Width = 121
  end
  object DataSource1: TDataSource
    DataSet = dmdProduto.cdsCadastro
    Left = 248
    Top = 200
  end
end
