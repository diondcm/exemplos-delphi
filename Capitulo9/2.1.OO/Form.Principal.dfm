object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'OO'
  ClientHeight = 435
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 476
    Top = 0
    Height = 435
    Align = alRight
    ExplicitLeft = 344
    ExplicitTop = 184
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 470
    Height = 429
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 272
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
    object ButtonCriaPessoa: TButton
      Left = 8
      Top = 16
      Width = 145
      Height = 57
      Caption = 'Pessoa'
      TabOrder = 0
      OnClick = ButtonCriaPessoaClick
    end
    object ButtonVisualiza: TButton
      Left = 8
      Top = 79
      Width = 145
      Height = 57
      Caption = 'Visualiza Pessoa'
      TabOrder = 1
      OnClick = ButtonVisualizaClick
    end
    object DBGrid1: TDBGrid
      Left = 32
      Top = 248
      Width = 320
      Height = 120
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object ButtonLibera: TButton
      Left = 8
      Top = 142
      Width = 145
      Height = 57
      Caption = 'Libera FPessoa'
      TabOrder = 3
      OnClick = ButtonLiberaClick
    end
    object GroupBoxLista: TGroupBox
      Left = 264
      Top = 16
      Width = 185
      Height = 209
      Caption = ' Lista '
      TabOrder = 4
      object ButtonPopula: TButton
        Left = 24
        Top = 16
        Width = 145
        Height = 57
        Caption = 'Popula Lista'
        TabOrder = 0
        OnClick = ButtonPopulaClick
      end
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 482
    Top = 3
    Width = 185
    Height = 429
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 248
    ExplicitTop = 192
    ExplicitHeight = 89
  end
end
