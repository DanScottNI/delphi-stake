object frmBreakableChanger: TfrmBreakableChanger
  Left = 465
  Top = 377
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Breakable Block Properties'
  ClientHeight = 92
  ClientWidth = 271
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
  object lblScreenNo: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 13
    Caption = 'Screen Number:'
  end
  object cbScreens: TComboBox
    Left = 120
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 109
    Top = 64
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 189
    Top = 64
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object chkEnabled: TCheckBox
    Left = 8
    Top = 40
    Width = 193
    Height = 17
    Caption = '&Appears only in the second quest'
    TabOrder = 3
  end
end
