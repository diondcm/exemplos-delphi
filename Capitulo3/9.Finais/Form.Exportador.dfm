object frmExportador: TfrmExportador
  Left = 0
  Top = 0
  Caption = 'Exporta'#231#227'o de objetos'
  ClientHeight = 375
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memLinhas: TMemo
    Left = 0
    Top = 176
    Width = 699
    Height = 199
    Align = alBottom
    TabOrder = 0
  end
  object btnSerealiza: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 65
    Caption = 'Serealiza'
    TabOrder = 1
    OnClick = btnSerealizaClick
  end
end
