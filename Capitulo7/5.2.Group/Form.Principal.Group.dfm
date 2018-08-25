object frmPrincipalGroup: TfrmPrincipalGroup
  Left = 0
  Top = 0
  Caption = 'Group'
  ClientHeight = 460
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 541
    Height = 460
    ActivePage = tabSQLJoin
    Align = alClient
    TabOrder = 0
    object tabMasterDetail: TTabSheet
      Caption = 'Master-Detail'
      object panelControles: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 527
        Height = 62
        Align = alTop
        TabOrder = 0
        object buttonOpen: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 137
          Height = 54
          Align = alLeft
          Caption = 'Open'
          TabOrder = 0
          OnClick = buttonOpenClick
        end
        object buttonReport: TButton
          AlignWithMargins = True
          Left = 147
          Top = 4
          Width = 158
          Height = 54
          Align = alLeft
          Caption = 'Report'
          TabOrder = 1
          OnClick = buttonReportClick
        end
        object buttonExportarCateg: TButton
          AlignWithMargins = True
          Left = 311
          Top = 4
          Width = 175
          Height = 54
          Align = alLeft
          Caption = 'Exportar'
          DropDownMenu = PopupMenuExpo
          Style = bsSplitButton
          TabOrder = 2
          OnDropDownClick = buttonExportarCategDropDownClick
        end
      end
      object panelDados: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 71
        Width = 527
        Height = 358
        Align = alClient
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 1
          Top = 205
          Width = 525
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          ExplicitLeft = 5
          ExplicitTop = 225
          ExplicitWidth = 533
        end
        object labelCategorias: TLabel
          Left = 1
          Top = 1
          Width = 525
          Height = 13
          Align = alTop
          Caption = 'Categorias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 61
        end
        object gridCategorias: TDBGrid
          AlignWithMargins = True
          Left = 4
          Top = 17
          Width = 519
          Height = 185
          Align = alClient
          DataSource = dtsCategoria
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object Panel1: TPanel
          Left = 1
          Top = 208
          Width = 525
          Height = 149
          Align = alBottom
          Caption = 'Panel1'
          TabOrder = 1
          object labelProdutos: TLabel
            Left = 1
            Top = 1
            Width = 523
            Height = 13
            Align = alTop
            Caption = 'Produtos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 51
          end
          object gridProdutos: TDBGrid
            AlignWithMargins = True
            Left = 4
            Top = 17
            Width = 517
            Height = 128
            Align = alClient
            DataSource = dtsProduto
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
    end
    object tabSQLJoin: TTabSheet
      Caption = 'SQL-Join'
      ImageIndex = 1
      object panelControleJoin: TPanel
        Left = 0
        Top = 0
        Width = 533
        Height = 65
        Align = alTop
        TabOrder = 0
        object buttonOpenJoin: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 125
          Height = 57
          Align = alLeft
          Caption = 'Open'
          TabOrder = 0
          OnClick = buttonOpenJoinClick
        end
        object buttonReportJoin: TButton
          AlignWithMargins = True
          Left = 135
          Top = 4
          Width = 130
          Height = 57
          Align = alLeft
          Caption = 'Report'
          TabOrder = 1
          OnClick = buttonReportJoinClick
          ExplicitTop = 5
        end
        object buttonExpoSQL: TButton
          AlignWithMargins = True
          Left = 271
          Top = 4
          Width = 106
          Height = 57
          Align = alLeft
          Caption = 'Exportar'
          TabOrder = 2
          OnClick = buttonExpoSQLClick
          ExplicitTop = 5
        end
      end
      object gridJoin: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 68
        Width = 527
        Height = 361
        Align = alClient
        DataSource = dtsJoin
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object TimerOpen: TTimer
    Enabled = False
    OnTimer = TimerOpenTimer
    Left = 64
    Top = 144
  end
  object dtsCategoria: TDataSource
    DataSet = dmdGroup.qryCategoria
    Left = 264
    Top = 208
  end
  object dtsProduto: TDataSource
    DataSet = dmdGroup.qryProduto
    Left = 256
    Top = 336
  end
  object dtsJoin: TDataSource
    DataSet = dmdGroup.qryListaProdutos
    Left = 464
    Top = 160
  end
  object PopupMenuExpo: TPopupMenu
    Left = 376
    Top = 152
    object PDF1: TMenuItem
      Caption = 'PDF'
      OnClick = PDF1Click
    end
    object JPG1: TMenuItem
      Caption = 'JPG'
      OnClick = JPG1Click
    end
    object HTML1: TMenuItem
      Caption = 'HTML'
      OnClick = HTML1Click
    end
    object XLS1: TMenuItem
      Caption = 'XLS'
      OnClick = XLS1Click
    end
    object XLSX1: TMenuItem
      Caption = 'XLSX'
      OnClick = XLSX1Click
    end
  end
end
