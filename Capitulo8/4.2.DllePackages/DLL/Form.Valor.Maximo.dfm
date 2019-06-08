object frmValoMax: TfrmValoMax
  Left = 0
  Top = 0
  Caption = 'Valida valor M'#225'ximo'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 24
    Top = 104
    Width = 457
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 33
      Height = 33
      Align = alLeft
      Caption = 'Valor 1'
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 119
      Top = 4
      Width = 33
      Height = 33
      Align = alLeft
      Caption = 'Valor 2'
      Layout = tlCenter
      ExplicitHeight = 13
    end
    object EditValor1: TEdit
      AlignWithMargins = True
      Left = 43
      Top = 11
      Width = 70
      Height = 19
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alLeft
      TabOrder = 0
      ExplicitHeight = 21
    end
    object EditValor2: TEdit
      AlignWithMargins = True
      Left = 158
      Top = 11
      Width = 67
      Height = 19
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 21
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 378
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Processar'
      TabOrder = 2
      ExplicitLeft = 420
    end
  end
end
