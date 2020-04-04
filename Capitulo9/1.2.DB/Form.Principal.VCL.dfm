object frmPrincipalVCL: TfrmPrincipalVCL
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 216
    Top = 104
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object CadastroCliente1: TMenuItem
        Caption = 'Cadastro Cliente'
        OnClick = CadastroCliente1Click
      end
      object CadastroProduto1: TMenuItem
        Caption = 'Cadastro Produto'
        OnClick = CadastroProduto1Click
      end
    end
  end
end
