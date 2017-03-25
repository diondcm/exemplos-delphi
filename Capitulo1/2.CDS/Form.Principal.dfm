object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'CDS'
  ClientHeight = 452
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object dbgLivros: TDBGrid
    Left = 0
    Top = 74
    Width = 767
    Height = 378
    Align = alClient
    DataSource = dtsLivros
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISBN'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Titulo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Autor'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Idioma'
        Visible = True
      end>
  end
  object pnlDados: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 49
    Align = alTop
    Caption = 'pnlDados'
    ShowCaption = False
    TabOrder = 1
    object btnSalvar: TButton
      Left = 88
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
    end
    object btnCriarClasse: TButton
      Left = 7
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Criar Classe'
      TabOrder = 1
      OnClick = btnCriarClasseClick
    end
  end
  object dbnLivros: TDBNavigator
    Left = 0
    Top = 49
    Width = 767
    Height = 25
    DataSource = dtsLivros
    Align = alTop
    TabOrder = 2
    ExplicitTop = 81
  end
  object dtsLivros: TDataSource
    DataSet = cdsLivros
    Left = 280
    Top = 176
  end
  object cdsLivros: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    Left = 384
    Top = 176
    object cdsLivrosID: TIntegerField
      FieldName = 'ID'
    end
    object cdsLivrosISBN: TStringField
      FieldName = 'ISBN'
      Size = 50
    end
    object cdsLivrosTitulo: TStringField
      FieldName = 'Titulo'
      Size = 250
    end
    object cdsLivrosAutor: TStringField
      FieldName = 'Autor'
      Size = 100
    end
    object cdsLivrosIdioma: TStringField
      FieldName = 'Idioma'
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'XML|*.xml'
    Left = 456
    Top = 176
  end
end
