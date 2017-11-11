object frmMaps: TfrmMaps
  Left = 0
  Top = 0
  Caption = 'Consulta Mapa'
  ClientHeight = 534
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelControles: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -6
    ExplicitWidth = 900
    object labelEndereco: TLabel
      Left = 8
      Top = 56
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object labelLatitude: TLabel
      Left = 8
      Top = 119
      Width = 39
      Height = 13
      Caption = 'Latitude'
    end
    object labelLongitude: TLabel
      Left = 111
      Top = 119
      Width = 47
      Height = 13
      Caption = 'Longitude'
    end
    object editURL: TEdit
      Left = 8
      Top = 14
      Width = 546
      Height = 21
      TabOrder = 0
      TextHint = 'Digite a URL'
      OnKeyDown = editURLKeyDown
    end
    object memEndereco: TMemo
      Left = 8
      Top = 75
      Width = 546
      Height = 38
      TabOrder = 1
    end
    object editLatitude: TEdit
      Left = 8
      Top = 138
      Width = 97
      Height = 21
      TabOrder = 2
      Text = '25.767314'
    end
    object editLongitude: TEdit
      Left = 111
      Top = 138
      Width = 97
      Height = 21
      TabOrder = 3
      Text = '-80.135694'
    end
    object buttonGoToLatLong: TButton
      Left = 214
      Top = 138
      Width = 36
      Height = 21
      Caption = '>>'
      TabOrder = 4
      OnClick = buttonGoToLatLongClick
    end
    object checkTraffic: TCheckBox
      Left = 288
      Top = 140
      Width = 57
      Height = 17
      Caption = 'Traffic'
      TabOrder = 5
      OnClick = checkTrafficClick
    end
    object checkBicycling: TCheckBox
      Left = 360
      Top = 140
      Width = 66
      Height = 17
      Caption = 'Bicycling'
      TabOrder = 6
      OnClick = checkBicyclingClick
    end
    object checkStreatView: TCheckBox
      Left = 448
      Top = 140
      Width = 81
      Height = 17
      Caption = 'Streat View'
      TabOrder = 7
      OnClick = checkStreatViewClick
    end
    object buttonGoTo: TBitBtn
      Left = 560
      Top = 75
      Width = 89
      Height = 38
      Caption = 'Go To Address'
      TabOrder = 8
      OnClick = buttonGoToClick
    end
    object buttonClear: TBitBtn
      Left = 560
      Top = 138
      Width = 89
      Height = 21
      Caption = 'Clear'
      TabOrder = 9
      OnClick = buttonClearClick
    end
  end
  object WebBrowser: TWebBrowser
    Left = 0
    Top = 169
    Width = 671
    Height = 365
    Align = alClient
    TabOrder = 1
    ExplicitTop = 127
    ExplicitWidth = 900
    ExplicitHeight = 413
    ControlData = {
      4C0000005A450000B92500000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
