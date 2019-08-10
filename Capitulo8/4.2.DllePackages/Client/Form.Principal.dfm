object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Client DLL'
  ClientHeight = 342
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
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 33
      Height = 33
      Align = alLeft
      Caption = 'Valor 1'
      Layout = tlCenter
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
      ExplicitHeight = 21
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
      ExplicitHeight = 21
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
  object Button5: TButton
    Left = 224
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Get - Class'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 224
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Set - Class'
    TabOrder = 5
    OnClick = Button6Click
  end
  object EditGet: TEdit
    Left = 305
    Top = 122
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object EditSet: TEdit
    Left = 305
    Top = 149
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object Button7: TButton
    Left = 224
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Get - Global'
    TabOrder = 8
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 224
    Top = 239
    Width = 75
    Height = 25
    Caption = 'Set - Global'
    TabOrder = 9
    OnClick = Button8Click
  end
  object EditGlobalGet: TEdit
    Left = 305
    Top = 210
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '0'
  end
  object EditGlobalSet: TEdit
    Left = 305
    Top = 237
    Width = 121
    Height = 21
    TabOrder = 11
    Text = '0'
  end
end
