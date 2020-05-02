inherited frmCadPedido: TfrmCadPedido
  Caption = 'Cadastro de Pedidos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlCadastro: TPageControl
    ActivePage = TabCadastro
    inherited TabCadastro: TTabSheet
      ExplicitLeft = -148
      ExplicitTop = 32
      ExplicitWidth = 733
      ExplicitHeight = 262
      object Label1: TLabel
        Left = 3
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 3
        Top = 88
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 3
        Top = 128
        Width = 63
        Height = 13
        Caption = 'Data Compra'
      end
      object Label5: TLabel
        Left = 3
        Top = 168
        Width = 24
        Height = 13
        Caption = 'Total'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 3
        Top = 45
        Width = 33
        Height = 13
        Caption = 'Cliente'
        FocusControl = DBEdit6
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 24
        Width = 95
        Height = 21
        DataField = 'IDPEDIDO'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 61
        Width = 63
        Height = 21
        DataField = 'IDCLIENTE'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 104
        Width = 300
        Height = 21
        DataField = 'ENDERECO'
        DataSource = dtsDados
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 3
        Top = 184
        Width = 147
        Height = 21
        DataField = 'VLR_TOTAL'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 72
        Top = 61
        Width = 231
        Height = 21
        DataField = 'CLIENTE'
        DataSource = dtsDados
        ReadOnly = True
        TabOrder = 2
      end
      object DateTimePicker1: TDateTimePicker
        Left = 3
        Top = 144
        Width = 95
        Height = 21
        Date = 43953.000000000000000000
        Time = 0.495241226853977400
        TabOrder = 4
      end
      object buttonPesquisa: TBitBtn
        Left = 309
        Top = 59
        Width = 28
        Height = 25
        Caption = 'Peq.'
        TabOrder = 6
        OnClick = buttonPesquisaClick
      end
    end
  end
  inherited dtsDados: TDataSource
    Left = 400
    Top = 104
  end
  inherited ActionList: TActionList
    Left = 472
    Top = 96
  end
  inherited TimerOpen: TTimer
    Left = 552
    Top = 96
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = dmdPedido.qryDados
    ScopeMappings = <>
    Left = 104
    Top = 24
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'DATA_COMPRA'
      Control = DateTimePicker1
      Track = True
    end
  end
end
