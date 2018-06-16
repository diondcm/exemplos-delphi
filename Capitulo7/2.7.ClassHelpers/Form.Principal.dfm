object frmGridHelper: TfrmGridHelper
  Left = 0
  Top = 0
  Caption = 'Grid Helper'
  ClientHeight = 370
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gridDados: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 540
    Height = 364
    Align = alClient
    DataSource = dtsDados
    PopupMenu = PopupMenu
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = gridDadosTitleClick
  end
  object memDados: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 264
    Top = 192
    object memDadoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object memDadosdescricao: TStringField
      FieldName = 'descricao'
    end
  end
  object dtsDados: TDataSource
    DataSet = memDados
    Left = 264
    Top = 248
  end
  object PopupMenu: TPopupMenu
    Left = 432
    Top = 200
    object OrdenarporCdigo1: TMenuItem
      Caption = 'Ordenar por C'#243'digo'
      OnClick = OrdenarporCdigo1Click
    end
    object OrdenarporDescrio1: TMenuItem
      Caption = 'Ordenar por Descri'#231#227'o'
      OnClick = OrdenarporDescrio1Click
    end
  end
end
