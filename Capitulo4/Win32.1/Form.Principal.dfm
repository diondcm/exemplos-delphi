object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Classes e Objetos'
  ClientHeight = 508
  ClientWidth = 1106
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object memoPropriedades: TMemo
    Left = 783
    Top = 0
    Width = 323
    Height = 508
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 312
    ExplicitHeight = 263
  end
  object panelControles: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 508
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -6
    object panelMamiferoLocal: TPanel
      Left = 1
      Top = 1
      Width = 781
      Height = 88
      Align = alTop
      Caption = 'panelMamiferoLocal'
      ShowCaption = False
      TabOrder = 0
      ExplicitLeft = -4
      ExplicitTop = 0
      object buttonCriaObjetos: TButton
        Left = 16
        Top = 16
        Width = 113
        Height = 49
        Caption = 'Criar Objetos'
        TabOrder = 0
        OnClick = buttonCriaObjetosClick
      end
      object buttonExibeMamifero: TButton
        Left = 352
        Top = 15
        Width = 113
        Height = 25
        Caption = 'Exibe Mam'#237'fero'
        TabOrder = 1
        OnClick = buttonExibeMamiferoClick
      end
      object buttonGestacao: TButton
        Left = 144
        Top = 16
        Width = 113
        Height = 23
        Caption = 'Dias Gesta'#231#227'o'
        TabOrder = 2
        OnClick = buttonGestacaoClick
      end
      object editDiasGestacao: TEdit
        Left = 272
        Top = 18
        Width = 57
        Height = 21
        NumbersOnly = True
        TabOrder = 3
        Text = '90'
      end
    end
    object panelLista: TPanel
      Left = 1
      Top = 280
      Width = 781
      Height = 227
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = -315
      ExplicitTop = 192
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 779
        Height = 13
        Align = alTop
        Caption = ' Lista de Mam'#237'feros'
        ExplicitWidth = 92
      end
      object labelTempoGestacaoEmDias: TLabel
        Left = 8
        Top = 45
        Width = 36
        Height = 13
        Caption = 'Em dias'
      end
      object editTempoGestacao: TEdit
        Left = 8
        Top = 64
        Width = 145
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        TextHint = 'Tempo de Gesta'#231#227'o'
      end
      object editTempoAmamentacao: TEdit
        Left = 8
        Top = 120
        Width = 145
        Height = 21
        NumbersOnly = True
        TabOrder = 1
        TextHint = 'Tempo de amamenta'#231#227'o'
      end
      object buttonCriarCao: TButton
        Left = 240
        Top = 36
        Width = 75
        Height = 25
        Caption = 'Criar C'#227'o'
        TabOrder = 2
        OnClick = buttonCriarCaoClick
      end
      object buttonCriarBaleia: TButton
        Left = 240
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Criar Baleia'
        TabOrder = 3
        OnClick = buttonCriarBaleiaClick
      end
      object buttonCriarMorcego: TButton
        Left = 240
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Criar Morcego'
        TabOrder = 4
        OnClick = buttonCriarMorcegoClick
      end
      object listBoxMamiferos: TListBox
        Left = 463
        Top = 14
        Width = 317
        Height = 212
        Align = alRight
        ItemHeight = 13
        TabOrder = 5
        OnClick = listBoxMamiferosClick
      end
      object buttonDeleta: TButton
        Left = 424
        Top = 192
        Width = 33
        Height = 25
        Caption = '-'
        TabOrder = 6
        OnClick = buttonDeletaClick
      end
    end
    object buttonCriaObj: TButton
      Left = 24
      Top = 136
      Width = 130
      Height = 25
      Caption = 'Criar Obj'
      TabOrder = 2
      OnClick = buttonCriaObjClick
    end
    object Button3: TButton
      Left = 24
      Top = 176
      Width = 130
      Height = 25
      Caption = 'Destroi Obj'
      TabOrder = 3
      OnClick = Button3Click
    end
  end
end
