object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Win'
  ClientHeight = 430
  ClientWidth = 478
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
  object buttonClasses: TButton
    Left = 16
    Top = 24
    Width = 145
    Height = 57
    Caption = 'Ler Classes'
    TabOrder = 0
    OnClick = buttonClassesClick
  end
  object buttonCriaForm: TButton
    Left = 16
    Top = 87
    Width = 145
    Height = 66
    Caption = 'Criar Form'
    TabOrder = 1
    OnClick = buttonCriaFormClick
  end
  object buttonMonitoraDir: TButton
    Left = 16
    Top = 159
    Width = 145
    Height = 58
    Caption = 'MonitoraDir'
    TabOrder = 2
    OnClick = buttonMonitoraDirClick
  end
end
