object frmPrincipalTesteWS: TfrmPrincipalTesteWS
  Left = 0
  Top = 0
  Caption = 'TesteWS'
  ClientHeight = 361
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 691
    Height = 287
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 155
    ExplicitHeight = 198
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 691
    Height = 62
    Align = alTop
    TabOrder = 1
    object ButtonGetWS: TButton
      Left = 14
      Top = 8
      Width = 99
      Height = 41
      Caption = 'Get WS'
      TabOrder = 0
      OnClick = ButtonGetWSClick
    end
  end
end
