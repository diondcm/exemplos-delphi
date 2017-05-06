inherited frmCadastroProduto: TfrmCadastroProduto
  Caption = 'Cadastro de Produtos'
  ClientWidth = 518
  ExplicitWidth = 534
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
  inherited Panel1: TPanel
    Width = 518
    ExplicitLeft = 0
    ExplicitWidth = 511
  end
  object dbeCodigo: TDBEdit [11]
    Left = 38
    Top = 111
    Width = 121
    Height = 21
    DataField = 'CODIGO'
    DataSource = dtsDados
    TabOrder = 7
  end
  object dbeDescricao: TDBEdit [12]
    Left = 38
    Top = 152
    Width = 121
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dtsDados
    TabOrder = 8
  end
  object dbeCor: TDBEdit [13]
    Left = 38
    Top = 192
    Width = 121
    Height = 21
    DataField = 'COR'
    DataSource = dtsDados
    TabOrder = 9
  end
  object dbePeso: TDBEdit [14]
    Left = 38
    Top = 235
    Width = 121
    Height = 21
    DataField = 'PESO'
    DataSource = dtsDados
    TabOrder = 10
  end
end
