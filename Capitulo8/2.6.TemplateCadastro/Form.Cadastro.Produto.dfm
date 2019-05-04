inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produtos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = TabCadastro
    inherited TabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 677
      ExplicitHeight = 329
      object Label1: TLabel
        Left = 32
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 32
        Top = 56
        Width = 23
        Height = 13
        Caption = 'Peso'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 32
        Top = 96
        Width = 46
        Height = 13
        Caption = 'Uni. Med.'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 32
        Top = 136
        Width = 42
        Height = 13
        Caption = 'Detalhes'
      end
      object DBEdit1: TDBEdit
        Left = 32
        Top = 32
        Width = 394
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dtsDados
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 32
        Top = 72
        Width = 108
        Height = 21
        DataField = 'PESO'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 32
        Top = 112
        Width = 108
        Height = 21
        DataField = 'UNIDADE_MEDIDA'
        DataSource = dtsDados
        TabOrder = 2
      end
      object DBMemo1: TDBMemo
        Left = 32
        Top = 155
        Width = 394
        Height = 126
        DataField = 'DETALHES'
        DataSource = dtsDados
        TabOrder = 3
      end
    end
  end
  inherited dtsDados: TDataSource
    DataSet = dmdProduto.qryDados
  end
end
