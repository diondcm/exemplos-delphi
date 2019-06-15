object frmTesteDateDB: TfrmTesteDateDB
  Left = 0
  Top = 0
  Caption = 'Teste DateDB'
  ClientHeight = 485
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DateTimePicker1: TDateTimePicker
    Left = 168
    Top = 128
    Width = 186
    Height = 21
    Date = 43631.000000000000000000
    Time = 0.389254456014896300
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 440
    Top = 208
    Width = 121
    Height = 21
    DataSource = dtsPessoa
    TabOrder = 1
  end
  object DBDateTimePiker1: TDBDateTimePiker
    Left = 168
    Top = 208
    Width = 186
    Height = 21
    Date = 43631.000000000000000000
    Time = 0.453252303239423800
    TabOrder = 2
    DataField = 'data_atual'
    DataSource = dtsData
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 304
    Width = 632
    Height = 178
    Align = alBottom
    DataSource = dtsData
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dtsPessoa: TDataSource
    Left = 456
    Top = 120
  end
  object dtsPedido: TDataSource
    Left = 544
    Top = 120
  end
  object memData: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 168
    object memDatadata_atual: TDateField
      FieldName = 'data_atual'
    end
  end
  object dtsData: TDataSource
    DataSet = memData
    Left = 88
    Top = 232
  end
end
