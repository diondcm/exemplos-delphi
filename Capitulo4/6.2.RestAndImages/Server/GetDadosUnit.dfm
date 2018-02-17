object GetDados: TGetDados
  OldCreateOrder = False
  Height = 289
  Width = 425
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\fast.db'
      'DriverID=SQLite')
    Left = 192
    Top = 24
  end
  object qryDados: TFDQuery
    Connection = FDConnection
    Left = 192
    Top = 112
  end
end
