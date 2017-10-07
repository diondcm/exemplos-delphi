object dmdPaises: TdmdPaises
  OldCreateOrder = False
  Height = 444
  Width = 724
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo4\Essent' +
        'ials.6\Win32\Debug\paises.db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    Left = 592
    Top = 16
  end
  object qryPaises: TFDQuery
    Connection = FDConnection
    Left = 480
    Top = 104
    object qryPaisesCode: TIntegerField
      FieldName = 'Code'
    end
    object qryPaisesArea: TIntegerField
      FieldName = 'Area'
    end
    object qryPaisesPopulation: TIntegerField
      FieldName = 'Population'
    end
    object qryPaisesName: TWideStringField
      FieldName = 'Name'
      Size = 255
    end
    object qryPaisesContinent: TWideStringField
      FieldName = 'Continent'
      Size = 255
    end
    object qryPaisesCapital: TWideStringField
      FieldName = 'Capital'
      Size = 255
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 488
    Top = 368
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 624
    Top = 368
  end
  object qryDBPaises: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select  ID, CODE, Area, POPULATION, NAME, CONTINENT, CAPITAL'
      'from PAISES'
      'order by CONTINENT, NAME')
    Left = 632
    Top = 104
    object qryDBPaisesID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryDBPaisesCODE: TIntegerField
      FieldName = 'CODE'
      Origin = 'CODE'
    end
    object qryDBPaisesArea: TWideStringField
      FieldName = 'Area'
      Origin = 'Area'
      Size = 200
    end
    object qryDBPaisesPOPULATION: TIntegerField
      FieldName = 'POPULATION'
      Origin = 'POPULATION'
    end
    object qryDBPaisesNAME: TWideStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 200
    end
    object qryDBPaisesCONTINENT: TWideStringField
      FieldName = 'CONTINENT'
      Origin = 'CONTINENT'
      Size = 200
    end
    object qryDBPaisesCAPITAL: TWideStringField
      FieldName = 'CAPITAL'
      Origin = 'CAPITAL'
      Size = 200
    end
  end
end
