object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Remote Debug'
  ClientHeight = 339
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object buttonZip: TButton
    Left = 8
    Top = 8
    Width = 129
    Height = 89
    Caption = 'Zip'
    TabOrder = 0
    OnClick = buttonZipClick
  end
  object FileOpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    OkButtonLabel = 'Selecione a pasta'
    Options = [fdoPickFolders]
    Left = 432
    Top = 16
  end
end
