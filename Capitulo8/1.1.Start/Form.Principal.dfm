object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Start'
  ClientHeight = 426
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelCampos: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 635
    Height = 177
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object LabelResultado: TLabel
      Left = 192
      Top = 117
      Width = 48
      Height = 13
      Caption = 'Resultado'
    end
    object LabelCotacaoAtual: TLabel
      Left = 464
      Top = 135
      Width = 67
      Height = 13
      Caption = 'Cota'#231#227'o atual'
    end
    object EditValor: TEdit
      Left = 96
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = 'Valor para convers'#227'o'
    end
    object Button1: TButton
      Left = 96
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 1
      OnClick = Button1Click
    end
    object ComboBoxConvercao: TComboBox
      Left = 95
      Top = 56
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
        'Real para Dolar'
        'Dolar para Real')
    end
    object RadioButtonDolar: TRadioButton
      Left = 464
      Top = 81
      Width = 113
      Height = 17
      Caption = 'Real para Dolar'
      TabOrder = 3
    end
    object RadioButtonReal: TRadioButton
      Left = 464
      Top = 58
      Width = 113
      Height = 17
      Caption = 'Dolar para Real'
      TabOrder = 4
    end
    object Button2: TButton
      Left = 464
      Top = 104
      Width = 113
      Height = 25
      Caption = 'Exibe Cota'#231#227'o'
      TabOrder = 5
      OnClick = Button2Click
    end
  end
end
