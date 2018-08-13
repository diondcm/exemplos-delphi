object frmMonitoraDir: TfrmMonitoraDir
  Left = 0
  Top = 0
  Caption = 'Monitora Dir'
  ClientHeight = 341
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 129
    Height = 97
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 288
    Top = 8
    Width = 185
    Height = 297
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object editPasta: TEdit
    Left = 8
    Top = 312
    Width = 465
    Height = 21
    TabOrder = 2
    TextHint = 'Clique para selecionar'
    OnClick = editPastaClick
  end
  object FileOpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    OkButtonLabel = 'Selecione a Pasta'
    Options = [fdoPickFolders]
    Left = 232
    Top = 280
  end
end
