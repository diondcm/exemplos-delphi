object dmdConexao: TdmdConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 230
  Width = 310
  object SQLConnection: TSQLConnection
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver260.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver260.bpl'
      'FailIfMissing=True'
      
        'Database=C:\Desenv\Aqua\exemplos-delphi\Capitulo9\2.6.TemplateCa' +
        'dastro\Dados\Cadastro.db')
    Left = 192
    Top = 72
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\exemplos-delphi\Capitulo9\2.6.TemplateCa' +
        'dastro\Dados\Cadastro.db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 72
    Top = 72
  end
end
