object frmParametros: TfrmParametros
  Left = 0
  Top = 0
  Caption = 'Infome os par'#226'metros'
  ClientHeight = 457
  ClientWidth = 522
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
  object PanelParametros: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 516
    Height = 240
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitTop = 8
    ExplicitHeight = 308
  end
  object Panel2: TPanel
    Left = 0
    Top = 246
    Width = 522
    Height = 143
    Align = alBottom
    TabOrder = 1
    Visible = False
    ExplicitLeft = 3
    ExplicitTop = 306
    object PanelBaseData: TPanel
      Left = 24
      Top = 3
      Width = 495
      Height = 41
      TabOrder = 0
      object LabelAh: TLabel
        Left = 300
        Top = 13
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object CheckBoxBaseData: TCheckBox
        AlignWithMargins = True
        Left = 21
        Top = 4
        Width = 97
        Height = 33
        Margins.Left = 20
        Align = alLeft
        Caption = 'Selecionar Data'
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 39
      end
      object dtpDataIni: TDateTimePicker
        AlignWithMargins = True
        Left = 124
        Top = 7
        Width = 80
        Height = 27
        Margins.Top = 6
        Margins.Bottom = 6
        Align = alLeft
        Date = 43659.000000000000000000
        Time = 0.713334780091827300
        TabOrder = 1
      end
      object dtpDataFim: TDateTimePicker
        Left = 312
        Top = 8
        Width = 121
        Height = 21
        Date = 43659.000000000000000000
        Time = 0.713334780091827300
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 392
    Width = 516
    Height = 62
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -2
    ExplicitTop = 395
    object BitBtn1: TBitBtn
      AlignWithMargins = True
      Left = 288
      Top = 4
      Width = 111
      Height = 54
      Align = alRight
      Cancel = True
      Caption = '&No'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      ModalResult = 7
      NumGlyphs = 2
      TabOrder = 0
      ExplicitTop = 3
    end
    object BitBtn2: TBitBtn
      AlignWithMargins = True
      Left = 405
      Top = 4
      Width = 107
      Height = 54
      Align = alRight
      Caption = 'OK'
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
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 1
      ExplicitLeft = 408
      ExplicitTop = 1
      ExplicitHeight = 60
    end
  end
end
