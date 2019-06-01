object PessoaResource: TPessoaResource
  OldCreateOrder = False
  Height = 318
  Width = 362
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=postgres'
      'Port=5433'
      'DriverID=PG')
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object qryPessoa: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from pessoa')
    Left = 72
    Top = 96
  end
  object FDBatchMove1: TFDBatchMove
    Reader = FDBatchMoveDataSetReader1
    Writer = FDBatchMoveJSONWriter1
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 176
    Top = 184
  end
  object FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader
    DataSet = qryPessoa
    Left = 80
    Top = 248
  end
  object FDBatchMoveJSONWriter1: TFDBatchMoveJSONWriter
    DataDef.Fields = <>
    Left = 248
    Top = 248
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\Instrutor01\Downloads\pgsql\bin\libpq.dll'
    Left = 208
    Top = 96
  end
end
