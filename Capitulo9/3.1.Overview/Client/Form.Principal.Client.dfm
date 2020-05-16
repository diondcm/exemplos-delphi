object frmPrincipalClient: TfrmPrincipalClient
  Left = 0
  Top = 0
  Caption = 'Client DataSnap'
  ClientHeight = 464
  ClientWidth = 619
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
  object PageControlClient: TPageControl
    Left = 0
    Top = 0
    Width = 619
    Height = 464
    ActivePage = TabDB
    Align = alClient
    TabOrder = 0
    object TabJSON: TTabSheet
      Caption = 'JSON'
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 605
        Height = 70
        Align = alTop
        TabOrder = 0
        object Button1: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 97
          Height = 62
          Align = alLeft
          Caption = 'Serealizar'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 504
          Top = 4
          Width = 97
          Height = 62
          Align = alRight
          Caption = 'DesSerealizar'
          TabOrder = 1
          OnClick = Button2Click
        end
      end
      object MemoJson: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 79
        Width = 605
        Height = 354
        Align = alClient
        TabOrder = 1
      end
    end
    object TabDataSnap: TTabSheet
      Caption = 'DataSnap'
      ImageIndex = 1
      object Button3: TButton
        Left = 24
        Top = 24
        Width = 153
        Height = 57
        Caption = 'Envia Pessoa'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 400
        Top = 24
        Width = 153
        Height = 57
        Caption = 'Recebe Pessoa'
        TabOrder = 1
        OnClick = Button4Click
      end
      object MemoPessoaEnvio: TMemo
        Left = 24
        Top = 104
        Width = 169
        Height = 265
        TabOrder = 2
      end
      object MemoPessoaRetorno: TMemo
        Left = 384
        Top = 104
        Width = 169
        Height = 265
        TabOrder = 3
      end
    end
    object TabThreads: TTabSheet
      Caption = 'Threads'
      ImageIndex = 2
      object PanelThreads: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 605
        Height = 41
        Align = alTop
        TabOrder = 0
        object ButtonGetID: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 75
          Height = 33
          Align = alLeft
          Caption = 'Get ID'
          TabOrder = 0
          OnClick = ButtonGetIDClick
        end
        object ButtonCallRequestThread: TButton
          AlignWithMargins = True
          Left = 504
          Top = 4
          Width = 97
          Height = 33
          Align = alRight
          Caption = 'Call Request'
          TabOrder = 1
          OnClick = ButtonCallRequestThreadClick
        end
        object EditQtd: TEdit
          AlignWithMargins = True
          Left = 416
          Top = 4
          Width = 82
          Height = 33
          Align = alRight
          TabOrder = 2
          TextHint = 'Qtd Requests'
          ExplicitTop = 8
        end
        object Button5: TButton
          AlignWithMargins = True
          Left = 166
          Top = 4
          Width = 75
          Height = 33
          Align = alLeft
          Caption = 'Get ID'
          TabOrder = 3
          OnClick = ButtonGetIDClick
        end
        object ButtonTotais: TButton
          AlignWithMargins = True
          Left = 85
          Top = 4
          Width = 75
          Height = 33
          Align = alLeft
          Caption = 'Totais'
          TabOrder = 4
          OnClick = ButtonTotaisClick
        end
      end
      object MemoThreads: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 50
        Width = 605
        Height = 383
        Align = alClient
        TabOrder = 1
      end
    end
    object TabDB: TTabSheet
      Caption = 'DB'
      ImageIndex = 3
      object PanelDB: TPanel
        Left = 0
        Top = 0
        Width = 611
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitTop = -6
        object ButtonGetDados: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 75
          Height = 33
          Align = alLeft
          Caption = 'Get Dados'
          TabOrder = 0
          OnClick = ButtonGetDadosClick
          ExplicitLeft = 72
          ExplicitTop = 8
          ExplicitHeight = 25
        end
        object EditQtdRegistro: TEdit
          AlignWithMargins = True
          Left = 85
          Top = 4
          Width = 82
          Height = 33
          Align = alLeft
          NumbersOnly = True
          TabOrder = 1
          TextHint = 'Qtd Registros'
          ExplicitLeft = 416
          ExplicitTop = 8
        end
      end
      object DBGridDados: TDBGrid
        Left = 0
        Top = 41
        Width = 611
        Height = 395
        Align = alClient
        DataSource = dtsDados
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object dtsDados: TDataSource
    DataSet = memDados
    Left = 320
    Top = 192
  end
  object memDados: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 320
    Top = 128
  end
end
