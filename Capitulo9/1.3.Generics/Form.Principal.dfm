object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Generics'
  ClientHeight = 395
  ClientWidth = 644
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
  object ListBoxCores: TListBox
    AlignWithMargins = True
    Left = 448
    Top = 60
    Width = 193
    Height = 332
    Align = alRight
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBoxCoresClick
  end
  object PanelAddCor: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 57
    Align = alTop
    TabOrder = 1
    object EditCor: TEdit
      AlignWithMargins = True
      Left = 155
      Top = 18
      Width = 121
      Height = 21
      Margins.Top = 17
      Margins.Bottom = 17
      Align = alLeft
      TabOrder = 0
      OnKeyDown = EditCorKeyDown
      ExplicitTop = 16
    end
    object ButtonAdd: TButton
      AlignWithMargins = True
      Left = 282
      Top = 17
      Width = 75
      Height = 23
      Margins.Top = 16
      Margins.Bottom = 16
      Align = alLeft
      Caption = 'Add'
      TabOrder = 1
      OnClick = ButtonAddClick
      ExplicitTop = 4
      ExplicitHeight = 49
    end
    object ColorBoxCor: TColorBox
      AlignWithMargins = True
      Left = 4
      Top = 18
      Width = 145
      Height = 22
      Margins.Top = 17
      Margins.Bottom = 17
      Align = alLeft
      TabOrder = 2
      ExplicitTop = 16
    end
  end
  object PanelCor: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 439
    Height = 332
    Align = alClient
    Caption = 'Cor Selecionada'
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 2
  end
  object WebBrowser1: TWebBrowser
    Left = 448
    Top = 398
    Width = 300
    Height = 150
    TabOrder = 3
    ControlData = {
      4C000000021F0000810F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object TimerRandomColor: TTimer
    Interval = 10000
    OnTimer = TimerRandomColorTimer
    Left = 552
    Top = 144
  end
end
