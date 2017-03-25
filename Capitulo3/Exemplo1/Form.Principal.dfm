object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Importador de dados'
  ClientHeight = 542
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 8
    Height = 13
    Caption = 'id'
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 24
    Height = 13
    Caption = 'titulo'
  end
  object Label3: TLabel
    Left = 24
    Top = 104
    Width = 83
    Height = 13
    Caption = 'data_lancamento'
  end
  object Label4: TLabel
    Left = 24
    Top = 144
    Width = 56
    Height = 13
    Caption = 'valor_custo'
  end
  object dbgDados: TDBGrid
    Left = 0
    Top = 277
    Width = 610
    Height = 265
    Align = alBottom
    DataSource = dtsDados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'titulo'
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_lancamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_custo'
        Visible = True
      end>
  end
  object dbnDados: TDBNavigator
    Left = 0
    Top = 237
    Width = 610
    Height = 40
    DataSource = dtsDados
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 96
  end
  object btnAtualizaInfos: TButton
    Left = 400
    Top = 38
    Width = 129
    Height = 25
    Caption = 'Atualiza Informa'#231#245'es'
    TabOrder = 2
    OnClick = btnAtualizaInfosClick
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 43
    Width = 121
    Height = 21
    DataField = 'id'
    DataSource = dtsDados
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 83
    Width = 121
    Height = 21
    DataField = 'titulo'
    DataSource = dtsDados
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 24
    Top = 123
    Width = 121
    Height = 21
    DataField = 'data_lancamento'
    DataSource = dtsDados
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 24
    Top = 163
    Width = 121
    Height = 21
    DataField = 'valor_custo'
    DataSource = dtsDados
    TabOrder = 6
  end
  object dtsDados: TDataSource
    DataSet = cdsDados
    Left = 160
    Top = 40
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 32
    object cdsDadosid: TIntegerField
      FieldName = 'id'
    end
    object cdsDadostitulo: TStringField
      FieldName = 'titulo'
      Size = 100
    end
    object cdsDadosdata_lancamento: TDateField
      FieldName = 'data_lancamento'
    end
    object cdsDadosvalor_custo: TCurrencyField
      FieldName = 'valor_custo'
    end
  end
end
