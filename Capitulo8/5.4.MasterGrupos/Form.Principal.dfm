object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Mastergurpos'
  ClientHeight = 231
  ClientWidth = 505
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 505
    Height = 57
    ButtonHeight = 21
    ButtonWidth = 77
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'Master Grupos'
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 77
      Top = 0
      Caption = 'Gr'#225'fico'
      ImageIndex = 1
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 154
      Top = 0
      Caption = 'Templates'
      ImageIndex = 2
      OnClick = ToolButton3Click
    end
  end
end
