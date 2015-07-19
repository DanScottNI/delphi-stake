object frmMusicPointer: TfrmMusicPointer
  Left = 519
  Top = 309
  HelpContext = 1006
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Music Pointer Editing'
  ClientHeight = 183
  ClientWidth = 359
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
  object lblTrackName: TLabel
    Left = 8
    Top = 32
    Width = 60
    Height = 13
    Caption = 'Track Name:'
  end
  object lblMusic: TLabel
    Left = 8
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Music:'
  end
  object cbTrackName: TComboBox
    Left = 88
    Top = 32
    Width = 217
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 200
    Top = 152
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object cmdCancel: TButton
    Left = 278
    Top = 152
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object chkgrpAdvEditing: TGroupBox
    Left = 8
    Top = 56
    Width = 345
    Height = 89
    Enabled = False
    TabOrder = 4
    object lblSquare1: TLabel
      Left = 8
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Square 1:'
      Enabled = False
    end
    object lblSquare2: TLabel
      Left = 184
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Square 2:'
      Enabled = False
    end
    object lblTriangle: TLabel
      Left = 8
      Top = 56
      Width = 42
      Height = 13
      Caption = 'Triangle:'
      Enabled = False
    end
    object txtSquare1: TEdit
      Left = 96
      Top = 24
      Width = 65
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object txtSquare2: TEdit
      Left = 272
      Top = 24
      Width = 65
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object txtTriangle: TEdit
      Left = 96
      Top = 56
      Width = 65
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object cbMusic: TComboBox
    Left = 88
    Top = 8
    Width = 217
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 5
    OnChange = cbMusicChange
  end
  object cmdSet: TButton
    Left = 312
    Top = 32
    Width = 41
    Height = 21
    Caption = '&Set'
    TabOrder = 6
    OnClick = cmdSetClick
  end
  object chkAdvancedEditing: TCheckBox
    Left = 16
    Top = 53
    Width = 137
    Height = 17
    Caption = 'Advanced Editing Mode'
    TabOrder = 1
  end
end
