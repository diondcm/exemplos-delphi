object frmBaseAjuda: TfrmBaseAjuda
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblMensagem: TLabel
    Left = 280
    Top = 152
    Width = 61
    Height = 13
    Caption = 'lblMensagem'
  end
  object LinkLabel: TLinkLabel
    Left = 232
    Top = 200
    Width = 156
    Height = 19
    Caption = 'http://www.aquasoft.com.br'
    TabOrder = 0
    UseVisualStyle = True
    OnClick = LinkLabelClick
    OnMouseLeave = LinkLabelMouseLeave
    OnMouseMove = LinkLabelMouseMove
  end
end
