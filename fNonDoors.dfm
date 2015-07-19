object frmNonDoorOpt: TfrmNonDoorOpt
  Left = 234
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Non-Standard Doors Properties'
  ClientHeight = 96
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblWalkToX: TLabel
    Left = 8
    Top = 32
    Width = 80
    Height = 13
    Caption = 'Walk To X Value:'
  end
  object lblXPosDoor: TLabel
    Left = 8
    Top = 8
    Width = 129
    Height = 13
    Caption = 'Current X Position of Door:'
  end
  object txtWalkToX: TEdit
    Left = 144
    Top = 32
    Width = 121
    Height = 21
    MaxLength = 2
    TabOrder = 0
    Text = '00'
  end
  object cmdOK: TButton
    Left = 112
    Top = 64
    Width = 75
    Height = 25
    Caption = '&OK'
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
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
