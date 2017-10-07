object frmCadClassePessoa: TfrmCadClassePessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 229
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object labelCodigo: TLabel
    Left = 24
    Top = 32
    Width = 38
    Height = 13
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labelNome: TLabel
    Left = 24
    Top = 72
    Width = 32
    Height = 13
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 112
    Width = 96
    Height = 13
    Caption = 'Data Nascimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object editCodigo: TEdit
    Left = 144
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object editNome: TEdit
    Left = 144
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object dateEditDataNascimento: TDateTimePicker
    Left = 144
    Top = 104
    Width = 121
    Height = 21
    Date = 43015.495612696760000000
    Time = 43015.495612696760000000
    TabOrder = 2
  end
  object panelControles: TPanel
    Left = 0
    Top = 162
    Width = 297
    Height = 67
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 200
    object buttonSalvar: TBitBtn
      Left = 146
      Top = 1
      Width = 75
      Height = 65
      Align = alRight
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = buttonSalvarClick
      ExplicitLeft = 112
      ExplicitTop = 24
      ExplicitHeight = 25
    end
    object buttonCancelar: TBitBtn
      Left = 221
      Top = 1
      Width = 75
      Height = 65
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = buttonCancelarClick
      ExplicitLeft = 120
      ExplicitTop = 32
      ExplicitHeight = 25
    end
  end
end
