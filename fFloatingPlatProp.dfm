object frmFloatingPlatChange: TfrmFloatingPlatChange
  Left = 500
  Top = 333
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Floating Platform Properties'
  ClientHeight = 144
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblScreenNumber: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 13
    Caption = 'Screen Number:'
  end
  object lblPixels: TLabel
    Left = 8
    Top = 56
    Width = 79
    Height = 13
    Caption = 'Pixels To Travel:'
  end
  object lblSpeed: TLabel
    Left = 8
    Top = 80
    Width = 34
    Height = 13
    Caption = 'Speed:'
  end
  object lblUnknownByte1: TLabel
    Left = 8
    Top = 32
    Width = 19
    Height = 13
    Caption = '???:'
  end
  object cmdOk: TButton
    Left = 104
    Top = 112
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = cmdOkClick
  end
  object cmdCancel: TButton
    Left = 184
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object txtPixels: TEdit
    Left = 112
    Top = 56
    Width = 75
    Height = 21
    TabOrder = 2
  end
  object txtSpeed: TEdit
    Left = 112
    Top = 80
    Width = 75
    Height = 21
    TabOrder = 3
  end
  object cbScreens: TComboBox
    Left = 112
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 4
  end
  object txtUnknownByte1: TEdit
    Left = 112
    Top = 32
    Width = 75
    Height = 21
    TabOrder = 5
  end
end
