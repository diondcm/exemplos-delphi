object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'A'#231#245'es'
  ClientHeight = 332
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOperacao: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 177
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object edtAcao: TEdit
      Left = 224
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = 'A'#231#227'o'
    end
    object edtQauntidade: TEdit
      Left = 224
      Top = 41
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      TextHint = 'Quantidade'
    end
    object edtValor: TEdit
      Left = 224
      Top = 67
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 2
      TextHint = 'Valor'
    end
    object btnVenda: TBitBtn
      Left = 465
      Top = 16
      Width = 105
      Height = 72
      Caption = 'Vender'
      TabOrder = 3
      OnClick = btnVendaClick
    end
    object btnCompra: TBitBtn
      Left = 8
      Top = 16
      Width = 105
      Height = 72
      Caption = 'Comprar'
      TabOrder = 4
      OnClick = btnCompraClick
    end
    object btnGetVendas: TBitBtn
      Left = 465
      Top = 120
      Width = 105
      Height = 43
      Caption = 'Get Vendas'
      TabOrder = 5
      OnClick = btnGetVendasClick
    end
    object btnGetCompras: TBitBtn
      Left = 8
      Top = 120
      Width = 105
      Height = 43
      Caption = 'Get Compras'
      TabOrder = 6
      OnClick = btnGetComprasClick
    end
  end
  object pnlMensagem: TPanel
    Left = 0
    Top = 177
    Width = 586
    Height = 32
    Align = alTop
    Color = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 121
  end
  object lvtAcoes: TListView
    Left = 0
    Top = 209
    Width = 586
    Height = 123
    Align = alClient
    Columns = <
      item
        Caption = 'A'#231#227'o'
      end
      item
        Alignment = taRightJustify
        Caption = 'Quantidade'
      end
      item
        Alignment = taRightJustify
        Caption = 'Valor'
      end
      item
        Alignment = taRightJustify
        Caption = 'Total'
        Width = 70
      end>
    TabOrder = 2
    ViewStyle = vsReport
    OnColumnClick = lvtAcoesColumnClick
    OnCompare = lvtAcoesCompare
    ExplicitLeft = 176
    ExplicitTop = 112
    ExplicitWidth = 250
    ExplicitHeight = 150
  end
  object tmrMensagem: TTimer
    Enabled = False
    Interval = 1800
    OnTimer = tmrMensagemTimer
    Left = 400
    Top = 152
  end
end
