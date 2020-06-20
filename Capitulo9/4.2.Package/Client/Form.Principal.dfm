object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Package'
  ClientHeight = 383
  ClientWidth = 597
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
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 6
    Top = 6
    Width = 585
    Height = 107
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alTop
    TabOrder = 0
    object ButtonHash: TButton
      Left = 9
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Gera hash'
      TabOrder = 0
      OnClick = ButtonHashClick
    end
    object ButtonDll: TButton
      Left = 96
      Top = 17
      Width = 75
      Height = 25
      Caption = 'DLL'
      TabOrder = 1
      OnClick = ButtonDllClick
    end
    object ButtonDinâmico: TButton
      Left = 177
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Dynamic'
      TabOrder = 2
      OnClick = ButtonDinâmicoClick
    end
    object ButtonDLLVar: TButton
      Left = 480
      Top = 11
      Width = 99
      Height = 25
      Caption = 'DLL Var'
      TabOrder = 3
      OnClick = ButtonDLLVarClick
    end
    object ButtonVisualiza: TButton
      Left = 480
      Top = 42
      Width = 99
      Height = 25
      Caption = 'Visuliza Hash'
      TabOrder = 4
      OnClick = ButtonVisualizaClick
    end
    object ButtonBPLForm: TButton
      Left = 480
      Top = 73
      Width = 99
      Height = 25
      Caption = 'Visualiza BPL'
      TabOrder = 5
      OnClick = ButtonBPLFormClick
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 406
    Top = 125
    Width = 185
    Height = 252
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alRight
    TabOrder = 1
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 6
    Top = 125
    Width = 388
    Height = 252
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    TabOrder = 2
    object MemoResult: TMemo
      Left = 1
      Top = 1
      Width = 386
      Height = 250
      Align = alClient
      TabOrder = 0
    end
  end
  object OpenDialog: TOpenDialog
    Left = 288
    Top = 200
  end
end
