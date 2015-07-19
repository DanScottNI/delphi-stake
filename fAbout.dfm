object frmAbout: TfrmAbout
  Left = 454
  Top = 291
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'About Stake'
  ClientHeight = 167
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDansSpace: TLabel
    Left = 4
    Top = 136
    Width = 58
    Height = 13
    Cursor = crHandPoint
    Hint = 'http://dan.panicus.org'
    Caption = 'Dan'#39's Space'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
    OnClick = lblDansSpaceClick
    OnMouseEnter = lblDansSpaceMouseEnter
    OnMouseLeave = lblDansSpaceMouseLeave
  end
  object cmdOK: TButton
    Left = 232
    Top = 136
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object grpStake: TGroupBox
    Left = 4
    Top = 8
    Width = 305
    Height = 121
    Caption = 'Stake'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lblDescription: TLabel
      Left = 24
      Top = 16
      Width = 259
      Height = 26
      Caption = 
        'Stake is a level editor for the NES game, Castlevania. '#13#10'It was ' +
        'written by Dan (dan@panicus.org).'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSpecialThanks1: TLabel
      Left = 24
      Top = 53
      Width = 247
      Height = 52
      Caption = 
        'This program is not in any way associated with '#13#10'Konami, Nintend' +
        'o, or any other stupid companies. '#13#10'Do not email me for the Cast' +
        'levania ROM, because '#13#10'it'#39's rude. See the readme for '#39'Special Th' +
        'anks'#39'.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
