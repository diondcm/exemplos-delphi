object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Email Serealizador'
  ClientHeight = 670
  ClientWidth = 1144
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelEmail: TPanel
    Left = 568
    Top = 8
    Width = 553
    Height = 321
    TabOrder = 0
    object lblInfo: TLabel
      Left = 40
      Top = 245
      Width = 407
      Height = 19
      Caption = 'Para baixar as DLLs do Indy: http://indy.fulgan.com/SSL/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 40
      Top = 270
      Width = 298
      Height = 13
      Caption = 'https://support.google.com/accounts/answer/6010255?hl=en'
    end
    object Label2: TLabel
      Left = 40
      Top = 289
      Width = 225
      Height = 13
      Caption = 'https://myaccount.google.com/lesssecureapps'
    end
    object buttonEnviarEmail: TButton
      Left = 40
      Top = 148
      Width = 75
      Height = 25
      Caption = 'Enviar Email'
      TabOrder = 0
      OnClick = buttonEnviarEmailClick
    end
    object editSenha: TEdit
      Left = 128
      Top = 150
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      TextHint = 'Informe a Senha'
    end
    object editDestinatario: TEdit
      Left = 40
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 2
      TextHint = 'Destinat'#225'rio'
    end
    object editAssunto: TEdit
      Left = 40
      Top = 75
      Width = 209
      Height = 21
      TabOrder = 3
      Text = 'Email teste'
      TextHint = 'Assunto'
    end
    object editUsuario: TEdit
      Left = 128
      Top = 123
      Width = 121
      Height = 21
      TabOrder = 4
      TextHint = 'Usu'#225'rio'
    end
    object memoBody: TMemo
      Left = 262
      Top = 75
      Width = 185
      Height = 98
      Lines.Strings = (
        'Teste,'
        ''
        'Esse '#233' um email de teste.'
        ''
        'Att,')
      TabOrder = 5
    end
    object checkAnexo: TCheckBox
      Left = 262
      Top = 52
      Width = 97
      Height = 17
      Caption = 'Enviar Anexo'
      TabOrder = 6
    end
  end
  object buttonMultiTabelas: TButton
    Left = 8
    Top = 8
    Width = 225
    Height = 69
    Caption = 'Multi-Tabelas'
    TabOrder = 1
    OnClick = buttonMultiTabelasClick
  end
end
