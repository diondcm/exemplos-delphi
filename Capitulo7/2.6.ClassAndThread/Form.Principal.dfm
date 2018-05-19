object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Testes'
  ClientHeight = 299
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object buttonClasse: TButton
    Left = 32
    Top = 32
    Width = 169
    Height = 73
    Caption = 'Class Of'
    TabOrder = 0
    OnClick = buttonClasseClick
  end
  object buttonThreads: TButton
    Left = 32
    Top = 111
    Width = 169
    Height = 65
    Caption = 'Threads'
    TabOrder = 1
    OnClick = buttonThreadsClick
  end
  object timerOpen: TTimer
    Enabled = False
    OnTimer = timerOpenTimer
    Left = 312
    Top = 80
  end
end
