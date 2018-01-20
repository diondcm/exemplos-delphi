object frmMasterDetail: TfrmMasterDetail
  Left = 0
  Top = 0
  Caption = 'Master Detail'
  ClientHeight = 499
  ClientWidth = 954
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
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 89
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 144
    Width = 948
    Height = 352
    Align = alBottom
    DataSource = dtsCustomer
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 144
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
  end
  object dtsCustomer: TDataSource
    DataSet = dmdDBDemos.memCustomer
    Left = 480
    Top = 352
  end
end
