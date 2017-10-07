object dmdPessoa: TdmdPessoa
  OldCreateOrder = False
  Height = 424
  Width = 781
  object SQLConnection: TSQLConnection
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver240.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver240.bpl'
      'FailIfMissing=True'
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo4\Essent' +
        'ials.4\Banco.db')
    Connected = True
    Left = 400
    Top = 48
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo4\Essent' +
        'ials.4\Banco.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 720
    Top = 16
  end
  object sqlPessoa: TSQLDataSet
    CommandText = 
      'select ID, codigo, nome, data_nascimento, data_cadastro '#13#10'from p' +
      'essoa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 344
    Top = 136
  end
  object dspPessoa: TDataSetProvider
    DataSet = sqlPessoa
    Left = 344
    Top = 192
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoa'
    AfterPost = cdsPessoaAfterPost
    AfterCancel = cdsPessoaAfterCancel
    AfterDelete = cdsPessoaAfterDelete
    Left = 56
    Top = 328
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select ID, codigo, nome, data_nascimento, data_cadastro '
      'from pessoa')
    Left = 712
    Top = 80
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 688
    Top = 160
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 680
    Top = 224
    object ClientDataSet1TesteFiedl: TIntegerField
      FieldName = 'TesteFiedl'
    end
  end
end
