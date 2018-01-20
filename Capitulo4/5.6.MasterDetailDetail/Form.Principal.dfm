object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplos Fast'
  ClientHeight = 444
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object buttonMasterDetail: TButton
    Left = 8
    Top = 8
    Width = 153
    Height = 57
    Caption = 'Master Detail'
    TabOrder = 0
    OnClick = buttonMasterDetailClick
  end
  object Memo1: TMemo
    Left = 536
    Top = 294
    Width = 267
    Height = 142
    Color = clScrollBar
    Lines.Strings = (
      'Possibilidade  de converter relat'#243'rios do Rave e do '
      'Report Builder.'
      'Por meio dos uses:'
      'ConverterRR2FR - converte de Rave para Fast'
      'ConverterRB2FR - converte de ReportBuilder para '
      'Fast'
      ''
      'lReport := TfrxReport.Create(Self);'
      'lReport.LoadFromFile(Arquivo Rave ou RB);'
      'lReport.SaveToFile(Rel em FR);'
      '')
    TabOrder = 1
  end
  object timerTeste: TTimer
    Enabled = False
    OnTimer = timerTesteTimer
    Left = 24
    Top = 392
  end
end
