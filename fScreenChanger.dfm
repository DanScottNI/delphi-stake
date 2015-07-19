object frmScreenChanger: TfrmScreenChanger
  Left = 512
  Top = 426
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Stair Properties'
  ClientHeight = 72
  ClientWidth = 272
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
    Top = 40
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
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
