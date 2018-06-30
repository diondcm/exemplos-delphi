object fraPessoa: TfraPessoa
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object panelPessoa: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 314
    Height = 234
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 72
    ExplicitTop = 104
    ExplicitWidth = 185
    ExplicitHeight = 41
    object panelControles: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 306
      Height = 53
      Align = alTop
      TabOrder = 0
      object buttonCriar: TButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 75
        Height = 45
        Align = alLeft
        Caption = 'Criar Pessoas'
        TabOrder = 0
        OnClick = buttonCriarClick
        ExplicitTop = 8
      end
      object buttonSalvar: TButton
        AlignWithMargins = True
        Left = 85
        Top = 4
        Width = 75
        Height = 45
        Align = alLeft
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = buttonSalvarClick
        ExplicitLeft = 160
        ExplicitTop = 8
        ExplicitHeight = 25
      end
    end
    object gridPessoas: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 63
      Width = 306
      Height = 167
      Align = alClient
      DataSource = dtsPessoa
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 80
    object cdsPessoaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsPessoaNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
  end
  object dtsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 144
    Top = 104
  end
end
