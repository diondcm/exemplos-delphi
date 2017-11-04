object frmMultiTabelas: TfrmMultiTabelas
  Left = 0
  Top = 0
  Caption = 'Multi-Tabelas'
  ClientHeight = 737
  ClientWidth = 1326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelOrders: TPanel
    Left = 0
    Top = 0
    Width = 1326
    Height = 193
    Align = alTop
    TabOrder = 0
    object labelOrders: TLabel
      Left = 1
      Top = 1
      Width = 1324
      Height = 19
      Align = alTop
      Caption = 'Orders'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 54
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 20
      Width = 1324
      Height = 25
      DataSource = dtsOrders
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 105
      ExplicitTop = 104
      ExplicitWidth = 240
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 45
      Width = 1324
      Height = 147
      Align = alClient
      DataSource = dtsOrders
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object panelItems: TPanel
    Left = 0
    Top = 193
    Width = 1326
    Height = 184
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 1324
      Height = 19
      Align = alTop
      Caption = 'Items'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 2
      ExplicitTop = 6
    end
    object DBNavigator2: TDBNavigator
      Left = 1
      Top = 20
      Width = 1324
      Height = 25
      DataSource = dtsItems
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 343
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 45
      Width = 1324
      Height = 138
      Align = alClient
      DataSource = dtsItems
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object panelXML: TPanel
    Left = 0
    Top = 456
    Width = 1326
    Height = 281
    Align = alBottom
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 633
      Top = 42
      Height = 238
      ExplicitLeft = 664
      ExplicitTop = 88
      ExplicitHeight = 100
    end
    object panelControlesXML: TPanel
      Left = 1
      Top = 1
      Width = 1324
      Height = 41
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = -5
      object checkImportador: TCheckBox
        Left = 16
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Importador'
        TabOrder = 0
        OnClick = checkImportadorClick
      end
      object buttomCarregaXML: TButton
        Left = 168
        Top = 4
        Width = 169
        Height = 30
        Caption = 'Carregar XML'
        TabOrder = 1
        OnClick = buttomCarregaXMLClick
      end
      object buttomEnviaOrdem: TButton
        Left = 512
        Top = 4
        Width = 177
        Height = 29
        Caption = 'Enviar Ordem'
        TabOrder = 2
        OnClick = buttomEnviaOrdemClick
      end
      object checkLiberaCommit: TCheckBox
        Left = 704
        Top = 10
        Width = 97
        Height = 17
        Caption = 'Liberar Commit'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
    object gridOrdersXML: TDBGrid
      Left = 1
      Top = 42
      Width = 632
      Height = 238
      Align = alLeft
      DataSource = dtsOrdersXML
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object gridItemsXML: TDBGrid
      Left = 636
      Top = 42
      Width = 689
      Height = 238
      Align = alClient
      DataSource = dtsItemsXML
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dtsOrders: TDataSource
    DataSet = qryOrders
    Left = 976
    Top = 72
  end
  object dtsItems: TDataSource
    DataSet = qryItems
    Left = 976
    Top = 192
  end
  object qryOrders: TFDQuery
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select * from orders'
      'order by custNo')
    Left = 1048
    Top = 72
  end
  object qryItems: TFDQuery
    MasterSource = dtsOrders
    MasterFields = 'orderno'
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      'select * from items'
      'where orderno = :orderno'
      'order by itemno')
    Left = 1048
    Top = 184
    ParamData = <
      item
        Name = 'ORDERNO'
        ParamType = ptInput
      end>
  end
  object memOrders: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 264
    Top = 528
  end
  object memItems: TFDMemTable
    IndexFieldNames = 'orderno;itemno'
    MasterSource = dtsOrdersXML
    MasterFields = 'Orderno'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 880
    Top = 544
  end
  object dtsOrdersXML: TDataSource
    DataSet = memOrders
    Left = 264
    Top = 592
  end
  object dtsItemsXML: TDataSource
    DataSet = memItems
    Left = 880
    Top = 592
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.xml'
    Filter = 'XML|*.xml'
    Left = 360
    Top = 456
  end
  object timerImport: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = timerImportTimer
    Left = 16
    Top = 424
  end
end
