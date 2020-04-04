object dmdConnection: TdmdConnection
  OldCreateOrder = False
  Height = 441
  Width = 626
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\exemplos-delphi\Capitulo9\1.2.DB\Win32\D' +
        'ebug\dados.db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    Left = 320
    Top = 192
  end
end
