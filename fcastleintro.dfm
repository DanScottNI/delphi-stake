object frmCastleIntroEditor: TfrmCastleIntroEditor
  Left = 234
  Top = 112
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Castle Introduction Editor'
  ClientHeight = 493
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCompressedDataSize: TLabel
    Left = 528
    Top = 272
    Width = 111
    Height = 13
    Caption = 'Compressed Data Size:'
  end
  object lblWarnings: TLabel
    Left = 528
    Top = 320
    Width = 261
    Height = 78
    Caption = 
      'Please note:'#13#10#13#10'This castle introduction editor does not display' +
      ' sprites '#13#10'yet. The top and bottom rows do not display on NTSC '#13 +
      #10'ROMs, and editing of the bottom row is not advisable '#13#10'as it af' +
      'fects level GFX too.'
    Transparent = True
  end
  object lblCurTile: TLabel
    Left = 528
    Top = 432
    Width = 60
    Height = 13
    Caption = 'Current Tile:'
  end
  object imgTitleScreen: TImage32
    Left = 8
    Top = 8
    Width = 512
    Height = 480
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 0
    OnMouseDown = imgTitleScreenMouseDown
    OnMouseMove = imgTitleScreenMouseMove
    OnMouseUp = imgTitleScreenMouseUp
  end
  object imgTSA: TImage32
    Left = 528
    Top = 8
    Width = 256
    Height = 256
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 1
    OnMouseDown = imgTSAMouseDown
    OnMouseMove = imgTSAMouseMove
  end
  object cmdOK: TButton
    Left = 632
    Top = 464
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 712
    Top = 464
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object chkViewGridlines: TCheckBox
    Left = 528
    Top = 296
    Width = 97
    Height = 17
    Caption = 'View Gridlines'
    TabOrder = 4
    OnClick = chkViewGridlinesClick
  end
end
