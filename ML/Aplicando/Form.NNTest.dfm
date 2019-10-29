object frmNNTest: TfrmNNTest
  Left = 0
  Top = 0
  Caption = 'NN Test'
  ClientHeight = 394
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 615
    Height = 394
    ActivePage = TabResultado
    Align = alClient
    TabOrder = 0
    object TabTreinoTest: TTabSheet
      Caption = 'Treino e Teste'
      object PanelControles: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 601
        Height = 41
        Align = alTop
        TabOrder = 0
        object ButtonProcessar: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 75
          Height = 33
          Align = alLeft
          Caption = 'Processar'
          TabOrder = 0
          OnClick = ButtonProcessarClick
        end
        object ButtonGerarDados: TButton
          AlignWithMargins = True
          Left = 472
          Top = 4
          Width = 125
          Height = 33
          Align = alRight
          Caption = 'Gerar Dados'
          TabOrder = 1
          OnClick = ButtonGerarDadosClick
        end
        object ButtonCompras: TButton
          AlignWithMargins = True
          Left = 85
          Top = 4
          Width = 116
          Height = 33
          Align = alLeft
          Caption = 'Processar Compras'
          TabOrder = 2
          OnClick = ButtonComprasClick
        end
      end
      object MemoLog: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 50
        Width = 601
        Height = 313
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object TabTexto: TTabSheet
      Caption = 'Texto'
      object Panel1: TPanel
        Left = 281
        Top = 0
        Width = 326
        Height = 366
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 56
        ExplicitWidth = 185
        ExplicitHeight = 41
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 324
          Height = 13
          Align = alTop
          Caption = 'Sa'#237'da'
          ExplicitWidth = 26
        end
        object MemoSaida: TMemo
          Left = 1
          Top = 14
          Width = 324
          Height = 351
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 128
          ExplicitWidth = 185
          ExplicitHeight = 89
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 281
        Height = 366
        Align = alLeft
        TabOrder = 1
        object Label2: TLabel
          Left = 1
          Top = 1
          Width = 279
          Height = 13
          Align = alTop
          Caption = 'Entrada'
          ExplicitWidth = 38
        end
        object MemoEntrada: TMemo
          Left = 1
          Top = 14
          Width = 279
          Height = 351
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 128
          ExplicitWidth = 185
          ExplicitHeight = 89
        end
      end
    end
    object TabResultado: TTabSheet
      Caption = 'Resultado'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 237
        Width = 607
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 240
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 243
        Width = 601
        Height = 120
        Align = alBottom
        DataSource = dtsSaida
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object DBChart1: TDBChart
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 601
        Height = 231
        Title.Text.Strings = (
          'Regress'#227'o Linear-Polinomial')
        Align = alClient
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          12
          15
          12)
        ColorPaletteIndex = 0
        object Series1: TPointSeries
          DataSource = dmdDados.memDadosSaidaComprasLinear
          Title = 'Entradas'
          ClickableLine = False
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'x'
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'y'
        end
        object Series2: TPointSeries
          DataSource = dmdDados.memDadosSaidaNN
          Title = 'Proje'#231#245'es'
          ClickableLine = False
          Pointer.InflateMargins = True
          Pointer.Style = psDownTriangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'x'
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'y'
        end
        object Series3: TLineSeries
          DataSource = dmdDados.qryCompras
          Title = 'Compras'
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'total'
        end
      end
      object Button1: TButton
        Left = 504
        Top = 320
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 2
        Visible = False
        OnClick = Button1Click
      end
    end
  end
  object dtsSaida: TDataSource
    DataSet = dmdDados.memDadosSaidaNN
    Left = 472
    Top = 304
  end
end
