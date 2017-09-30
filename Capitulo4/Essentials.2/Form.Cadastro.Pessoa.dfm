object frmCadastroPessoa: TfrmCadastroPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 251
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 24
    Top = 96
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 32
    Width = 134
    Height = 21
    DataField = 'Codigo'
    DataSource = dtsPessoa
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 72
    Width = 361
    Height = 21
    DataField = 'Nome'
    DataSource = dtsPessoa
    TabOrder = 1
  end
  object panelControles: TPanel
    Left = 0
    Top = 196
    Width = 427
    Height = 55
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 179
    object buttonSalvar: TBitBtn
      Left = 234
      Top = 8
      Width = 86
      Height = 41
      Caption = '&Salvar'
      Kind = bkYes
      NumGlyphs = 2
      TabOrder = 0
    end
    object buttonCancelar: TBitBtn
      Left = 326
      Top = 8
      Width = 91
      Height = 41
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object dxDBDateTimeWheelPicker1: TdxDBDateTimeWheelPicker
      Left = 352
      Top = 32
      ParentColor = False
      TabOrder = 2
      Height = 1
      Width = 17
    end
  end
  object dateNascimento: TDateTimePicker
    Left = 24
    Top = 115
    Width = 134
    Height = 21
    Date = 43008.708600543990000000
    Time = 43008.708600543990000000
    TabOrder = 3
    OnExit = dateNascimentoExit
  end
  object dtsPessoa: TDataSource
    Left = 232
    Top = 24
  end
end
