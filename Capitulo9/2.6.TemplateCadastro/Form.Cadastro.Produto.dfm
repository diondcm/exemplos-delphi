inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlCadastro: TPageControl
    inherited TabCadastro: TTabSheet
      object Label1: TLabel
        Left = 3
        Top = 3
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 3
        Top = 43
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 3
        Top = 83
        Width = 86
        Height = 13
        Caption = 'Dias para entrega'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 3
        Top = 147
        Width = 27
        Height = 13
        Caption = 'Pre'#231'o'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 3
        Top = 187
        Width = 39
        Height = 13
        Caption = 'Estoque'
        FocusControl = DBEdit5
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 19
        Width = 95
        Height = 21
        DataField = 'IDPRODUTO'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 59
        Width = 524
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 99
        Width = 134
        Height = 21
        DataField = 'DIAS_ENTREGA'
        DataSource = dtsDados
        TabOrder = 2
      end
      object DBCheckBox1: TDBCheckBox
        Left = 3
        Top = 123
        Width = 97
        Height = 17
        Caption = 'Importado'
        DataField = 'IMPORTADO'
        DataSource = dtsDados
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 3
        Top = 163
        Width = 147
        Height = 21
        DataField = 'PRECO'
        DataSource = dtsDados
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 3
        Top = 203
        Width = 95
        Height = 21
        DataField = 'ESTOQUE'
        DataSource = dtsDados
        TabOrder = 5
      end
    end
  end
end
