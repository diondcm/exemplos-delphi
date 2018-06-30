object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pages'
  ClientHeight = 465
  ClientWidth = 330
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
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 324
    Height = 459
    ActivePage = tabTipos
    Align = alClient
    TabOrder = 0
    object tabTipos: TTabSheet
      Caption = 'Tipos'
      object buttonPessoa: TButton
        Left = 19
        Top = 349
        Width = 142
        Height = 65
        Caption = 'Pessoa'
        TabOrder = 0
        OnClick = buttonPessoaClick
      end
      object Button1: TButton
        Left = 184
        Top = 369
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object tabFrames: TTabSheet
      Caption = 'Frames'
      ImageIndex = 1
      inline fraPessoa1: TfraPessoa
        Left = 0
        Top = 0
        Width = 316
        Height = 240
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 316
        inherited panelPessoa: TPanel
          Width = 310
          ExplicitLeft = 3
          ExplicitTop = 3
          ExplicitWidth = 310
          ExplicitHeight = 234
          inherited panelControles: TPanel
            Width = 302
            ExplicitWidth = 302
            inherited buttonCriar: TButton
              ExplicitTop = 4
            end
            inherited buttonSalvar: TButton
              ExplicitLeft = 85
              ExplicitTop = 4
              ExplicitHeight = 45
            end
          end
          inherited gridPessoas: TDBGrid
            Width = 302
          end
        end
        inherited cdsPessoa: TClientDataSet
          Left = 208
          Top = 88
        end
      end
      object buttonLimpar: TButton
        Left = 3
        Top = 368
        Width = 118
        Height = 73
        Caption = 'Limpar'
        TabOrder = 1
        OnClick = buttonLimparClick
      end
    end
    object tabControlEx: TTabSheet
      Caption = 'Tab-Control'
      ImageIndex = 2
      object TabControl1: TTabControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 310
        Height = 425
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpBottom
        Tabs.Strings = (
          'Teste'
          'Teste2'
          'Teste 3')
        TabIndex = 2
        OnChange = TabControl1Change
      end
    end
  end
end
