object frmMensagens: TfrmMensagens
  Left = 0
  Top = 0
  Caption = 'Mensagens'
  ClientHeight = 401
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 354
    Top = 0
    Height = 401
    Align = alRight
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitHeight = 100
  end
  object listBoxJanelas: TListBox
    AlignWithMargins = True
    Left = 360
    Top = 10
    Width = 265
    Height = 381
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alRight
    ItemHeight = 13
    TabOrder = 0
  end
  object panelControles: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 341
    Height = 381
    Margins.Left = 10
    Margins.Top = 10
    Margins.Bottom = 10
    Align = alClient
    TabOrder = 1
    object buttonAlteraTexto: TButton
      Left = 9
      Top = 36
      Width = 97
      Height = 25
      Caption = 'Altera Texto'
      TabOrder = 0
      OnClick = buttonAlteraTextoClick
    end
    object checkAtivarCaptura: TCheckBox
      Left = 9
      Top = 13
      Width = 97
      Height = 17
      Caption = 'Ativar Captura'
      TabOrder = 1
      OnClick = checkAtivarCapturaClick
    end
    object buttonGetHandle: TButton
      Left = 9
      Top = 337
      Width = 75
      Height = 25
      Caption = 'Get Handle'
      TabOrder = 2
      OnClick = buttonGetHandleClick
    end
    object editText: TEdit
      Left = 112
      Top = 38
      Width = 121
      Height = 21
      TabOrder = 3
      TextHint = 'Informe o novo texto'
    end
    object buttonClose: TButton
      Left = 9
      Top = 129
      Width = 120
      Height = 25
      Caption = 'Fecha Janela - Send'
      TabOrder = 4
      OnClick = buttonCloseClick
    end
    object buttonMoveJanela: TButton
      Left = 9
      Top = 67
      Width = 97
      Height = 25
      Caption = 'Move'
      TabOrder = 5
      OnClick = buttonMoveJanelaClick
    end
    object buttonTravaJanela: TButton
      Left = 90
      Top = 337
      Width = 95
      Height = 25
      Caption = 'Trava Janela'
      TabOrder = 6
      OnClick = buttonTravaJanelaClick
    end
    object buttonFechaJanelaPost: TButton
      Left = 135
      Top = 128
      Width = 130
      Height = 25
      Caption = 'Fecha Janela - Post'
      TabOrder = 7
      OnClick = buttonFechaJanelaPostClick
    end
    object Button1: TButton
      Left = 191
      Top = 337
      Width = 75
      Height = 25
      Caption = 'Register MSG'
      TabOrder = 8
      OnClick = Button1Click
    end
    object buttonEnviaAviso: TButton
      Left = 9
      Top = 160
      Width = 120
      Height = 25
      Caption = 'Envia Aviso'
      TabOrder = 9
      OnClick = buttonEnviaAvisoClick
    end
    object buttonEnviaAvisoPost: TButton
      Left = 135
      Top = 160
      Width = 130
      Height = 25
      Caption = 'Envia Aviso - Post'
      TabOrder = 10
      OnClick = buttonEnviaAvisoPostClick
    end
    object buttonMaximizar: TButton
      Left = 9
      Top = 191
      Width = 120
      Height = 25
      Caption = 'Maximizar - Send'
      TabOrder = 11
      OnClick = buttonMaximizarClick
    end
    object buttonPerform: TButton
      Left = 9
      Top = 296
      Width = 256
      Height = 25
      Caption = 'Perform - Envio Interno'
      TabOrder = 12
      OnClick = buttonPerformClick
    end
  end
  object timerCaptura: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = timerCapturaTimer
    Left = 216
    Top = 8
  end
end
