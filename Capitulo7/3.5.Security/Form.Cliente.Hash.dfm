object frmHash: TfrmHash
  Left = 0
  Top = 0
  Caption = 'Teste Hash'
  ClientHeight = 358
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panelHash: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 198
    Height = 352
    Align = alLeft
    TabOrder = 0
    object memoLog: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 31
      Width = 190
      Height = 317
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 152
      ExplicitWidth = 454
      ExplicitHeight = 146
    end
    object editTexto: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 190
      Height = 21
      Align = alTop
      TabOrder = 1
      OnKeyDown = editTextoKeyDown
      ExplicitLeft = 3
      ExplicitTop = 8
      ExplicitWidth = 121
    end
  end
  object panelJSON: TPanel
    AlignWithMargins = True
    Left = 207
    Top = 3
    Width = 447
    Height = 352
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 152
    ExplicitTop = 176
    ExplicitWidth = 185
    ExplicitHeight = 41
    object memoJson: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 169
      Height = 344
      Align = alLeft
      Lines.Strings = (
        '{'
        #9'"status": "ok",'
        #9'"name": "Market Price '
        '(USD)",'
        #9'"unit": "USD",'
        #9'"period": "day",'
        #9'"description": '
        '"Average USD'
        #9'market price across '
        'major bitcoin'
        #9'exchanges.",'
        #9'"values": [{'
        #9#9#9
        '"x": 1499990400,'
        #9#9#9
        '"y": 2190.947833333333,'
        #9#9#9
        '"subvalor_obj": {'
        #9#9#9#9
        '"id": 2,'
        #9#9#9#9
        '"data": "teste"'
        #9#9#9'},'
        #9#9#9
        '"subvalor_list": {'
        #9#9#9#9
        '"listHelper":'
        #9#9#9#9
        '[0],'
        #9#9#9#9
        '"items": [{'
        #9#9#9#9
        #9#9'"id": 2,'
        #9#9#9#9
        #9#9'"data":'
        #9#9#9#9
        #9#9'"teste"'
        #9#9#9#9
        #9'}, {'
        #9#9#9#9
        #9#9'"id": 4,'
        #9#9#9#9
        #9#9'"data":'
        #9#9#9#9
        #9#9'"teste4"'
        #9#9#9#9
        #9'}'
        #9#9#9#9
        ']'
        #9#9#9'},'
        #9#9#9
        '"subvalor_arr": [{'
        #9#9#9#9
        #9'"id": 2,'
        #9#9#9#9
        #9'"data": "teste"'
        #9#9#9#9
        '}, {'
        #9#9#9#9
        #9'"id": 2,'
        #9#9#9#9
        #9'"data": "teste"'
        #9#9#9#9
        '}'
        #9#9#9']'
        #9#9'}'
        #9']'
        '}')
      TabOrder = 0
    end
    object memObj: TMemo
      AlignWithMargins = True
      Left = 297
      Top = 4
      Width = 146
      Height = 344
      Align = alRight
      TabOrder = 1
    end
    object buttonToObj: TButton
      Left = 179
      Top = 4
      Width = 112
      Height = 44
      Caption = 'To Obj >>'
      TabOrder = 2
      OnClick = buttonToObjClick
    end
    object buttonToJson: TButton
      Left = 179
      Top = 307
      Width = 112
      Height = 41
      Caption = '<< To JSon'
      TabOrder = 3
      OnClick = buttonToJsonClick
    end
  end
end
