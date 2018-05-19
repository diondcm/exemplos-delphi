object frmClassOf: TfrmClassOf
  Left = 0
  Top = 0
  Caption = 'Class Of'
  ClientHeight = 358
  ClientWidth = 558
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
  object panelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 185
    Height = 352
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 192
    ExplicitTop = 176
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 24
      Top = 248
      Width = 73
      Height = 13
      Caption = 'Configs Hoteis:'
    end
    object button5Estrelas: TButton
      AlignWithMargins = True
      Left = 3
      Top = 159
      Width = 179
      Height = 46
      Align = alTop
      Caption = 'Hotel 5 Estrelas'
      TabOrder = 0
      OnClick = button5EstrelasClick
      ExplicitLeft = 6
    end
    object button4Estrelas: TButton
      AlignWithMargins = True
      Left = 3
      Top = 107
      Width = 179
      Height = 46
      Align = alTop
      Caption = 'Hotel 4 Estrelas'
      TabOrder = 1
      OnClick = button4EstrelasClick
      ExplicitLeft = 6
      ExplicitTop = 11
    end
    object button3Estrelas: TButton
      AlignWithMargins = True
      Left = 3
      Top = 55
      Width = 179
      Height = 46
      Align = alTop
      Caption = 'Hotel 3 Estrelas'
      TabOrder = 2
      OnClick = button3EstrelasClick
      ExplicitLeft = 6
      ExplicitTop = 11
    end
    object buttonHotel: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 179
      Height = 46
      Align = alTop
      Caption = 'Hotel'
      TabOrder = 3
      OnClick = buttonHotelClick
      ExplicitLeft = 6
    end
    object comboHotel: TComboBox
      Left = 24
      Top = 264
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnCloseUp = comboHotelCloseUp
    end
  end
  object memoLog: TMemo
    AlignWithMargins = True
    Left = 194
    Top = 3
    Width = 361
    Height = 352
    Align = alClient
    TabOrder = 1
    ExplicitTop = -2
  end
end
