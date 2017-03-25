object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 224
  Width = 332
  object tmrValorAtual: TTimer
    Interval = 5000
    OnTimer = tmrValorAtualTimer
    Left = 152
    Top = 72
  end
end
