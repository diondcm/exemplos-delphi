object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Teste Panel'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelObrigatorio1: TPanelObrigatorio
    Left = 72
    Top = 48
    Width = 185
    Height = 41
    DataSource = DataSource1
  end
  object Memo1: TMemo
    Left = 72
    Top = 152
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object DataSource1: TDataSource
    Left = 352
    Top = 40
  end
end
