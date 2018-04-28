object frmUsuario: TfrmUsuario
  Left = 0
  Top = 0
  Caption = 'Cadastro de usu'#225'rio'
  ClientHeight = 373
  ClientWidth = 483
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
  object CategoryPanelGroup1: TCategoryPanelGroup
    Left = 0
    Top = 0
    Width = 483
    Height = 373
    VertScrollBar.Tracking = True
    Align = alClient
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 0
    ExplicitLeft = 192
    ExplicitTop = 128
    ExplicitWidth = 200
    ExplicitHeight = 350
    object panelGridUsuarios: TCategoryPanel
      Top = 0
      Height = 368
      Caption = 'Lista de usu'#225'rios'
      TabOrder = 0
      object grudUsuarios: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 473
        Height = 336
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
  object dtsUsuarios: TDataSource
    DataSet = dmdUsuario.qryUsuario
    Left = 232
    Top = 192
  end
  object timerOpen: TTimer
    Enabled = False
    OnTimer = timerOpenTimer
    Left = 400
    Top = 56
  end
end
