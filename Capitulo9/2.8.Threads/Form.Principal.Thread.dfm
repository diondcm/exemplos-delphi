object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Thread'
  ClientHeight = 514
  ClientWidth = 865
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
  object PanelExcept: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 859
    Height = 54
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 615
    object ButtonComExcept: TBitBtn
      AlignWithMargins = True
      Left = 699
      Top = 4
      Width = 75
      Height = 46
      Align = alRight
      Caption = 'Com Except'
      TabOrder = 0
      OnClick = ButtonComExceptClick
      ExplicitLeft = 16
      ExplicitTop = 24
      ExplicitHeight = 25
    end
    object ButtonSemExcept: TBitBtn
      AlignWithMargins = True
      Left = 780
      Top = 4
      Width = 75
      Height = 46
      Align = alRight
      Caption = 'Sem Except'
      TabOrder = 1
      OnClick = ButtonSemExceptClick
      ExplicitLeft = 113
      ExplicitTop = 24
      ExplicitHeight = 25
    end
    object ButtonStart: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 46
      Align = alLeft
      Caption = 'Start'
      TabOrder = 2
      OnClick = ButtonStartClick
      ExplicitLeft = 152
      ExplicitTop = 32
      ExplicitHeight = 25
    end
  end
  object PanelGauges: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 859
    Height = 448
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 224
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Gauge1: TGauge
      AlignWithMargins = True
      Left = 4
      Top = 319
      Width = 851
      Height = 57
      Align = alTop
      ForeColor = clLime
      Progress = 0
      ExplicitLeft = 136
      ExplicitTop = 48
      ExplicitWidth = 337
    end
    object Gauge2: TGauge
      AlignWithMargins = True
      Left = 4
      Top = 256
      Width = 851
      Height = 57
      Align = alTop
      ForeColor = clLime
      Progress = 0
      ExplicitLeft = 8
      ExplicitTop = 12
    end
    object Gauge3: TGauge
      AlignWithMargins = True
      Left = 4
      Top = 193
      Width = 851
      Height = 57
      Align = alTop
      ForeColor = clLime
      Progress = 0
      ExplicitLeft = 8
      ExplicitTop = 12
    end
    object Gauge4: TGauge
      AlignWithMargins = True
      Left = 4
      Top = 130
      Width = 851
      Height = 57
      Align = alTop
      ForeColor = clLime
      Progress = 0
      ExplicitLeft = 8
      ExplicitTop = 12
    end
    object Gauge5: TGauge
      AlignWithMargins = True
      Left = 4
      Top = 67
      Width = 851
      Height = 57
      Align = alTop
      ForeColor = clLime
      Progress = 0
      ExplicitLeft = 8
      ExplicitTop = 12
    end
    object Gauge6: TGauge
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 851
      Height = 57
      Align = alTop
      ForeColor = clLime
      Progress = 0
      ExplicitLeft = 8
      ExplicitTop = 12
    end
  end
end
