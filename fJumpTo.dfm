object frmJumpTo: TfrmJumpTo
  Left = 231
  Top = 113
  HelpContext = 1005
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Jump to...'
  ClientHeight = 194
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lstLevels: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 145
    ItemHeight = 13
    Items.Strings = (
      'Level 1'
      'Level 2'
      'Level 3'
      'Level 4'
      'Level 5'
      'Level 6'
      'Level 7')
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 120
    Top = 160
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 200
    Top = 160
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 1
    TabOrder = 2
  end
end
