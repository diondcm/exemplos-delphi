object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Classes e Objetos'
  ClientHeight = 454
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblResultado: TLabel
    Left = 0
    Top = 441
    Width = 646
    Height = 13
    Align = alBottom
    Caption = 'Pessoa'
    WordWrap = True
    ExplicitWidth = 34
  end
  object memInfos: TMemo
    Left = 461
    Top = 0
    Width = 185
    Height = 327
    Align = alRight
    Lines.Strings = (
      '')
    TabOrder = 0
    ExplicitLeft = 192
    ExplicitTop = 56
    ExplicitHeight = 89
  end
  object pnlPessoaFisica: TPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 327
    Align = alLeft
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 5
    ExplicitHeight = 441
    object lblDataNascimento: TLabel
      Left = 16
      Top = 105
      Width = 80
      Height = 13
      Caption = 'Data nascimento'
    end
    object lblTituloPessoaFisica: TLabel
      Left = 1
      Top = 1
      Width = 143
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Pessoa F'#237'sica'
      ExplicitLeft = 56
      ExplicitTop = 216
      ExplicitWidth = 63
    end
    object edtID: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = 'Informe o ID'
    end
    object edtNome: TEdit
      Left = 16
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 1
      TextHint = 'Nome'
    end
    object edtCPF: TEdit
      Left = 16
      Top = 78
      Width = 121
      Height = 21
      TabOrder = 2
      TextHint = 'CPF'
    end
  end
  object dtpDataNascimento: TDateTimePicker
    Left = 16
    Top = 124
    Width = 121
    Height = 21
    Date = 42826.445696006940000000
    Time = 42826.445696006940000000
    TabOrder = 2
  end
  object pnlPessoaJuridica: TPanel
    Left = 145
    Top = 0
    Width = 144
    Height = 327
    Align = alLeft
    Caption = 'pnlPessoaJuridica'
    ShowCaption = False
    TabOrder = 3
    ExplicitLeft = 143
    ExplicitTop = -6
    ExplicitHeight = 441
    object lblTituloPessoaJuridica: TLabel
      Left = 1
      Top = 1
      Width = 142
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Pessoa Jur'#237'dica'
      ExplicitWidth = 73
    end
    object lblDataFundacao: TLabel
      Left = 16
      Top = 105
      Width = 86
      Height = 13
      Caption = 'Data de funda'#231#227'o'
    end
    object edtCNPJ: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = 'Informe o CNPJ'
    end
    object edtNomeFantasia: TEdit
      Left = 16
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 1
      TextHint = 'Nome Fantasia'
    end
    object edtRazaoSocial: TEdit
      Left = 16
      Top = 78
      Width = 121
      Height = 21
      TabOrder = 2
      TextHint = 'Raz'#227'o Social'
    end
    object dtpDataFundacao: TDateTimePicker
      Left = 16
      Top = 124
      Width = 121
      Height = 21
      Date = 42826.466742326390000000
      Time = 42826.466742326390000000
      TabOrder = 3
    end
  end
  object pnlControles: TPanel
    Left = 0
    Top = 327
    Width = 646
    Height = 114
    Align = alBottom
    TabOrder = 4
    ExplicitLeft = 302
    ExplicitTop = 164
    ExplicitWidth = 153
    object btnExibeInfos: TButton
      Left = 16
      Top = 54
      Width = 121
      Height = 25
      Caption = 'Exibe informa'#231#245'es'
      TabOrder = 0
      OnClick = btnExibeInfosClick
    end
    object chkExibePessoaLabel: TCheckBox
      Left = 16
      Top = 8
      Width = 137
      Height = 17
      Caption = 'Exibe a pessoa no Label'
      TabOrder = 1
    end
    object rbdPessoaFisica: TRadioButton
      Left = 16
      Top = 31
      Width = 98
      Height = 17
      Caption = 'Pessoa F'#237'sica'
      TabOrder = 2
    end
    object rbdPessoaJuridica: TRadioButton
      Left = 120
      Top = 31
      Width = 113
      Height = 17
      Caption = 'Pessoa Jur'#237'dica'
      TabOrder = 3
    end
  end
end
