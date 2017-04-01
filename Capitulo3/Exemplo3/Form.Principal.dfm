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
  OnCreate = FormCreate
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
    Left = 289
    Top = 41
    Width = 357
    Height = 319
    Align = alClient
    Lines.Strings = (
      '')
    TabOrder = 0
    ExplicitLeft = 461
    ExplicitTop = 47
    ExplicitWidth = 185
    ExplicitHeight = 286
  end
  object pnlPessoaFisica: TPanel
    Left = 0
    Top = 41
    Width = 145
    Height = 319
    Align = alLeft
    TabOrder = 1
    Visible = False
    ExplicitLeft = 8
    ExplicitTop = 5
    ExplicitHeight = 441
    object lblDataNascimento: TLabel
      Left = 18
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
    object edtNome: TEdit
      Left = 18
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = 'Nome'
    end
    object edtCPF: TEdit
      Left = 18
      Top = 51
      Width = 121
      Height = 21
      TabOrder = 1
      TextHint = 'CPF'
    end
    object dtpDataNascimento: TDateTimePicker
      Left = 18
      Top = 124
      Width = 121
      Height = 21
      Date = 42826.445696006940000000
      Time = 42826.445696006940000000
      TabOrder = 2
    end
    object cmbStatusComercial: TComboBox
      Left = 18
      Top = 78
      Width = 121
      Height = 21
      Style = csDropDownList
      TabOrder = 3
    end
  end
  object pnlPessoaJuridica: TPanel
    Left = 145
    Top = 41
    Width = 144
    Height = 319
    Align = alLeft
    Caption = 'pnlPessoaJuridica'
    ShowCaption = False
    TabOrder = 2
    Visible = False
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
    Top = 360
    Width = 646
    Height = 81
    Align = alBottom
    TabOrder = 3
    object btnExibeInfos: TButton
      Left = 16
      Top = 31
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
  end
  object pnlSelecaoPessoa: TPanel
    Left = 0
    Top = 0
    Width = 646
    Height = 41
    Align = alTop
    TabOrder = 4
    ExplicitLeft = 240
    ExplicitTop = 224
    ExplicitWidth = 185
    object rbdPessoaFisica: TRadioButton
      Left = 16
      Top = 13
      Width = 98
      Height = 17
      Caption = 'Pessoa F'#237'sica'
      TabOrder = 0
      OnClick = ConfiguraPessoa
    end
    object rbdPessoaJuridica: TRadioButton
      Left = 120
      Top = 13
      Width = 113
      Height = 17
      Caption = 'Pessoa Jur'#237'dica'
      TabOrder = 1
      OnClick = ConfiguraPessoa
    end
  end
end
