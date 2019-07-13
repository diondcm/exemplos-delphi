object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Grupos'
  ClientHeight = 441
  ClientWidth = 597
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
  object Splitter1: TSplitter
    Left = 181
    Top = 0
    Height = 441
    ExplicitLeft = 304
    ExplicitTop = 192
    ExplicitHeight = 100
  end
  object ImagemRelatorio: TImage
    AlignWithMargins = True
    Left = 187
    Top = 3
    Width = 407
    Height = 435
    Align = alClient
    Proportional = True
    OnDblClick = ImagemRelatorioDblClick
    ExplicitLeft = 190
    ExplicitTop = -2
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 175
    Height = 435
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MinWidth = 175
    TabOrder = 0
    object ButtonGrupo: TButton
      Left = 0
      Top = 0
      Width = 169
      Height = 49
      Caption = 'Categoria && Produto'
      PopupMenu = PopupMenuExibeDados
      TabOrder = 0
      OnClick = ButtonGrupoClick
    end
    object ButtonListaProdutos: TButton
      Left = 0
      Top = 49
      Width = 169
      Height = 49
      Caption = 'Lista Produtos'
      TabOrder = 1
      OnClick = ButtonListaProdutosClick
    end
  end
  object PopupMenuExibeDados: TPopupMenu
    Left = 296
    Top = 224
    object ExibeDados1: TMenuItem
      Caption = 'Exibe Dados'
      OnClick = ExibeDados1Click
    end
    object ExibeProdutoCategoria1: TMenuItem
      Caption = 'Exibe Produto/Categoria'
      OnClick = ExibeProdutoCategoria1Click
    end
    object ExibeListaProdutos1: TMenuItem
      Caption = 'Exibe Lista Produtos'
      OnClick = ExibeListaProdutos1Click
    end
  end
end
