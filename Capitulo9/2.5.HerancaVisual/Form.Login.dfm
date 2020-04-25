inherited frmLogin: TfrmLogin
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 214
  ClientWidth = 504
  ParentFont = True
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitWidth = 510
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 80
    Top = 89
    Width = 79
    Height = 13
    Caption = 'Enter password:'
  end
  object Label2: TLabel [1]
    Left = 83
    Top = 25
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  inherited ImageLogoSistema: TImage
    Left = 354
    Top = 25
    ExplicitLeft = 354
    ExplicitTop = 25
  end
  inherited PanelControles: TPanel
    Top = 173
    Width = 504
    TabOrder = 2
    ExplicitTop = 173
    ExplicitWidth = 504
    inherited ButtonOk: TBitBtn
      Left = 345
      OnClick = ButtonOkClick
      ExplicitLeft = 345
    end
    inherited ButtonCancelar: TBitBtn
      Left = 426
      ExplicitLeft = 426
    end
  end
  object EditSenha: TEdit
    Left = 80
    Top = 107
    Width = 217
    Height = 21
    PasswordChar = '$'
    TabOrder = 1
  end
  object EditUsuario: TEdit
    Left = 80
    Top = 44
    Width = 217
    Height = 21
    TabOrder = 0
  end
end
