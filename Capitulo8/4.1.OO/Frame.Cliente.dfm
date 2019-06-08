object fraCliente: TfraCliente
  Left = 0
  Top = 0
  Width = 278
  Height = 205
  TabOrder = 0
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 272
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 24
    ExplicitTop = 64
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 272
    Height = 152
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 152
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 264
      Height = 13
      Align = alTop
      Caption = 'Saldo R$ 0,00'
      ExplicitLeft = 96
      ExplicitTop = 80
      ExplicitWidth = 67
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 23
      Width = 264
      Height = 13
      Align = alTop
      Caption = 'Ativo: Sim'
      ExplicitLeft = 72
      ExplicitTop = 56
      ExplicitWidth = 48
    end
    object Button1: TButton
      Left = 4
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 0
    end
  end
end
