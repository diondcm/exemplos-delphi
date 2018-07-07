object frmCDS: TfrmCDS
  Left = 0
  Top = 0
  Caption = 'CDS'
  ClientHeight = 531
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 148
    Width = 596
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitWidth = 201
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 386
    Width = 596
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 151
    ExplicitWidth = 206
  end
  object panelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 392
    Width = 590
    Height = 136
    Align = alBottom
    TabOrder = 0
    object buttonCriaDados: TButton
      Left = 4
      Top = 3
      Width = 133
      Height = 38
      Caption = 'Criar Dados'
      TabOrder = 0
      OnClick = buttonCriaDadosClick
    end
    object buttonSalvarDados: TButton
      Left = 4
      Top = 47
      Width = 133
      Height = 38
      Caption = 'Salvar Dados'
      TabOrder = 1
      OnClick = buttonSalvarDadosClick
    end
    object buttonAbreConexao: TButton
      Left = 143
      Top = 3
      Width = 133
      Height = 38
      Caption = 'Abrir Conex'#227'o'
      TabOrder = 2
    end
    object buttonFecharConexao: TButton
      Left = 143
      Top = 47
      Width = 133
      Height = 38
      Caption = 'Fechar Conex'#227'o'
      TabOrder = 3
    end
    object Button1: TButton
      Left = 304
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 4
      OnClick = Button1Click
    end
    object buttonDS2010: TButton
      Left = 451
      Top = 3
      Width = 135
      Height = 42
      Caption = 'DS - 2010'
      TabOrder = 5
      OnClick = buttonDS2010Click
    end
  end
  object panelMoeda: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 590
    Height = 142
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 582
      Height = 25
      DataSource = dtsMoeda
      Align = alTop
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 582
      Height = 103
      Align = alClient
      DataSource = dtsMoeda
      PopupMenu = PopupMenu
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object panelCotacao: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 154
    Width = 399
    Height = 229
    Align = alClient
    TabOrder = 2
    object DBNavigator2: TDBNavigator
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 391
      Height = 25
      DataSource = dtsCotacao
      Align = alTop
      TabOrder = 0
    end
    object DBGrid2: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 391
      Height = 190
      Align = alClient
      DataSource = dtsCotacao
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object panelGrafico: TPanel
    AlignWithMargins = True
    Left = 408
    Top = 154
    Width = 185
    Height = 229
    Align = alRight
    TabOrder = 3
    Visible = False
  end
  object dtsCotacao: TDataSource
    DataSet = dmdCDS.cdsCotacao
    Left = 208
    Top = 224
  end
  object dtsMoeda: TDataSource
    DataSet = dmdCDS.cdsMoeda
    Left = 336
    Top = 40
  end
  object timerOpen: TTimer
    Enabled = False
    OnTimer = timerOpenTimer
    Left = 480
    Top = 248
  end
  object PopupMenu: TPopupMenu
    Left = 456
    Top = 64
    object ExibirHistrico1: TMenuItem
      Caption = 'Exibir Hist'#243'rico'
      OnClick = ExibirHistrico1Click
    end
  end
end
