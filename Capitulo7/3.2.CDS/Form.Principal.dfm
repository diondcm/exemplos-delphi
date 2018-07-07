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
      ExplicitLeft = 176
      ExplicitTop = 32
      ExplicitWidth = 240
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 582
      Height = 103
      Align = alClient
      DataSource = dtsMoeda
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
    ExplicitLeft = 216
    ExplicitTop = 232
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBNavigator2: TDBNavigator
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 391
      Height = 25
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 80
      ExplicitTop = 88
      ExplicitWidth = 240
    end
    object DBGrid2: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 391
      Height = 190
      Align = alClient
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
    ExplicitLeft = 192
    ExplicitTop = 184
    ExplicitHeight = 41
  end
  object dtsCotacao: TDataSource
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
    Left = 520
    Top = 160
  end
end
