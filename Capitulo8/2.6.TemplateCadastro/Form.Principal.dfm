object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 353
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 630
    Height = 57
    ButtonHeight = 21
    ButtonWidth = 92
    Caption = 'ToolBar'
    ShowCaptions = True
    TabOrder = 0
    object ToolButtonCliente: TToolButton
      Left = 0
      Top = 0
      Action = ActionCadCliente
    end
    object ToolButtonProdutos: TToolButton
      Left = 92
      Top = 0
      Action = ActionCadProduto
    end
  end
  object ActionList1: TActionList
    Left = 448
    Top = 120
    object ActionCadCliente: TAction
      Caption = 'Cadastro Clientes'
      OnExecute = ActionCadClienteExecute
    end
    object ActionCadProduto: TAction
      Caption = 'Produtos'
      OnExecute = ActionCadProdutoExecute
    end
  end
  object ImageList1: TImageList
    Left = 448
    Top = 176
  end
end
