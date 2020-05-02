object frmCadItem: TfrmCadItem
  Left = 0
  Top = 0
  Caption = 'Item do Pedido'
  ClientHeight = 144
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 13
    Caption = 'C'#243'd Produto'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 312
    Top = 8
    Width = 18
    Height = 13
    Caption = 'Qtd'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 413
    Top = 8
    Width = 24
    Height = 13
    Caption = 'Valor'
    FocusControl = DBEdit3
  end
  object LabelEstoque: TLabel
    Left = 74
    Top = 64
    Width = 64
    Height = 13
    Caption = 'LabelEstoque'
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 27
    Width = 60
    Height = 21
    DataField = 'IDPRODUTO'
    DataSource = dtsItem
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 312
    Top = 27
    Width = 95
    Height = 21
    DataField = 'QTD'
    DataSource = dtsItem
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 413
    Top = 27
    Width = 95
    Height = 21
    DataField = 'VALOR'
    DataSource = dtsItem
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 74
    Top = 27
    Width = 191
    Height = 21
    DataField = 'IDPRODUTO'
    DataSource = dtsItem
    KeyField = 'IDPRODUTO'
    ListField = 'DESCRICAO'
    ListSource = dtsProduto
    TabOrder = 3
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 96
    Width = 509
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitWidth = 535
    object ButtonSalvar: TBitBtn
      AlignWithMargins = True
      Left = 300
      Top = 3
      Width = 100
      Height = 39
      Align = alRight
      Caption = '&Salvar'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 6
      NumGlyphs = 2
      TabOrder = 0
      OnClick = ButtonSalvarClick
      ExplicitLeft = 350
      ExplicitTop = 4
      ExplicitHeight = 45
    end
    object ButtonCancelar: TBitBtn
      AlignWithMargins = True
      Left = 406
      Top = 3
      Width = 100
      Height = 39
      Align = alRight
      Cancel = True
      Caption = 'Cancelar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
      OnClick = ButtonCancelarClick
      ExplicitLeft = 440
      ExplicitTop = 4
      ExplicitHeight = 45
    end
  end
  object buttonPesquisa: TBitBtn
    Left = 271
    Top = 25
    Width = 28
    Height = 25
    Caption = 'Peq.'
    TabOrder = 5
    OnClick = buttonPesquisaClick
  end
  object dtsItem: TDataSource
    OnDataChange = dtsItemDataChange
    Left = 80
    Top = 64
  end
  object dtsProduto: TDataSource
    Left = 168
    Top = 72
  end
end
