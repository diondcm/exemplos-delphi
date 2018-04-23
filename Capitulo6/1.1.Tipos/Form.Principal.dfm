object frmTipos: TfrmTipos
  Left = 0
  Top = 0
  Caption = 'Tipos'
  ClientHeight = 299
  ClientWidth = 635
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
  object buttonCriaPanel: TButton
    Left = 32
    Top = 16
    Width = 105
    Height = 33
    Action = actionCriaPanel
    TabOrder = 0
  end
  object buttonExecuta: TButton
    Left = 32
    Top = 72
    Width = 105
    Height = 33
    Caption = 'buttonExecuta'
    TabOrder = 1
    OnClick = buttonExecutaClick
  end
  object Button1: TButton
    Left = 288
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 32
    Top = 184
    Width = 185
    Height = 89
    Lines.Strings = (
      'Cria Panel')
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 216
    Top = 22
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Button2'
  end
  object Button2: TButton
    Left = 368
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 5
  end
  object ActionList1: TActionList
    Left = 528
    Top = 72
    object actionCriaPanel: TAction
      Caption = 'Cria Panel'
      OnExecute = actionCriaPanelExecute
    end
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToPropertyCaption: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = Memo1
      Track = False
      Component = buttonCriaPanel
      ComponentProperty = 'Caption'
    end
    object LinkControlToPropertyCaption2: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = Edit1
      Track = True
      Component = Button2
      ComponentProperty = 'Caption'
    end
  end
end
