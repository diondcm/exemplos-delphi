inherited frmCadastroProduto: TfrmCadastroProduto
  Caption = 'Cadastro de Produtos'
  ClientHeight = 261
  ClientWidth = 518
  ExplicitWidth = 534
  ExplicitHeight = 300
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
  end
  object Label3: TLabel [2]
    Left = 38
    Top = 184
    Width = 47
    Height = 13
    Caption = 'Categoria'
  end
  inherited Panel1: TPanel
    Width = 518
    ExplicitLeft = 0
    ExplicitWidth = 518
  end
  object dbeCodigo: TDBEdit [10]
    Left = 38
    Top = 111
    Width = 121
    Height = 21
    DataField = 'ID'
    DataSource = dtsDados
    TabOrder = 7
  end
  object dbeDescricao: TDBEdit [11]
    Left = 38
    Top = 152
    Width = 121
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dtsDados
    TabOrder = 8
  end
  object dbeCategoria: TDBEdit [12]
    Left = 38
    Top = 203
    Width = 47
    Height = 21
    DataField = 'ID_CATEGORIA'
    DataSource = dtsDados
    ReadOnly = True
    TabOrder = 9
  end
  object btnCategoria: TButton [13]
    Left = 231
    Top = 201
    Width = 34
    Height = 25
    Caption = '...'
    TabOrder = 10
    OnClick = btnCategoriaClick
  end
  object edtDescricaoCategoria: TEdit [14]
    Left = 91
    Top = 203
    Width = 134
    Height = 21
    ReadOnly = True
    TabOrder = 11
    Text = 'edtDescricaoCategoria'
  end
  inherited dtsDados: TDataSource
    OnDataChange = dtsDadosDataChange
    Left = 384
    Top = 112
  end
  inherited MainMenu: TMainMenu
    Left = 216
    Top = 112
  end
  inherited ActionList: TActionList
    Left = 328
    Top = 104
  end
end
