object dmdCotacao: TdmdCotacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 290
  Width = 459
  object TimerAtualizaCotacao: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TimerAtualizaCotacaoTimer
    Left = 56
    Top = 32
  end
end
