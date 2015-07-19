object frmROMProperties: TfrmROMProperties
  Left = 512
  Top = 283
  HelpContext = 1011
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ROM Properties'
  ClientHeight = 167
  ClientWidth = 194
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
  object lblStartingHearts: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 13
    Caption = 'Starting Hearts:'
  end
  object lblStartingLives: TLabel
    Left = 8
    Top = 32
    Width = 69
    Height = 13
    Caption = 'Starting Lives:'
  end
  object lblSmallHeartValue: TLabel
    Left = 8
    Top = 56
    Width = 87
    Height = 13
    Caption = 'Small Heart Value:'
  end
  object lblBigHeartValue: TLabel
    Left = 8
    Top = 80
    Width = 77
    Height = 13
    Caption = 'Big Heart Value:'
  end
  object lblClockCost: TLabel
    Left = 8
    Top = 104
    Width = 54
    Height = 13
    Caption = 'Clock Cost:'
  end
  object cmdOK: TButton
    Left = 32
    Top = 136
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 112
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object txtStartingHearts: TSpinEdit
    Left = 112
    Top = 8
    Width = 73
    Height = 22
    MaxLength = 2
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object txtStartingLives: TSpinEdit
    Left = 112
    Top = 32
    Width = 73
    Height = 22
    MaxLength = 2
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
  object txtSmallHeartVal: TSpinEdit
    Left = 112
    Top = 56
    Width = 73
    Height = 22
    MaxLength = 2
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
  object txtBigHeartVal: TSpinEdit
    Left = 112
    Top = 80
    Width = 73
    Height = 22
    MaxLength = 2
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
  end
  object txtClockValue: TSpinEdit
    Left = 112
    Top = 104
    Width = 73
    Height = 22
    MaxLength = 2
    MaxValue = 0
    MinValue = 0
    TabOrder = 6
    Value = 0
  end
end
