object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Grid Plus Test'
  ClientHeight = 373
  ClientWidth = 612
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
  object navDados: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 325
    Width = 606
    Height = 45
    DataSource = dtsDados
    Align = alBottom
    TabOrder = 0
  end
  object memDados: TFDMemTable
    AfterOpen = memDadosAfterOpen
    OnCalcFields = memDadosCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 24
    object memDadosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object memDadosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object memDadosDataCadastro: TDateField
      FieldName = 'DataCadastro'
    end
    object memDadosTempoCadastro: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TempoCadastro'
      Calculated = True
    end
  end
  object dtsDados: TDataSource
    DataSet = memDados
    Left = 136
    Top = 24
  end
end
