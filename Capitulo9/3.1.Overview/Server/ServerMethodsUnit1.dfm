object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 344
  Width = 215
  object qryDados: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from cliente limit :QTD')
    Left = 80
    Top = 104
    ParamData = <
      item
        Name = 'QTD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Desenv\Aqua\exemplos-delphi\Capitulo9\2.6.TemplateCa' +
        'dastro\Dados\Cadastro.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 80
    Top = 8
  end
end
