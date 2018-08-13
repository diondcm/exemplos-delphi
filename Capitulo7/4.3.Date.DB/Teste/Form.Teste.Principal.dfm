object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste Comp'
  ClientHeight = 313
  ClientWidth = 436
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
  object gridDados: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 151
    Width = 430
    Height = 120
    Align = alBottom
    DataSource = dtsDados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 277
    Width = 430
    Height = 33
    DataSource = dtsDados
    Align = alBottom
    TabOrder = 1
  end
  object memPessoa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 296
    Top = 136
    object memPessoaDataCadastro: TDateField
      FieldName = 'DataCadastro'
    end
    object memPessoaNome: TStringField
      FieldName = 'Nome'
    end
    object memPessoaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object dtsDados: TDataSource
    DataSet = memPessoa
    Left = 296
    Top = 216
  end
  object timerOpen: TTimer
    Enabled = False
    OnTimer = timerOpenTimer
    Left = 40
    Top = 24
  end
end
