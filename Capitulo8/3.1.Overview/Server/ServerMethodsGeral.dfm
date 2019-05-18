object SMGeral: TSMGeral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 341
  Width = 495
  object qryPessoa: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from pessoa')
    Left = 136
    Top = 160
    object qryPessoaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object qryPessoanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 200
    end
    object qryPessoadata_nascimento: TSQLTimeStampField
      FieldName = 'data_nascimento'
      Origin = 'data_nascimento'
    end
    object qryPessoacredito: TFloatField
      FieldName = 'credito'
      Origin = 'credito'
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=postgres'
      'Port=5433'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 136
    Top = 40
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\Instrutor01\Downloads\pgsql\bin\libpq.dll'
    Left = 136
    Top = 96
  end
end
