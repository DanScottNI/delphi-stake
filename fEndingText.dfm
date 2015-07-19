object frmEndingTextEditor: TfrmEndingTextEditor
  Left = 234
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ending Text Editor'
  ClientHeight = 304
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblTextOffsets: TLabel
    Left = 8
    Top = 8
    Width = 65
    Height = 13
    Caption = 'Text Offsets:'
  end
  object cbTextOffsets: TComboBox
    Left = 112
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 0
    OnChange = cbTextOffsetsChange
  end
  object cmdOk: TButton
    Left = 376
    Top = 272
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOkClick
  end
  object cmdCancel: TButton
    Left = 456
    Top = 272
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object imgEndingText: TImage32
    Left = 8
    Top = 40
    Width = 256
    Height = 64
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 3
    OnMouseDown = imgEndingTextMouseDown
  end
  object imgTSA: TImage32
    Left = 272
    Top = 8
    Width = 256
    Height = 256
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 4
    OnMouseDown = imgTSAMouseDown
  end
  object imgEndingText1: TImage32
    Left = 8
    Top = 116
    Width = 256
    Height = 64
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 5
    OnMouseDown = imgEndingText1MouseDown
  end
end
