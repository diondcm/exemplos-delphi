object frmCadastroPessoa: TfrmCadastroPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 441
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 293
    Width = 465
    Height = 145
    Align = alBottom
    PopupMenu = PopupMenu
    TabOrder = 0
    ExplicitWidth = 615
  end
  object panelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 465
    Height = 284
    Align = alClient
    BevelOuter = bvNone
    Caption = 'panelControles'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 615
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
      Width = 120
      Height = 49
      Caption = 'Salva Pessoa'
      TabOrder = 2
      OnClick = buttonSalvaPessoaClick
    end
    object radioCDS: TRadioButton
      Left = 208
      Top = 240
      Width = 113
      Height = 17
      Caption = 'Cds'
      TabOrder = 3
      OnClick = radioCDSClick
    end
    object radioMem: TRadioButton
      Left = 344
      Top = 240
      Width = 113
      Height = 17
      Caption = 'MemTable'
      TabOrder = 4
      OnClick = radioMemClick
    end
    object ToggleSwitchSalvar: TToggleSwitch
      Left = 24
      Top = 248
      Width = 107
      Height = 20
      StateCaptions.CaptionOn = 'Salvando'
      StateCaptions.CaptionOff = 'N'#227'o salvar'
      TabOrder = 5
    end
  end
  object PopupMenu: TPopupMenu
    Left = 248
    Top = 176
    object ExibePessoa1: TMenuItem
      Caption = 'Exibe Pessoa'
      OnClick = ExibePessoa1Click
    end
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 48
  end
  object memPessoa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 392
    Top = 48
  end
end
