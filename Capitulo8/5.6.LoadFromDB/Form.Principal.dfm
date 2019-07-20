object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Load From DB'
  ClientHeight = 398
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object buttonRelatorio: TBitBtn
    Left = 8
    Top = 8
    Width = 193
    Height = 57
    Caption = 'Relat'#243'rio'
    TabOrder = 0
    OnClick = buttonRelatorioClick
  end
  object ButtonSalvarRel: TButton
    Left = 8
    Top = 356
    Width = 137
    Height = 34
    Caption = 'Salvar Rel'
    TabOrder = 1
    OnClick = ButtonSalvarRelClick
  end
end
