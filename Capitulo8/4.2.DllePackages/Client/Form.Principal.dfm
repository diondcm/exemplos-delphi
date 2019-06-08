object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Client DLL'
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
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 499
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -2
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 33
      Height = 33
      Align = alLeft
      Caption = 'Valor 1'
      Layout = tlCenter
      ExplicitLeft = 120
      ExplicitTop = 0
      ExplicitHeight = 13
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 119
      Top = 4
      Width = 33
      Height = 33
      Align = alLeft
      Caption = 'Valor 2'
      Layout = tlCenter
      ExplicitLeft = 170
      ExplicitHeight = 13
    end
    object EditValor1: TEdit
      AlignWithMargins = True
      Left = 43
      Top = 11
      Width = 70
      Height = 19
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alLeft
      TabOrder = 0
    end
    object EditValor2: TEdit
      AlignWithMargins = True
      Left = 158
      Top = 11
      Width = 67
      Height = 19
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alLeft
      TabOrder = 1
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 420
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Processar'
      TabOrder = 2
      OnClick = Button1Click
      ExplicitLeft = 368
      ExplicitTop = 24
      ExplicitHeight = 25
    end
  end
  object Button2: TButton
    Left = 8
    Top = 50
    Width = 121
    Height = 41
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 97
    Width = 121
    Height = 40
    Caption = 'Button3'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 143
    Width = 121
    Height = 42
    Caption = 'Button4'
    TabOrder = 3
    OnClick = Button4Click
  end
end
