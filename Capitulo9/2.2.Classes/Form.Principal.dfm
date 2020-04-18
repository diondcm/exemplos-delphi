object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Classes'
  ClientHeight = 385
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 531
    Height = 332
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 184
    ExplicitTop = 168
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 531
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 152
    ExplicitTop = 208
    ExplicitWidth = 185
    object ButtonHotel: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Cria Hotel'
      TabOrder = 0
      OnClick = ButtonHotelClick
      ExplicitLeft = 232
      ExplicitTop = 32
      ExplicitHeight = 25
    end
    object ButtonClassName: TButton
      AlignWithMargins = True
      Left = 85
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Class Name'
      TabOrder = 1
      OnClick = ButtonClassNameClick
      ExplicitLeft = 120
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object ComboBoxClasse: TComboBox
      Left = 376
      Top = 10
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = ComboBoxClasseChange
    end
    object ButtonInstancce: TButton
      AlignWithMargins = True
      Left = 166
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Instance'
      TabOrder = 3
      OnClick = ButtonInstancceClick
      ExplicitLeft = 216
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
end
