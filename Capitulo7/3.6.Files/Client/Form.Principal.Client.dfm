object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Client Files'
  ClientHeight = 353
  ClientWidth = 504
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
  object Label1: TLabel
    Left = 184
    Top = 8
    Width = 305
    Height = 241
    AutoSize = False
    Caption = 
      '1) Se o Datasnap Cria o Obj, ele Destroy. Neste caso EU n'#231'ao dev' +
      'o destruir o obj criado pelo DataSanp.           2) Seu EU criei' +
      ', por'#233'm passei o OBJ como PAr'#226'metro, O Datasnap vai destroir. Ne' +
      'ste caso EU N'#195'O destruo.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object buttonGetPessoa: TButton
    Left = 8
    Top = 8
    Width = 153
    Height = 73
    Caption = 'buttonGetPessoa'
    TabOrder = 0
    OnClick = buttonGetPessoaClick
  end
  object buttonSetPessoa: TButton
    Left = 8
    Top = 87
    Width = 153
    Height = 74
    Caption = 'buttonSetPessoa'
    TabOrder = 1
    OnClick = buttonSetPessoaClick
  end
  object Button1: TButton
    Left = 32
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 64
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 200
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
end
