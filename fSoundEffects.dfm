object frmSoundEffects: TfrmSoundEffects
  Left = 649
  Top = 147
  HelpContext = 1013
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Toggle Sound Effects'
  ClientHeight = 287
  ClientWidth = 224
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
  object chkHeartSoundEffect: TCheckBox
    Left = 8
    Top = 8
    Width = 200
    Height = 17
    Caption = 'Heart Sound Effect'
    TabOrder = 0
  end
  object chkWhipPowerUpSoundEffect: TCheckBox
    Left = 8
    Top = 32
    Width = 200
    Height = 17
    Caption = 'Whip Power Up Sound Effect'
    TabOrder = 1
  end
  object chkCashSoundEffect: TCheckBox
    Left = 8
    Top = 56
    Width = 200
    Height = 17
    Caption = 'Money Sound Effect'
    TabOrder = 2
  end
  object chkCastleDoorSoundEffect: TCheckBox
    Left = 8
    Top = 80
    Width = 200
    Height = 17
    Caption = 'Castle Door Sound Effect'
    TabOrder = 3
  end
  object chkInvulnerabilityJarSoundEffect1: TCheckBox
    Left = 8
    Top = 104
    Width = 200
    Height = 17
    Caption = 'Invulnerability Jar Sound Effect 1'
    TabOrder = 4
  end
  object chkInvulnerabilityJarSoundEffect2: TCheckBox
    Left = 8
    Top = 128
    Width = 200
    Height = 17
    Caption = 'Invulnerability Jar Sound Effect 2'
    TabOrder = 5
  end
  object chkDoorOpeningSoundEffect: TCheckBox
    Left = 8
    Top = 152
    Width = 200
    Height = 17
    Caption = 'Door Opening Sound Effect'
    TabOrder = 6
  end
  object chkHiddenItemAppearingSoundEffect: TCheckBox
    Left = 8
    Top = 176
    Width = 200
    Height = 17
    Caption = 'Hidden Item Appearing Sound Effect'
    TabOrder = 7
  end
  object chkClearScreenItemSoundEffect: TCheckBox
    Left = 8
    Top = 200
    Width = 200
    Height = 17
    Caption = 'Clear Screen Item Sound Effect'
    TabOrder = 8
  end
  object chk1UPSoundEffect: TCheckBox
    Left = 8
    Top = 224
    Width = 200
    Height = 17
    Caption = '1UP Sound Effect'
    TabOrder = 9
  end
  object cmdOK: TButton
    Left = 64
    Top = 256
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 10
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 144
    Top = 256
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 11
  end
end
