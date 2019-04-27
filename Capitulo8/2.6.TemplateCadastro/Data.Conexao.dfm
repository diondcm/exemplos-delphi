object dmdConexao: TdmdConexao
  OldCreateOrder = False
  Height = 232
  Width = 299
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo8\2.6.Te' +
        'mplateCadastro\cadastro.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 64
    Top = 80
  end
  object SQLConnection: TSQLConnection
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver250.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver250.bpl'
      'FailIfMissing=True'
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo8\2.6.Te' +
        'mplateCadastro\cadastro.db')
    Left = 200
    Top = 80
  end
end
