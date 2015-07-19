object frmStageProperties: TfrmStageProperties
  Left = 439
  Top = 347
  HelpContext = 1014
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Stage Properties'
  ClientHeight = 105
  ClientWidth = 303
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
  object lblTime: TLabel
    Left = 8
    Top = 8
    Width = 26
    Height = 13
    Caption = 'Time:'
  end
  object lblBossScreen: TLabel
    Left = 8
    Top = 40
    Width = 102
    Height = 13
    Caption = 'Boss Screen Number:'
  end
  object cmdOK: TButton
    Left = 144
    Top = 72
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 224
    Top = 72
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object txtTime: TEdit
    Left = 128
    Top = 8
    Width = 73
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object cbBossScreenNumber: TComboBox
    Left = 128
    Top = 40
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 3
  end
end
