object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'OO'
  ClientHeight = 548
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 505
    Top = 0
    Height = 306
    Align = alRight
    ExplicitLeft = 344
    ExplicitTop = 184
    ExplicitHeight = 100
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 306
    Width = 699
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 0
    ExplicitWidth = 309
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 499
    Height = 300
    Align = alClient
    TabOrder = 0
    object GroupBoxLista: TGroupBox
      AlignWithMargins = True
      Left = 151
      Top = 4
      Width = 141
      Height = 292
      Align = alLeft
      Caption = ' Lista '
      TabOrder = 0
      object ButtonPopula: TButton
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 131
        Height = 57
        Align = alTop
        Caption = 'Popula Lista'
        TabOrder = 0
        OnClick = ButtonPopulaClick
      end
      object ButtonPersisteLista: TButton
        AlignWithMargins = True
        Left = 5
        Top = 81
        Width = 131
        Height = 57
        Align = alTop
        Caption = 'Persiste Lista'
        TabOrder = 1
        OnClick = ButtonPersisteListaClick
      end
      object ButtonCarregaDeDisco: TButton
        AlignWithMargins = True
        Left = 5
        Top = 207
        Width = 131
        Height = 57
        Align = alTop
        Caption = 'Carrega de Disco'
        TabOrder = 2
        OnClick = ButtonCarregaDeDiscoClick
      end
      object ButtonSalvaEmDisco: TButton
        AlignWithMargins = True
        Left = 5
        Top = 144
        Width = 131
        Height = 57
        Align = alTop
        Caption = 'Salva em Disco'
        TabOrder = 3
        OnClick = ButtonSalvaEmDiscoClick
      end
    end
    object GroupBoxObj: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 141
      Height = 292
      Align = alLeft
      Caption = ' Obj '
      TabOrder = 1
      object ButtonCriaPessoa: TButton
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 131
        Height = 57
        Align = alTop
        Caption = 'Pessoa'
        TabOrder = 0
        OnClick = ButtonCriaPessoaClick
      end
      object ButtonVisualiza: TButton
        AlignWithMargins = True
        Left = 5
        Top = 81
        Width = 131
        Height = 57
        Align = alTop
        Caption = 'Visualiza Pessoa'
        TabOrder = 1
        OnClick = ButtonVisualizaClick
      end
      object ButtonLibera: TButton
        AlignWithMargins = True
        Left = 5
        Top = 144
        Width = 131
        Height = 57
        Align = alTop
        Caption = 'Libera FPessoa'
        TabOrder = 2
        OnClick = ButtonLiberaClick
      end
    end
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 298
      Top = 4
      Width = 141
      Height = 292
      Align = alLeft
      Caption = ' Lista '
      TabOrder = 2
      object ButtonLimpa: TButton
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 131
        Height = 57
        Align = alTop
        Caption = 'Limpa Dados'
        TabOrder = 0
        OnClick = ButtonLimpaClick
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 5
        Top = 81
        Width = 131
        Height = 57
        Align = alTop
        Caption = 'Gera CSV'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        AlignWithMargins = True
        Left = 5
        Top = 207
        Width = 131
        Height = 57
        Align = alTop
        TabOrder = 2
      end
      object Button4: TButton
        AlignWithMargins = True
        Left = 5
        Top = 144
        Width = 131
        Height = 57
        Align = alTop
        TabOrder = 3
      end
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 511
    Top = 3
    Width = 185
    Height = 300
    Align = alRight
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 358
    Width = 693
    Height = 168
    Align = alBottom
    DataSource = dtsPessoa
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 312
    Width = 693
    Height = 40
    DataSource = dtsPessoa
    Align = alBottom
    TabOrder = 3
  end
  object StatusBarResumo: TStatusBar
    Left = 0
    Top = 529
    Width = 699
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 250
      end
      item
        Width = 250
      end>
  end
  object dtsPessoa: TDataSource
    DataSet = dmdPessoa.memPessoa
    OnDataChange = dtsPessoaDataChange
    Left = 552
    Top = 368
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.csv'
    Filter = 'Arquivo CSV|*.csv'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Exportar CSV'
    Left = 456
    Top = 96
  end
end
