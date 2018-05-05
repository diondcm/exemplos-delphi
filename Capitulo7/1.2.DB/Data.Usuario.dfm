object dmdUsuario: TdmdUsuario
  OldCreateOrder = False
  Height = 394
  Width = 650
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo7\1.2.DB' +
        '\Win32\Debug\dados.db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    BeforeConnect = FDConnectionBeforeConnect
    Left = 224
    Top = 32
  end
  object qryUsuario: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from usuario')
    Left = 104
    Top = 144
    object qryUsuarioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryUsuarioNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 32767
    end
    object qryUsuarioDATACADATRO: TDateTimeField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATACADATRO'
      Origin = 'DATACADATRO'
    end
  end
end
