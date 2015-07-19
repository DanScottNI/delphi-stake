object frmTitleScreenEditor: TfrmTitleScreenEditor
  Left = 302
  Top = 254
  HelpContext = 1016
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Title Screen Editor'
  ClientHeight = 496
  ClientWidth = 793
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
    Width = 256
    Height = 91
    Caption = 
      'Please note:'#13#10#13#10'This title screen editor does not display sprite' +
      's yet.'#13#10'Therefore, I would personally clear the sprite pattern'#13#10 +
      'table, using the option in the ASM hacks dialog, or'#13#10'using a gra' +
      'phics editor. Also, the top && bottom rows '#13#10'do not display on N' +
      'TSC ROMs.'
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
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = chkViewGridlinesClick
  end
end
