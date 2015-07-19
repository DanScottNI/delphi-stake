object frmExportLevel: TfrmExportLevel
  Left = 349
  Top = 376
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Export Level'
  ClientHeight = 145
  ClientWidth = 583
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
  object lblExportFilename: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Filename:'
  end
  object lblLevelToExport: TLabel
    Left = 8
    Top = 32
    Width = 79
    Height = 13
    Caption = 'Level To Export:'
  end
  object txtFilename: TEdit
    Left = 96
    Top = 8
    Width = 401
    Height = 21
    TabOrder = 0
  end
  object cbLevels: TComboBox
    Left = 96
    Top = 32
    Width = 401
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 1
  end
  object cmdBrowse: TButton
    Left = 504
    Top = 8
    Width = 75
    Height = 21
    Caption = '&Browse'
    TabOrder = 2
    OnClick = cmdBrowseClick
  end
  object cmdExport: TButton
    Left = 424
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Export'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = cmdExportClick
  end
  object cmdCancel: TButton
    Left = 504
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object grpExportFollowing: TGroupBox
    Left = 8
    Top = 56
    Width = 569
    Height = 49
    Caption = 'Export the following:'
    TabOrder = 5
    object chkEnemyData: TCheckBox
      Left = 464
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Enemy Data'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkLevelData: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Level Data'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkTSA: TCheckBox
      Left = 122
      Top = 16
      Width = 75
      Height = 17
      Caption = 'TSA'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object chkPalette: TCheckBox
      Left = 236
      Top = 16
      Width = 85
      Height = 17
      Caption = 'Palette'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object chkGraphics: TCheckBox
      Left = 350
      Top = 16
      Width = 87
      Height = 17
      Caption = 'Graphics'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.spf'
    Filter = 'SPF v1.0 Format (*.spf)|*.spf'
    Left = 504
    Top = 32
  end
end
