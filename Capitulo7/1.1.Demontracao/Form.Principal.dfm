object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Demontra'#231#227'o'
  ClientHeight = 414
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gridDados: TDBGrid
    Left = 0
    Top = 65
    Width = 524
    Height = 349
    Align = alClient
    DataSource = dtsDados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object navigatorDados: TDBNavigator
    Left = 0
    Top = 0
    Width = 524
    Height = 65
    DataSource = dtsDados
    Align = alTop
    TabOrder = 1
    ExplicitTop = -6
  end
  object cdsDados: TClientDataSet
    PersistDataPacket.Data = {
      470000009619E0BD010000001800000002000000000003000000470006436F64
      69676F04000100000000000944657363726963616F0100490000000100055749
      4454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 216
    object cdsDadosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsDadosDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
  object dtsDados: TDataSource
    DataSet = cdsDados
    Left = 136
    Top = 216
  end
end
