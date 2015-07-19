object frmEnemyEditor: TfrmEnemyEditor
  Left = 359
  Top = 255
  HelpContext = 1002
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Raw Enemy Editor'
  ClientHeight = 444
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEnemyCandle: TLabel
    Left = 8
    Top = 352
    Width = 73
    Height = 13
    Caption = 'Enemy/Candle:'
  end
  object cbEnemyCandle: TComboBox
    Left = 96
    Top = 352
    Width = 257
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 384
    Top = 416
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 464
    Top = 416
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object cmdEdit: TButton
    Left = 365
    Top = 352
    Width = 75
    Height = 25
    Caption = '&Edit'
    TabOrder = 3
    OnClick = cmdEditClick
  end
  object cmdClearEnemyList: TButton
    Left = 8
    Top = 384
    Width = 153
    Height = 25
    Caption = '&Clear Enemy List'
    TabOrder = 4
    OnClick = cmdClearEnemyListClick
  end
  object lvwEnemies: TListView
    Left = 8
    Top = 72
    Width = 529
    Height = 273
    Columns = <
      item
        Caption = 'ID'
        Width = 40
      end
      item
        Caption = 'Type'
        Width = 60
      end
      item
        Caption = 'Name'
        Width = 350
      end
      item
        Caption = 'Y'
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 5
    ViewStyle = vsReport
    OnClick = lvwEnemiesClick
  end
  object cmdPreview: TButton
    Left = 168
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Preview'
    TabOrder = 6
    OnClick = cmdPreviewClick
  end
  object cmdClear: TButton
    Left = 448
    Top = 352
    Width = 75
    Height = 25
    Caption = '&Clear'
    TabOrder = 7
    OnClick = cmdClearClick
  end
  object grpEnemyData: TGroupBox
    Left = 8
    Top = 8
    Width = 529
    Height = 57
    Caption = 'Enemy Data:'
    TabOrder = 8
    object lblPointerOffset: TLabel
      Left = 8
      Top = 24
      Width = 72
      Height = 13
      Caption = 'Pointer Offset:'
    end
    object lblPointer: TLabel
      Left = 192
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Pointer:'
    end
    object lblOffset: TLabel
      Left = 368
      Top = 24
      Width = 35
      Height = 13
      Caption = 'Offset:'
    end
  end
end
