object frmSpikeCrusherScreenChanger: TfrmSpikeCrusherScreenChanger
  Left = 478
  Top = 389
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Spike Crusher Properties'
  ClientHeight = 96
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblSpikeCrusherScreen: TLabel
    Left = 8
    Top = 8
    Width = 106
    Height = 13
    Caption = 'Spike Crusher Screen:'
  end
  object lblDescVal1: TLabel
    Left = 8
    Top = 32
    Width = 72
    Height = 13
    Caption = 'Descent Value:'
  end
  object cbScreens: TComboBox
    Left = 128
    Top = 8
    Width = 137
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 112
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 192
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object txtDescVal1: TEdit
    Left = 128
    Top = 32
    Width = 73
    Height = 21
    MaxLength = 2
    TabOrder = 3
  end
end
