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
  object DBEdit1: TDBEdit
    Left = 448
    Top = 184
    Width = 121
    Height = 21
    DataSource = dtsPessoa
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 304
    Width = 632
    Height = 178
    Align = alBottom
    DataSource = dtsData
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 288
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBDateTimePiker1: TDBDateTimePiker
    Left = 168
    Top = 184
    Width = 186
    Height = 21
    Date = 43631.000000000000000000
    Time = 0.502401261575869300
    TabOrder = 3
  end
  object TimePicker1: TTimePicker
    Left = 80
    Top = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
    Time = 43631.509889282410000000
    TimeFormat = 'hh:mm'
  end
  object MonthCalendar1: TMonthCalendar
    Left = 272
    Top = 8
    Width = 225
    Height = 160
    Date = 43631.000000000000000000
    TabOrder = 5
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
