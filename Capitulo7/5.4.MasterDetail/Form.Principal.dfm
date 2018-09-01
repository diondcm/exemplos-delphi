object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Reports'
  ClientHeight = 529
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object FlowPanelControles: TFlowPanel
    AlignWithMargins = True
    Left = 30
    Top = 30
    Width = 568
    Height = 265
    Margins.Left = 30
    Margins.Top = 30
    Margins.Right = 30
    Margins.Bottom = 30
    Align = alClient
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    ExplicitHeight = 377
    object buttonLoad: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 144
      Height = 73
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Lista de Produtos'
      TabOrder = 0
      OnClick = buttonLoadClick
    end
    object buttonEtiquetasProdutos: TButton
      AlignWithMargins = True
      Left = 159
      Top = 5
      Width = 144
      Height = 73
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Etiquetas Produtos'
      TabOrder = 1
      OnClick = buttonEtiquetasProdutosClick
    end
    object buttonSubReport: TButton
      AlignWithMargins = True
      Left = 313
      Top = 5
      Width = 144
      Height = 73
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Sub-Report'
      TabOrder = 2
      OnClick = buttonSubReportClick
    end
    object buttonCrossTable: TButton
      AlignWithMargins = True
      Left = 5
      Top = 88
      Width = 144
      Height = 73
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cross Table'
      TabOrder = 3
      OnClick = buttonCrossTableClick
    end
    object buttonImagens: TButton
      AlignWithMargins = True
      Left = 159
      Top = 88
      Width = 144
      Height = 73
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Imagens'
      TabOrder = 4
      OnClick = buttonImagensClick
    end
    object buttonMasterDetailDetail: TButton
      AlignWithMargins = True
      Left = 313
      Top = 88
      Width = 144
      Height = 73
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Master Detail Detail'
      TabOrder = 5
      OnClick = buttonMasterDetailDetailClick
    end
    object Button6: TButton
      AlignWithMargins = True
      Left = 5
      Top = 171
      Width = 144
      Height = 73
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Button1'
      TabOrder = 6
    end
    object Button7: TButton
      AlignWithMargins = True
      Left = 159
      Top = 171
      Width = 144
      Height = 73
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Button1'
      TabOrder = 7
    end
    object Button8: TButton
      AlignWithMargins = True
      Left = 313
      Top = 171
      Width = 144
      Height = 73
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Button1'
      TabOrder = 8
    end
  end
  object panelNotas: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 328
    Width = 622
    Height = 198
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = -2
    object StaticText1: TStaticText
      Left = 1
      Top = 1
      Width = 620
      Height = 17
      Align = alTop
      Caption = 
        'https://www.fast-report.com/en/blog/190/show/                   ' +
        '  Gruops no cabe'#231'alho'
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 9
      Top = 39
      Width = 267
      Height = 142
      Color = clScrollBar
      Lines.Strings = (
        'Possibilidade  de converter relat'#243'rios do Rave e do '
        'Report Builder.'
        'Por meio dos uses:'
        'ConverterRR2FR - converte de Rave para Fast'
        'ConverterRB2FR - converte de ReportBuilder para '
        'Fast'
        ''
        'lReport := TfrxReport.Create(Self);'
        'lReport.LoadFromFile(Arquivo Rave ou RB);'
        'lReport.SaveToFile(Rel em FR);'
        '')
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = dmdRelatorios.memImagens
    Left = 568
    Top = 368
  end
end
