object dmdConnection: TdmdConnection
  OldCreateOrder = False
  Height = 326
  Width = 407
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\AquaAluno09\Desktop\6.2.Estrutura.Camadas\Clie' +
        'nt\Win32\Debug\fast.db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 184
    Top = 144
  end
  object qryCriaCliente: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS CLIENTE ('
      '    ID_CLIENTE INTEGER      PRIMARY KEY AUTOINCREMENT,'
      '    CODIGO     INTEGER,'
      '    NOME       STRING (100),'
      '    SEXO       CHAR (1),'
      '    DATANASCTO DATE,'
      '    ID_CIDADE  INTEGER'
      ')')
    Left = 328
    Top = 32
  end
end
