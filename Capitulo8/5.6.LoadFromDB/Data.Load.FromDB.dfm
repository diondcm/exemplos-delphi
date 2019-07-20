object dmdLoadFromDB: TdmdLoadFromDB
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 385
  Width = 477
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\Aqua\exemplos-delphi\SQLite\fast_novo.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 176
    Top = 56
  end
  object qryEmployee: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT EMP_NO,'
      '       FIRST_NAME,'
      '       LAST_NAME,'
      '       PHONE_EXT,'
      '       HIRE_DATE,'
      '       DEPT_NO,'
      '       JOB_CODE,'
      '       JOB_GRADE,'
      '       JOB_COUNTRY,'
      '       SALARY,'
      '       FULL_NAME'
      '  FROM EMPLOYEE;')
    Left = 48
    Top = 128
  end
  object frxDBEmployee: TfrxDBDataset
    UserName = 'Employee'
    CloseDataSource = False
    DataSet = qryEmployee
    BCDToCurrency = False
    Left = 48
    Top = 176
  end
  object frxReportFromDB: TfrxReport
    Version = '6.4.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43666.712659189810000000
    ReportOptions.LastChange = 43666.712659189810000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 168
    Top = 256
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
    end
  end
  object qryRelatorios: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from relatorios')
    Left = 232
    Top = 136
  end
end
