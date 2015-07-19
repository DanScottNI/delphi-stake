object frmSetupStake: TfrmSetupStake
  Left = 385
  Top = 334
  HelpContext = 1015
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Setup Stake'
  ClientHeight = 193
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblPalette: TLabel
    Left = 8
    Top = 128
    Width = 38
    Height = 13
    Caption = 'Palette:'
  end
  object lblDatafile: TLabel
    Left = 8
    Top = 72
    Width = 46
    Height = 13
    Caption = 'Data File:'
  end
  object lblWelcome: TLabel
    Left = 8
    Top = 8
    Width = 133
    Height = 13
    Caption = 'Welcome to Stake v1.1!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblWelText: TLabel
    Left = 8
    Top = 32
    Width = 434
    Height = 26
    Caption = 
      'Stake has determined that you have never run Stake v1.1 before, ' +
      'so now is the time to fill'#13#10' in a few basic options to make your' +
      ' usage of Stake an enjoyable one.'
    Transparent = True
  end
  object cbPaletteFile: TComboBox
    Left = 104
    Top = 128
    Width = 353
    Height = 21
    Hint = 'Select the palette file that you want Stake to use.'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object cbDataFile: TComboBox
    Left = 104
    Top = 72
    Width = 353
    Height = 21
    Hint = 'Select the data file that you want Stake to use, here.'
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 376
    Top = 160
    Width = 75
    Height = 25
    Hint = 'Click me to finish this dialog. :D'
    Caption = '&OK'
    Default = True
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object cmdGuessROM: TButton
    Left = 328
    Top = 96
    Width = 123
    Height = 25
    Hint = 
      'If you do not know what type of ROM yours is, click this button.' +
      #13#10'If your ROM is one of the supported types in Stake, and if it ' +
      'is unaltered'#13#10'Stake will detect which ROM it is.'
    Caption = '&Guess ROM'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = cmdGuessROMClick
  end
  object OpenDialog: TOpenDialog
    Filter = 'NES ROM (*.nes)|*.nes'
    Title = 'Please select a ROM'
    Left = 296
    Top = 96
  end
end
