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
    object buttonLerObjGlobal: TButton
      AlignWithMargins = True
      Left = 3
      Top = 102
      Width = 179
      Height = 43
      Align = alTop
      Caption = 'Obj Global - Ler'
      TabOrder = 1
      OnClick = buttonLerObjGlobalClick
      ExplicitLeft = 6
      ExplicitTop = 148
    end
    object buttonGlobalCreate: TButton
      AlignWithMargins = True
      Left = 3
      Top = 54
      Width = 179
      Height = 42
      Align = alTop
      Caption = 'Global Create'
      TabOrder = 2
      OnClick = buttonGlobalCreateClick
      ExplicitLeft = 6
      ExplicitTop = 71
    end
    object ButtonGlobalFree: TButton
      AlignWithMargins = True
      Left = 3
      Top = 151
      Width = 179
      Height = 42
      Align = alTop
      Caption = 'Global Free'
      TabOrder = 3
      OnClick = ButtonGlobalFreeClick
    end
  end
end
