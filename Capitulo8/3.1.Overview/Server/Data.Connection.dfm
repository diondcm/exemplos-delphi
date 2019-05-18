object dmdConnection: TdmdConnection
  OldCreateOrder = False
  Height = 325
  Width = 357
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=postgres'
      'Port=5433'
      'DriverID=PG')
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
