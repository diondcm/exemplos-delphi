inherited frmCadastroCliente: TfrmCadastroCliente
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlCadastro: TPageControl
    inherited TabPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 733
      ExplicitHeight = 262
    end
    inherited TabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 733
      ExplicitHeight = 262
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 26
        Height = 13
        Caption = 'Saldo'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 24
        Width = 95
        Height = 21
        DataField = 'ID'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 64
        Width = 200
        Height = 21
        DataField = 'NOME'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 104
        Width = 95
        Height = 21
        DataField = 'SALDO'
        DataSource = dtsDados
        TabOrder = 2
      end
    end
  end
end
