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
    Height = 121
    Align = alTop
    TabOrder = 0
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
      Top = 51
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      TextHint = 'Quantidade'
    end
    object edtValor: TEdit
      Left = 224
      Top = 82
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 2
      TextHint = 'Valor'
    end
    object btnVenda: TBitBtn
      Left = 465
      Top = 26
      Width = 105
      Height = 72
      Caption = 'Vender'
      TabOrder = 3
    end
    object btnCompra: TBitBtn
      Left = 8
      Top = 26
      Width = 105
      Height = 72
      Caption = 'Comprar'
      TabOrder = 4
      OnClick = btnCompraClick
    end
  end
  object pnlMensagem: TPanel
    Left = 0
    Top = 121
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
  end
  object ListView1: TListView
    Left = 0
    Top = 153
    Width = 586
    Height = 179
    Align = alClient
    Columns = <
      item
        Caption = 'A'#231#227'o'
      end
      item
        Caption = 'Quantidade'
      end
      item
        Caption = 'Valor'
      end
      item
        Caption = 'Total'
      end>
    TabOrder = 2
    ExplicitLeft = 176
    ExplicitTop = 112
    ExplicitWidth = 250
    ExplicitHeight = 150
  end
end
