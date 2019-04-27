object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Stack & Heap'
  ClientHeight = 380
  ClientWidth = 626
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
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 438
    Top = 3
    Width = 185
    Height = 374
    Align = alRight
    Color = clMoneyGreen
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 80
    ExplicitHeight = 89
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 429
    Height = 374
    Align = alClient
    TabOrder = 1
    ExplicitTop = -2
    object ButtonVars: TButton
      Left = 8
      Top = 8
      Width = 121
      Height = 57
      Caption = 'Valores Stack'
      TabOrder = 0
      OnClick = ButtonVarsClick
    end
    object Button1: TButton
      Left = 64
      Top = 216
      Width = 121
      Height = 89
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 71
      Width = 121
      Height = 57
      Caption = 'Valores Heap'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 8
      Top = 144
      Width = 121
      Height = 57
      Caption = 'Stack Overflow'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 256
      Top = 120
      Width = 161
      Height = 57
      Caption = 'Variants'
      TabOrder = 4
      OnClick = Button4Click
    end
  end
end
