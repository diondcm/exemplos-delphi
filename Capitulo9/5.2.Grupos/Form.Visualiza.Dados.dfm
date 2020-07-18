object frmVisualizaDados: TfrmVisualizaDados
  Left = 0
  Top = 0
  Caption = 'Visualizar Dados'
  ClientHeight = 443
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 217
    Width = 710
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 136
    ExplicitWidth = 247
  end
  object PanelMaster: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 217
    Align = alTop
    TabOrder = 0
    object StatusBarMaster: TStatusBar
      AlignWithMargins = True
      Left = 4
      Top = 194
      Width = 702
      Height = 19
      Panels = <
        item
          Width = 300
        end>
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 702
      Height = 153
      Align = alClient
      DataSource = dtsMaster
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = DBGrid1TitleClick
    end
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 702
      Height = 25
      DataSource = dtsMaster
      Align = alTop
      TabOrder = 2
    end
  end
  object PanelDetail: TPanel
    Left = 0
    Top = 220
    Width = 710
    Height = 223
    Align = alClient
    TabOrder = 1
    object StatusBarDetail: TStatusBar
      AlignWithMargins = True
      Left = 4
      Top = 200
      Width = 702
      Height = 19
      Panels = <
        item
          Width = 300
        end>
    end
    object DBNavigator2: TDBNavigator
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 702
      Height = 25
      DataSource = dtsDetail
      Align = alTop
      TabOrder = 1
    end
    object DBGrid2: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 702
      Height = 159
      Align = alClient
      DataSource = dtsDetail
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = DBGrid2TitleClick
    end
  end
  object dtsMaster: TDataSource
    OnStateChange = dtsMasterStateChange
    Left = 200
    Top = 64
  end
  object dtsDetail: TDataSource
    OnDataChange = dtsDetailDataChange
    Left = 200
    Top = 240
  end
end
