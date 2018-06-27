object frmClasses: TfrmClasses
  Left = 0
  Top = 0
  Caption = 'Classes'
  ClientHeight = 388
  ClientWidth = 478
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
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 472
    Height = 382
    Align = alClient
    DataSource = dtsEstoque
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object memTipoEstoque: TFDMemTable
    AfterOpen = memTipoEstoqueAfterOpen
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 232
    Top = 168
    object memTipoEstoqueID: TIntegerField
      FieldName = 'ID'
    end
    object memTipoEstoqueDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object memEstoque: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 136
    Top = 168
    object memEstoqueID_estoque: TIntegerField
      FieldName = 'ID_estoque'
    end
    object memEstoqueDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object memEstoqueID_Tipo: TIntegerField
      FieldName = 'ID_Tipo'
      Visible = False
    end
    object memEstoqueDesc_Tipo_estoque: TStringField
      FieldKind = fkLookup
      FieldName = 'Desc_Tipo_estoque'
      LookupDataSet = memTipoEstoque
      LookupKeyFields = 'ID'
      LookupResultField = 'Descricao'
      KeyFields = 'ID_Tipo'
      Size = 50
      Lookup = True
    end
  end
  object dtsEstoque: TDataSource
    DataSet = memEstoque
    Left = 400
    Top = 304
  end
end
