object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Stack & Heap'
  ClientHeight = 424
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 471
    Top = 3
    Width = 185
    Height = 418
    Align = alRight
    Color = clSilver
    TabOrder = 0
  end
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 462
    Height = 418
    Align = alClient
    TabOrder = 1
    object ButtonStack: TButton
      Left = 1
      Top = 1
      Width = 161
      Height = 81
      Caption = 'Stack'
      TabOrder = 0
      OnClick = ButtonStackClick
    end
    object ButtonHeap: TButton
      Left = 162
      Top = 1
      Width = 161
      Height = 81
      Caption = 'Heap'
      TabOrder = 1
      OnClick = ButtonHeapClick
    end
    object ButtonVars: TButton
      Left = 1
      Top = 82
      Width = 161
      Height = 81
      Caption = 'Vars'
      TabOrder = 2
      OnClick = ButtonVarsClick
    end
    object ButtonErroStack: TButton
      Left = 162
      Top = 82
      Width = 161
      Height = 81
      Caption = 'Stack Overflow'
      TabOrder = 3
      OnClick = ButtonErroStackClick
    end
    object ButtonVariants: TButton
      Left = 1
      Top = 163
      Width = 161
      Height = 81
      Caption = 'Variants'
      TabOrder = 4
      OnClick = ButtonVariantsClick
    end
  end
end
