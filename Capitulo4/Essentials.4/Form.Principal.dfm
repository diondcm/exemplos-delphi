object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ActiveControl = gridPessoa
  Caption = 'Cadastro Pessoa'
  ClientHeight = 638
  ClientWidth = 975
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
  object gridPessoa: TDBGrid
    Left = 0
    Top = 379
    Width = 975
    Height = 259
    Align = alBottom
    DataSource = dtsPessoa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridPessoaDblClick
  end
  object NavPessoa: TDBNavigator
    Left = 0
    Top = 315
    Width = 975
    Height = 64
    DataSource = dtsPessoa
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbRefresh]
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 152
    ExplicitWidth = 859
  end
  object buttonConnect: TButton
    Left = 8
    Top = 16
    Width = 105
    Height = 33
    Caption = 'Conectar'
    TabOrder = 2
    OnClick = buttonConnectClick
  end
  object buttonCadastrar: TButton
    Left = 119
    Top = 16
    Width = 130
    Height = 33
    Caption = 'Cadastrar'
    TabOrder = 3
    OnClick = buttonCadastrarClick
  end
  object memoLog: TMemo
    Left = 648
    Top = 0
    Width = 327
    Height = 315
    Align = alRight
    TabOrder = 4
  end
  object buttonExibePessoa: TButton
    Left = 8
    Top = 55
    Width = 105
    Height = 34
    Caption = 'Exibir Pessoa'
    TabOrder = 5
    OnClick = buttonExibePessoaClick
  end
  object buttonEditaObjeto: TButton
    Left = 119
    Top = 55
    Width = 130
    Height = 34
    Caption = 'Editar por Objeto'
    TabOrder = 6
    OnClick = buttonEditaObjetoClick
  end
  object dtsPessoa: TDataSource
    DataSet = dmdPessoa.cdsPessoa
    Left = 56
    Top = 224
  end
end
