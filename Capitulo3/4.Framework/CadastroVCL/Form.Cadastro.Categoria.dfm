inherited frmCadastroCategorias: TfrmCadastroCategorias
  Caption = 'Cadastro de Categorias'
  ClientHeight = 250
  ClientWidth = 533
  ExplicitWidth = 549
  ExplicitHeight = 289
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
  end
  inherited Panel1: TPanel
    Width = 533
    ExplicitLeft = 0
    ExplicitWidth = 515
  end
  object dbeID: TDBEdit [9]
    Left = 24
    Top = 104
    Width = 121
    Height = 21
    DataField = 'ID'
    DataSource = dtsDados
    TabOrder = 7
  end
  object dbeDescricao: TDBEdit [10]
    Left = 168
    Top = 104
    Width = 121
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dtsDados
    TabOrder = 8
  end
  object dbcAtivo: TDBCheckBox [11]
    Left = 312
    Top = 106
    Width = 97
    Height = 17
    Caption = 'Ativo'
    DataField = 'ATIVO'
    DataSource = dtsDados
    TabOrder = 9
  end
  inherited dtsDados: TDataSource
    Left = 352
    Top = 72
  end
  inherited MainMenu: TMainMenu
    Left = 472
    Top = 72
  end
  inherited ActionList: TActionList
    Left = 416
    Top = 72
  end
end
