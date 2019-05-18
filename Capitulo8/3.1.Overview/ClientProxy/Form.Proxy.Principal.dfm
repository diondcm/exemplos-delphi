object frmProxyPrincipal: TfrmProxyPrincipal
  Left = 0
  Top = 0
  Caption = 'Client Proxy'
  ClientHeight = 551
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MemoTexto: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 124
    Width = 789
    Height = 279
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 109
  end
  object ButtonGet: TButton
    Left = 8
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get'
    TabOrder = 1
    OnClick = ButtonGetClick
  end
  object Button1: TButton
    Left = 159
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get Data'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 310
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get Version'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 461
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get Valor'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 612
    Top = 8
    Width = 145
    Height = 41
    Caption = 'Get Obj'
    TabOrder = 5
    OnClick = Button4Click
  end
  object ButtonGeraPessoa: TButton
    Left = 8
    Top = 55
    Width = 145
    Height = 41
    Caption = 'Gera Pessoa'
    TabOrder = 6
    OnClick = ButtonGeraPessoaClick
  end
  object ButtonSetPessoa: TButton
    Left = 159
    Top = 55
    Width = 145
    Height = 41
    Caption = 'Set Pessoa'
    TabOrder = 7
    OnClick = ButtonSetPessoaClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 532
    Width = 795
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 200
      end>
    ExplicitLeft = -8
    ExplicitTop = 401
  end
  object CheckBoxRelogio: TCheckBox
    Left = 612
    Top = 67
    Width = 97
    Height = 17
    Caption = 'Ativa Rel'#243'gio'
    TabOrder = 9
    OnClick = CheckBoxRelogioClick
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 409
    Width = 789
    Height = 120
    Align = alBottom
    DataSource = dtsPessoa
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button5: TButton
    Left = 310
    Top = 55
    Width = 145
    Height = 41
    Caption = 'Lista Pessoa'
    TabOrder = 11
    OnClick = Button5Click
  end
  object TimerData: TTimer
    Enabled = False
    OnTimer = TimerDataTimer
    Left = 704
    Top = 56
  end
  object dtsPessoa: TDataSource
    DataSet = memPessoa
    Left = 296
    Top = 344
  end
  object memPessoa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 384
    Top = 344
  end
end
