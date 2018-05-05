object frmCadastroPessoa: TfrmCadastroPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 441
  ClientWidth = 621
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
  object memoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 293
    Width = 615
    Height = 145
    Align = alBottom
    PopupMenu = PopupMenu
    TabOrder = 0
    ExplicitTop = 320
    ExplicitWidth = 472
  end
  object panelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 615
    Height = 284
    Align = alClient
    BevelOuter = bvNone
    Caption = 'panelControles'
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 24
    ExplicitTop = 22
    ExplicitWidth = 361
    ExplicitHeight = 225
    object labelNome: TLabel
      Left = 24
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object labelID: TLabel
      Left = 240
      Top = 46
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object labelCPF: TLabel
      Left = 24
      Top = 101
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object editNome: TEdit
      Left = 24
      Top = 43
      Width = 120
      Height = 21
      TabOrder = 0
    end
    object editCPF: TMaskEdit
      Left = 24
      Top = 120
      Width = 120
      Height = 21
      EditMask = '000.000.000-00;1;_'
      MaxLength = 14
      TabOrder = 1
      Text = '   .   .   -  '
    end
    object buttonSalvaPessoa: TButton
      Left = 24
      Top = 168
      Width = 97
      Height = 49
      Caption = 'Salva Pessoa'
      TabOrder = 2
      OnClick = buttonSalvaPessoaClick
    end
  end
  object PopupMenu: TPopupMenu
    Left = 328
    Top = 208
    object ExibePessoa1: TMenuItem
      Caption = 'Exibe Pessoa'
      OnClick = ExibePessoa1Click
    end
  end
end
