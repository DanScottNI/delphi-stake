object frmErasePatRange: TfrmErasePatRange
  Left = 388
  Top = 244
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Erase Range In Pattern Table'
  ClientHeight = 98
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblStartTileID: TLabel
    Left = 8
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Start Tile:'
  end
  object lblEndTileID: TLabel
    Left = 8
    Top = 32
    Width = 41
    Height = 13
    Caption = 'End Tile:'
  end
  object txtStartTile: TEdit
    Left = 80
    Top = 8
    Width = 100
    Height = 21
    MaxLength = 2
    TabOrder = 0
    Text = '00'
  end
  object txtEndTile: TEdit
    Left = 80
    Top = 32
    Width = 100
    Height = 21
    MaxLength = 2
    TabOrder = 1
    Text = '00'
  end
  object cmdOK: TButton
    Left = 96
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 176
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
