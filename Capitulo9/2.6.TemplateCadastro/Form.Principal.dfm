object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Template Cadastro'
  ClientHeight = 414
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 532
    Height = 81
    ButtonHeight = 52
    ButtonWidth = 50
    Caption = 'ToolBar1'
    Images = dmdImagens.ImageList1
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = ActionClientes
    end
    object ToolButton2: TToolButton
      Left = 50
      Top = 0
      Action = ActionProdutos
    end
    object ButtonPedido: TToolButton
      Left = 100
      Top = 0
      Action = ActionPedido
    end
  end
  object Memo1: TMemo
    Left = 339
    Top = 96
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 216
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Cliente1: TMenuItem
        Action = ActionClientes
      end
    end
  end
  object ActionList1: TActionList
    Images = dmdImagens.ImageList1
    Left = 360
    Top = 216
    object ActionClientes: TAction
      Caption = 'Clientes'
      ImageIndex = 0
      ShortCut = 16465
      OnExecute = ActionClientesExecute
    end
    object ActionProdutos: TAction
      Caption = 'Produtos'
      OnExecute = ActionProdutosExecute
    end
    object ActionPedido: TAction
      Caption = 'Pedidos'
      OnExecute = ActionPedidoExecute
    end
  end
end
