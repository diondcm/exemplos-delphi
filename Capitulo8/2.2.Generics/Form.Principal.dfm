object frmGenerics: TfrmGenerics
  Left = 0
  Top = 0
  Caption = 'Generics'
  ClientHeight = 340
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PanelCor: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 208
    Width = 600
    Height = 129
    Align = alBottom
    Color = clLime
    ParentBackground = False
    TabOrder = 0
  end
  object PanelControle: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 600
    Height = 46
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -2
    object ButtonAlterar: TButton
      AlignWithMargins = True
      Left = 521
      Top = 4
      Width = 75
      Height = 38
      Align = alRight
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = ButtonAlterarClick
      ExplicitLeft = 296
      ExplicitTop = 24
      ExplicitHeight = 25
    end
    object ColorBoxCores: TColorBox
      Left = 8
      Top = 12
      Width = 145
      Height = 22
      TabOrder = 1
    end
    object EditNomeCor: TEdit
      Left = 161
      Top = 12
      Width = 121
      Height = 22
      TabOrder = 2
      TextHint = 'Nome da cor'
    end
  end
  object ListBoxCores: TListBox
    AlignWithMargins = True
    Left = 376
    Top = 55
    Width = 227
    Height = 147
    Align = alRight
    ItemHeight = 13
    TabOrder = 2
    OnClick = ListBoxCoresClick
    ExplicitLeft = 371
  end
end
