object frmQRCode: TfrmQRCode
  Left = 0
  Top = 0
  Caption = 'Gerar QRCode'
  ClientHeight = 527
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object imageQRCode: TImage
    Left = 0
    Top = 0
    Width = 441
    Height = 527
    Align = alLeft
    Center = True
  end
  object panelControles: TPanel
    Left = 441
    Top = 0
    Width = 312
    Height = 527
    Align = alClient
    TabOrder = 0
    object labelDados: TLabel
      Left = 1
      Top = 73
      Width = 310
      Height = 17
      Align = alTop
      Caption = 'Dados para gera'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 137
    end
    object labelPercentualCorrecao: TLabel
      Left = 1
      Top = 280
      Width = 310
      Height = 13
      Align = alTop
      Caption = 'Percentual de corre'#231#227'o de erro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 240
      ExplicitWidth = 175
    end
    object memoDados: TMemo
      Left = 1
      Top = 90
      Width = 310
      Height = 133
      Margins.Bottom = 10
      Align = alTop
      ScrollBars = ssBoth
      TabOrder = 0
      ExplicitTop = 154
    end
    object panelTamanhoQR: TPanel
      Left = 1
      Top = 223
      Width = 310
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 183
      object labelTamanhoImagem: TLabel
        Left = 0
        Top = 0
        Width = 310
        Height = 13
        Align = alTop
        Caption = 'Tamanho Imagem (px)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 131
      end
      object Label1: TLabel
        Left = 119
        Top = 25
        Width = 7
        Height = 13
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editWidth: TEdit
        Left = 5
        Top = 23
        Width = 108
        Height = 21
        TabOrder = 0
        TextHint = 'Width'
      end
      object editHeight: TEdit
        Left = 132
        Top = 23
        Width = 108
        Height = 21
        TabOrder = 1
        TextHint = 'Heigth'
      end
    end
    object comboPercentualCorrecao: TComboBox
      Left = 1
      Top = 293
      Width = 310
      Height = 21
      Align = alTop
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'L  - [Default] Allows recovery of up to 7% data loss'
      Items.Strings = (
        'L  - [Default] Allows recovery of up to 7% data loss'
        'M - Allows recovery of up to 15% data loss'
        'Q - Allows recovery of up to 25% data loss'
        'H - Allows recovery of up to 30% data loss')
      ExplicitTop = 253
    end
    object buttonGerarQRCode: TBitBtn
      Left = 40
      Top = 424
      Width = 233
      Height = 89
      Caption = 'Gerar QR Code'
      TabOrder = 3
      OnClick = buttonGerarQRCodeClick
    end
    object panelEncode: TPanel
      Left = 1
      Top = 41
      Width = 310
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object checkBase64: TCheckBox
        Left = 16
        Top = 6
        Width = 81
        Height = 17
        Caption = 'Base64'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object checkSHA1: TCheckBox
        Left = 144
        Top = 6
        Width = 81
        Height = 17
        Caption = 'SHA-1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object panelInfos: TPanel
      Left = 1
      Top = 1
      Width = 310
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      object buttonGerarInfos: TButton
        Left = 16
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Gerar Infos'
        TabOrder = 0
        OnClick = buttonGerarInfosClick
      end
    end
  end
end
