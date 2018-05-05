object frmUsuario: TfrmUsuario
  Left = 0
  Top = 0
  Caption = 'Cadastro de usu'#225'rio'
  ClientHeight = 524
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CategoryPanelGroup1: TCategoryPanelGroup
    Left = 0
    Top = 0
    Width = 600
    Height = 468
    VertScrollBar.Tracking = True
    Align = alClient
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 0
    ExplicitWidth = 483
    ExplicitHeight = 317
    object panalCadastroUsuario: TCategoryPanel
      Top = 215
      Caption = 'Cadastro de Usu'#225'rio'
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 11
        Height = 13
        Caption = 'ID'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 88
        Width = 70
        Height = 13
        Caption = 'Data Cadastro'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 23
        Width = 134
        Height = 21
        DataField = 'ID'
        DataSource = dtsUsuarios
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 64
        Width = 200
        Height = 21
        DataField = 'NOME'
        DataSource = dtsUsuarios
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 104
        Width = 150
        Height = 21
        DataField = 'DATACADATRO'
        DataSource = dtsUsuarios
        TabOrder = 2
      end
    end
    object panelGridUsuarios: TCategoryPanel
      Top = 0
      Height = 215
      Caption = 'Lista de usu'#225'rios'
      TabOrder = 1
      object grudUsuarios: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 590
        Height = 183
        Align = alClient
        DataSource = dtsUsuarios
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object DBNavigator1: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 471
    Width = 594
    Height = 50
    DataSource = dtsUsuarios
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 320
    ExplicitWidth = 477
  end
  object dtsUsuarios: TDataSource
    DataSet = dmdUsuario.qryUsuario
    Left = 336
    Top = 56
  end
  object timerOpen: TTimer
    Enabled = False
    OnTimer = timerOpenTimer
    Left = 400
    Top = 56
  end
end
