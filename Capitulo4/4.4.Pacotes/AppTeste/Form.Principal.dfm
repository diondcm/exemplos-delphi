object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pacotes'
  ClientHeight = 288
  ClientWidth = 430
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
  object buttonDinamico: TButton
    Left = 24
    Top = 24
    Width = 129
    Height = 33
    Caption = 'M'#233'todo Din'#226'mico'
    TabOrder = 0
    OnClick = buttonDinamicoClick
  end
  object buttonExibeForm: TButton
    Left = 24
    Top = 63
    Width = 129
    Height = 34
    Caption = 'Exibe Form'
    TabOrder = 1
    OnClick = buttonExibeFormClick
  end
  object buttonViaMetodo: TButton
    Left = 24
    Top = 103
    Width = 129
    Height = 33
    Caption = 'Form via M'#233'todo'
    TabOrder = 2
    OnClick = buttonViaMetodoClick
  end
end
