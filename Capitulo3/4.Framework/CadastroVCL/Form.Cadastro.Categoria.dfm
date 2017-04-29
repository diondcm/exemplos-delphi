inherited frmCadastroCategorias: TfrmCadastroCategorias
  Caption = 'Cadastro de Categorias'
  ClientHeight = 243
  ClientWidth = 515
  ExplicitWidth = 531
  ExplicitHeight = 282
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 88
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel [1]
    Left = 168
    Top = 88
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = cxDBTextEdit1
  end
  object cxDBTextEdit1: TcxDBTextEdit [2]
    Left = 168
    Top = 104
    DataBinding.DataField = 'DESCRICAO'
    DataBinding.DataSource = dtsDados
    TabOrder = 7
    Width = 121
  end
  object cxDBCheckBox1: TcxDBCheckBox [3]
    Left = 312
    Top = 104
    Caption = 'ATIVO'
    DataBinding.DataField = 'ATIVO'
    DataBinding.DataSource = dtsDados
    TabOrder = 8
  end
  object cxDBTextEdit2: TcxDBTextEdit [4]
    Left = 24
    Top = 104
    DataBinding.DataField = 'ID'
    DataBinding.DataSource = dtsDados
    TabOrder = 9
    Width = 121
  end
  inherited Panel1: TPanel
    Width = 515
    ExplicitLeft = 0
    ExplicitWidth = 612
  end
  inherited dtsDados: TDataSource
    Left = 160
    Top = 176
  end
  inherited MainMenu: TMainMenu
    Left = 280
    Top = 176
  end
  inherited ActionList: TActionList
    Left = 224
    Top = 176
  end
end
