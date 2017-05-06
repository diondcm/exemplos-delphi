object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Class Helpers'
  ClientHeight = 385
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memLog: TMemo
    Left = 256
    Top = 0
    Width = 207
    Height = 240
    Align = alRight
    TabOrder = 0
  end
  object btnExibeExtrato: TButton
    Left = 16
    Top = 24
    Width = 129
    Height = 25
    Caption = 'btnExibeExtrato'
    TabOrder = 1
    OnClick = btnExibeExtratoClick
  end
  object btnForDataSet: TButton
    Left = 16
    Top = 77
    Width = 129
    Height = 25
    Caption = 'btnForDataSet'
    TabOrder = 2
    OnClick = btnForDataSetClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 240
    Width = 463
    Height = 145
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object fmeTransacoes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 168
    Top = 192
    object fmeTransacoesDATA: TDateField
      FieldName = 'DATA'
    end
    object fmeTransacoesValor: TCurrencyField
      FieldName = 'Valor'
    end
    object fmeTransacoesCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object DataSource1: TDataSource
    DataSet = fmeTransacoes
    Left = 256
    Top = 200
  end
end
