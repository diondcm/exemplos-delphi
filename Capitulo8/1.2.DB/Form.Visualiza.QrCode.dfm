object frmVIsualizaQrCode: TfrmVIsualizaQrCode
  Left = 0
  Top = 0
  Caption = 'QrCode'
  ClientHeight = 364
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ImageQrCode: TImage
    AlignWithMargins = True
    Left = 3
    Top = 55
    Width = 590
    Height = 306
    Align = alClient
    ExplicitLeft = 256
    ExplicitTop = 152
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object PanelDados: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 590
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 34
      Height = 13
      Caption = 'Dados:'
    end
    object MemoDados: TMemo
      Left = 59
      Top = 6
      Width = 105
      Height = 35
      TabOrder = 0
    end
    object ButtonGerar: TButton
      Left = 192
      Top = 5
      Width = 121
      Height = 37
      Caption = 'Gerar'
      TabOrder = 1
      OnClick = ButtonGerarClick
    end
  end
end
