object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Win & Mensagens'
  ClientHeight = 464
  ClientWidth = 815
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
  object Label1: TLabel
    Left = 704
    Top = 16
    Width = 66
    Height = 20
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -20
    Font.Name = 'MS Gothic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 704
    Top = 42
    Width = 66
    Height = 20
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -20
    Font.Name = 'MS Gothic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FlowPanel: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 809
    Height = 458
    Align = alClient
    TabOrder = 0
    object buttonMensagem: TButton
      Left = 1
      Top = 1
      Width = 217
      Height = 88
      Caption = 'Mensagens'
      TabOrder = 0
      OnClick = buttonMensagemClick
    end
    object buttonClasses: TButton
      Left = 218
      Top = 1
      Width = 217
      Height = 88
      Caption = 'Classes'
      TabOrder = 1
      OnClick = buttonClassesClick
    end
  end
end
