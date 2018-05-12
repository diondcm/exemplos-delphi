object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Var e obj'
  ClientHeight = 486
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memoLog: TMemo
    AlignWithMargins = True
    Left = 194
    Top = 3
    Width = 456
    Height = 480
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 288
    ExplicitTop = 104
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object panelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 185
    Height = 480
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 40
    ExplicitTop = 104
    ExplicitHeight = 41
    object buttonExemploObj: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 179
      Height = 45
      Align = alTop
      Caption = 'Exemplo Obj'
      TabOrder = 0
      OnClick = buttonExemploObjClick
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 177
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 54
      Width = 179
      Height = 43
      Align = alTop
      Caption = 'Obj Global'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 24
      Top = 103
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 24
      Top = 134
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 56
      Top = 232
      Width = 75
      Height = 25
      Caption = 'Button4'
      TabOrder = 4
      OnClick = Button4Click
    end
  end
end
