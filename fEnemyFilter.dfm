object frmEnemyFilter: TfrmEnemyFilter
  Left = 809
  Top = 359
  HelpContext = 1003
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enemy'
  ClientHeight = 231
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblItemDropped: TLabel
    Left = 8
    Top = 152
    Width = 106
    Height = 13
    Caption = 'Item Dropped/Enemy:'
  end
  object lblEnemyQuadrant: TLabel
    Left = 8
    Top = 8
    Width = 146
    Height = 13
    Caption = 'Enemy in this column: N/A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblIndex: TLabel
    Left = 8
    Top = 196
    Width = 32
    Height = 13
    Caption = 'Index:'
  end
  object cbItemDroppedEnemy: TComboBox
    Left = 8
    Top = 168
    Width = 273
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 0
    OnChange = cbItemDroppedEnemyChange
  end
  object scrIndex: TScrollBar
    Left = 128
    Top = 196
    Width = 121
    Height = 17
    Max = 1
    Min = 1
    PageSize = 1
    Position = 1
    TabOrder = 1
    OnChange = scrIndexChange
  end
  object rdgEnemyCandle: TRadioGroup
    Left = 8
    Top = 40
    Width = 273
    Height = 105
    Caption = 'Enemy Type:'
    ItemIndex = 0
    Items.Strings = (
      'Candles'
      'Candle-stands'
      'Enemy')
    TabOrder = 2
    OnClick = rdgEnemyCandleClick
  end
end
