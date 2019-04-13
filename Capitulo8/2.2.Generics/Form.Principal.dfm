object frmGenerics: TfrmGenerics
  Left = 0
  Top = 0
  Caption = 'Generics'
  ClientHeight = 434
  ClientWidth = 611
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
    Top = 302
    Width = 605
    Height = 129
    Align = alBottom
    Color = clLime
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 208
    ExplicitWidth = 600
  end
  object PanelControle: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 605
    Height = 46
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 600
    object ButtonAlterar: TButton
      AlignWithMargins = True
      Left = 526
      Top = 4
      Width = 75
      Height = 38
      Align = alRight
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = ButtonAlterarClick
      ExplicitLeft = 521
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
      Height = 21
      TabOrder = 2
      TextHint = 'Nome da cor'
    end
  end
  object ListBoxCores: TListBox
    AlignWithMargins = True
    Left = 381
    Top = 55
    Width = 227
    Height = 241
    Align = alRight
    ItemHeight = 13
    TabOrder = 2
    OnClick = ListBoxCoresClick
    ExplicitLeft = 376
    ExplicitHeight = 147
  end
  object ButtonArrays: TButton
    Left = 8
    Top = 88
    Width = 148
    Height = 33
    Caption = 'Arrays'
    TabOrder = 3
    OnClick = ButtonArraysClick
  end
  object Button2: TButton
    Left = 8
    Top = 136
    Width = 148
    Height = 33
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button2Click
  end
end
