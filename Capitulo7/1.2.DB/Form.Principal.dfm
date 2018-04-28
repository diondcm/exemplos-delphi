object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Acesso DB'
  ClientHeight = 391
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 536
    Height = 65
    ButtonHeight = 21
    ButtonWidth = 48
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 0
    object buttonUsuarios: TToolButton
      AlignWithMargins = True
      Left = 0
      Top = 0
      Caption = 'Usu'#225'rios'
      ImageIndex = 0
      OnClick = buttonUsuariosClick
    end
  end
end
