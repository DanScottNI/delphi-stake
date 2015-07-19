object frmGlobalEnemyDataEditor: TfrmGlobalEnemyDataEditor
  Left = 236
  Top = 112
  HelpContext = 1004
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Global Enemy Data Editor'
  ClientHeight = 431
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEnemyItemDropped: TLabel
    Left = 8
    Top = 328
    Width = 106
    Height = 13
    Caption = 'Enemy/Item Dropped:'
  end
  object lblX: TLabel
    Left = 8
    Top = 352
    Width = 10
    Height = 13
    Caption = 'X:'
  end
  object lblY: TLabel
    Left = 8
    Top = 376
    Width = 10
    Height = 13
    Caption = 'Y:'
  end
  object lvwGlobalEnemyData: TListView
    Left = 8
    Top = 8
    Width = 597
    Height = 313
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Caption = 'Offset'
        Width = 100
      end
      item
        Caption = 'Enemy Type'
        Width = 125
      end
      item
        Caption = 'Enemy/Item Dropped'
        Width = 200
      end
      item
        Caption = 'X'
      end
      item
        Caption = 'Y'
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = lvwGlobalEnemyDataClick
  end
  object cbEnemyItemDropped: TComboBox
    Left = 128
    Top = 328
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 1
  end
  object txtX: TEdit
    Left = 128
    Top = 352
    Width = 57
    Height = 21
    MaxLength = 2
    TabOrder = 2
  end
  object txtY: TEdit
    Left = 128
    Top = 376
    Width = 57
    Height = 21
    MaxLength = 2
    TabOrder = 3
  end
  object cmdOK: TButton
    Left = 448
    Top = 400
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = cmdOKClick
  end
  object cmdPreview: TButton
    Left = 504
    Top = 328
    Width = 97
    Height = 25
    Caption = 'Preview'
    TabOrder = 5
    OnClick = cmdPreviewClick
  end
  object cmdSet: TButton
    Left = 400
    Top = 328
    Width = 97
    Height = 25
    Caption = 'Set'
    TabOrder = 6
    OnClick = cmdSetClick
  end
  object cmdCancel: TButton
    Left = 528
    Top = 400
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 7
  end
end
