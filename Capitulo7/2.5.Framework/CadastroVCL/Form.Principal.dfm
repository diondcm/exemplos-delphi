inherited frmPrincipal: TfrmPrincipal
  Caption = 'Cadastros VCL'
  ClientHeight = 428
  ClientWidth = 740
  ExplicitWidth = 756
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 13
  object buttonCliente: TButton [0]
    Left = 8
    Top = 24
    Width = 169
    Height = 81
    Caption = 'Clientes'
    TabOrder = 0
    OnClick = buttonClienteClick
  end
  object buttonPedidos: TButton [1]
    Left = 8
    Top = 111
    Width = 169
    Height = 74
    Caption = 'Pedidos'
    TabOrder = 1
    OnClick = buttonPedidosClick
  end
end
