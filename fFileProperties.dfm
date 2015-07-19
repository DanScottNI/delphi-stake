object frmFileProperties: TfrmFileProperties
  Left = 234
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Properties'
  ClientHeight = 168
  ClientWidth = 399
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
  object lblFilename: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Filename:'
  end
  object lblMemoryMapper: TLabel
    Left = 8
    Top = 40
    Width = 81
    Height = 13
    Caption = 'Memory Mapper:'
  end
  object lblPRGCount: TLabel
    Left = 8
    Top = 64
    Width = 56
    Height = 13
    Caption = 'PRG Count:'
  end
  object lblCHRCount: TLabel
    Left = 8
    Top = 88
    Width = 57
    Height = 13
    Caption = 'CHR Count:'
  end
  object lblFileSize: TLabel
    Left = 8
    Top = 112
    Width = 42
    Height = 13
    Caption = 'File Size:'
  end
  object txtFilename: TEdit
    Left = 64
    Top = 8
    Width = 329
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 320
    Top = 136
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
