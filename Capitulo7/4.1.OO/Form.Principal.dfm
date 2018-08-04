object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'OO'
  ClientHeight = 385
  ClientWidth = 663
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
  object gauge: TGauge
    Left = 6
    Top = 325
    Width = 473
    Height = 52
    Progress = 0
  end
  object Button1: TButton
    Left = 8
    Top = 24
    Width = 145
    Height = 65
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 95
    Width = 145
    Height = 66
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  inline Frame11: TFrame1
    Left = 159
    Top = 80
    Width = 226
    Height = 148
    TabOrder = 2
    ExplicitLeft = 159
    ExplicitTop = 80
    ExplicitWidth = 226
    ExplicitHeight = 148
    inherited Button1: TButton
      Caption = 'Alterado Filho'
    end
  end
  inline Frame12: TFrame1
    Left = 424
    Top = 24
    Width = 209
    Height = 148
    TabOrder = 3
    ExplicitLeft = 424
    ExplicitTop = 24
    ExplicitWidth = 209
    ExplicitHeight = 148
  end
end
