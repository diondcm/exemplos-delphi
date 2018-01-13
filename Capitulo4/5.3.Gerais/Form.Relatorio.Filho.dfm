inherited frmListaProdutos: TfrmListaProdutos
  Caption = 'Lista de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited frxReport: TfrxReport
    ReportOptions.CreateDate = 43113.617952129600000000
    ReportOptions.LastChange = 43113.617952129600000000
    OnBeforePrint = frxReportBeforePrint
    Left = 288
    Datasets = <
      item
        DataSet = dmdProdutos.frxDBProdutos
        DataSetName = 'Produtos'
      end>
    Variables = <
      item
        Name = ' Gerais'
        Value = Null
      end
      item
        Name = 'id_rel'
        Value = ''
      end
      item
        Name = 'filtro'
        Value = ''
      end>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited ReportTitle1: TfrxReportTitle
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        inherited Memo1: TfrxMemoView
          Top = 75.590600000000000000
          Width = 230.551330000000000000
          Memo.UTF8W = (
            'Lista de Produtos')
        end
        inherited Memo2: TfrxMemoView
          Top = 158.740260000000000000
          Memo.UTF8W = (
            'ID do relat'#243'rio: ')
        end
        inherited Line1: TfrxLineView
          Top = 181.417440000000000000
          Width = 718.110700000000000000
        end
        inherited memRigths: TfrxMemoView
          Top = 0.779530000000001200
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 158.740260000000000000
          Width = 544.252320000000000000
          Height = 18.897650000000000000
        end
        object memLicenca: TfrxMemoView
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        inherited Memo3: TfrxMemoView
          Top = 18.897650000000000000
        end
        inherited Memo4: TfrxMemoView
          Top = 18.897650000000000000
        end
        inherited Line2: TfrxLineView
          Top = 3.779530000000022000
          Width = 718.110700000000000000
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 107.559060000000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        DataSet = dmdProdutos.frxDBProdutos
        DataSetName = 'Produtos'
        RowCount = 0
        object ProdutosCODIGO: TfrxMemoView
          Left = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO'
          Memo.UTF8W = (
            '[Produtos."CODIGO"]')
        end
        object ProdutosNOME: TfrxMemoView
          Left = 102.047310000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Memo.UTF8W = (
            '<font color=blue><b>[Produtos."NOME"]</b></font>')
        end
        object ProdutosVALOR: TfrxMemoView
          Left = 461.102660000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          Memo.UTF8W = (
            '[Produtos."VALOR"]')
        end
        object BarCode1: TfrxBarCodeView
          Left = 15.118120000000000000
          Top = 45.354359999999990000
          Width = 79.000000000000000000
          Height = 41.574830000000000000
          BarType = bcCode128
          Expression = '<Produtos."NOME">'
          Rotation = 0
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Barcode2D1: TfrxBarcode2DView
          Left = 563.149970000000100000
          Top = 3.779530000000022000
          Width = 84.000000000000000000
          Height = 100.000000000000000000
          StretchMode = smActualHeight
          BarType = bcCodeQR
          BarProperties.Encoding = qrAuto
          BarProperties.QuietZone = 0
          BarProperties.ErrorLevels = ecL
          BarProperties.PixelSize = 4
          BarProperties.CodePage = 0
          DataField = 'NOME'
          DataSet = dmdProdutos.frxDBProdutos
          DataSetName = 'Produtos'
          Rotation = 0
          ShowText = True
          Text = '12345678'
          Zoom = 1.000000000000000000
          FontScaled = True
          QuietZone = 0
        end
      end
    end
  end
end
