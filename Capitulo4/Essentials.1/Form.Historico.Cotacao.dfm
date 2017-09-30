object frmHistoricoCotacao: TfrmHistoricoCotacao
  Left = 0
  Top = 0
  Caption = 'Hist'#243'rico de conta'#231#245'es'
  ClientHeight = 490
  ClientWidth = 1065
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGridCotacao: TStringGrid
    Left = 0
    Top = 65
    Width = 1065
    Height = 425
    Align = alClient
    ColCount = 3
    DefaultColWidth = 100
    TabOrder = 0
    ExplicitTop = 128
    ExplicitHeight = 362
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object pnlControles: TPanel
    Left = 0
    Top = 0
    Width = 1065
    Height = 65
    Align = alTop
    TabOrder = 1
    ExplicitTop = -6
    object labelCotacaoAtual: TLabel
      Left = 752
      Top = 25
      Width = 312
      Height = 17
      Margins.Top = 20
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object checkAtivaTimer: TCheckBox
      Left = 8
      Top = 25
      Width = 113
      Height = 17
      Caption = 'Atualizar Cota'#231#227'o'
      TabOrder = 0
      OnClick = checkAtivaTimerClick
    end
  end
  object TimerAtualizaCotacao: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerAtualizaCotacaoTimer
    Left = 480
    Top = 128
  end
end
