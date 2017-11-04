object dmdConexao: TdmdConexao
  OldCreateOrder = False
  Height = 299
  Width = 374
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Aluno\Desktop\exemplos-delphi\Capitulo4\Win32.' +
        '6\FB.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    UpdateOptions.AssignedValues = [uvLockWait]
    UpdateOptions.LockWait = True
    LoginPrompt = False
    Left = 167
    Top = 126
  end
end
