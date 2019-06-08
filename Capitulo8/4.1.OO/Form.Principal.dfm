object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Conceitos'
  ClientHeight = 417
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 185
    Height = 411
    Align = alLeft
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    object LabelVeiculo: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 23
      Align = alTop
      Caption = 'Ve'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 59
    end
    object ButtonClasses: TButton
      AlignWithMargins = True
      Left = 4
      Top = 60
      Width = 177
      Height = 53
      Align = alTop
      Caption = 'Classes'
      TabOrder = 0
      OnClick = ButtonClassesClick
    end
    object ComboBoxVeiculos: TComboBox
      AlignWithMargins = True
      Left = 4
      Top = 33
      Width = 177
      Height = 21
      Align = alTop
      TabOrder = 1
      Items.Strings = (
        'Carro'
        'Navio')
    end
    object ButtonPatromonio: TButton
      AlignWithMargins = True
      Left = 4
      Top = 119
      Width = 177
      Height = 58
      Align = alTop
      Caption = 'Total Patrim'#244'nio'
      TabOrder = 2
      OnClick = ButtonPatromonioClick
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 194
    Top = 3
    Width = 168
    Height = 411
    Align = alClient
    Color = clInfoBk
    TabOrder = 1
    ExplicitWidth = 408
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 368
    Top = 3
    Width = 311
    Height = 411
    Align = alRight
    TabOrder = 2
    ExplicitTop = -2
    object Label2: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 228
      Width = 303
      Height = 13
      Align = alTop
      Caption = 'Ativo: Sim'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 57
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 209
      Width = 303
      Height = 13
      Align = alTop
      Caption = 'Saldo R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 76
    end
    inline fraCliente1: TfraCliente
      Left = 1
      Top = 1
      Width = 309
      Height = 205
      Align = alTop
      TabOrder = 0
      ExplicitLeft = -93
      inherited Panel1: TPanel
        Width = 303
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 272
      end
      inherited Panel2: TPanel
        Width = 303
        ExplicitLeft = 67
        ExplicitTop = 50
        ExplicitWidth = 272
        ExplicitHeight = 152
        inherited Label1: TLabel
          Width = 295
          ExplicitLeft = 4
          ExplicitTop = 4
        end
        inherited Label2: TLabel
          Width = 295
          ExplicitLeft = 4
          ExplicitTop = 23
        end
        inherited Button1: TButton
          Top = 122
          ExplicitTop = 122
        end
      end
    end
  end
end
