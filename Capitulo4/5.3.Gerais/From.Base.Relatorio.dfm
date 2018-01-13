object frmBaseRelatorio: TfrmBaseRelatorio
  Left = 0
  Top = 0
  Caption = 'Form Base'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxReport: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43113.617952129630000000
    ReportOptions.LastChange = 43113.617952129630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 272
    Top = 112
    Datasets = <>
    Variables = <
      item
        Name = ' Gerais'
        Value = Null
      end
      item
        Name = 'id_rel'
        Value = ''
      end>
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 185.196970000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 245.669450000000000000
          Top = 75.590600000000000000
          Width = 170.078850000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Base')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 559.370440000000000000
          Top = 158.740260000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'ID do relat'#243'rio: [id_rel]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 181.417440000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object memRigths: TfrxMemoView
          Left = 389.291590000000000000
          Top = 0.779530000000001200
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Turma de Fast - Todos os direitos Reservados')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Impresso em [<Date>] [<Time>]')
        end
        object Memo4: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
        end
        object Line2: TfrxLineView
          Align = baWidth
          Top = 3.779530000000022000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
end
