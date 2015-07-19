object frmImportLevel: TfrmImportLevel
  Left = 266
  Top = 459
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Import Level'
  ClientHeight = 73
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblExportFilename: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Filename:'
  end
  object txtFilename: TEdit
    Left = 96
    Top = 8
    Width = 401
    Height = 21
    TabOrder = 0
  end
  object cmdBrowse: TButton
    Left = 504
    Top = 8
    Width = 75
    Height = 21
    Caption = '&Browse'
    TabOrder = 1
    OnClick = cmdBrowseClick
  end
  object cmdImport: TButton
    Left = 424
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Import'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdImportClick
  end
  object cmdCancel: TButton
    Left = 504
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object OpenDialog: TOpenDialog
    Filter = 'SPF v1.0 Format (*.spf)|*.spf'
    Left = 64
    Top = 8
  end
end
