inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  OnCreate = FormCreate
  ExplicitWidth = 707
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = TabCadastro
    inherited TabPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 677
      ExplicitHeight = 329
    end
    inherited TabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 677
      ExplicitHeight = 329
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 70
        Height = 13
        Caption = 'Data Cadastro'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 88
        Width = 19
        Height = 13
        Caption = 'CPF'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 16
        Top = 128
        Width = 14
        Height = 13
        Caption = 'RG'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 16
        Top = 168
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 394
        Height = 21
        DataField = 'NOME'
        DataSource = dtsDados
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 64
        Width = 238
        Height = 21
        DataField = 'DATA_CADASTRO'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 104
        Width = 147
        Height = 21
        DataField = 'CPF'
        DataSource = dtsDados
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 144
        Width = 147
        Height = 21
        DataField = 'RG'
        DataSource = dtsDados
        TabOrder = 3
      end
      object DateTimePicker1: TDateTimePicker
        Left = 16
        Top = 187
        Width = 147
        Height = 21
        TabOrder = 4
      end
    end
  end
  inherited dtsDados: TDataSource
    DataSet = dmdCliente.qryDados
  end
  object BindSourceDB2: TBindSourceDB
    DataSet = dmdCliente.qryDados
    ScopeMappings = <>
    Left = 336
    Top = 208
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB2
      FieldName = 'DATA_NASCIMENTO'
      Control = DateTimePicker1
      Track = True
    end
  end
end
