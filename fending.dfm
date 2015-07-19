object frmEndingEditor: TfrmEndingEditor
  Left = 300
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ending Editor'
  ClientHeight = 494
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 254
    Height = 52
    Caption = 
      'Please note:'#13#10#13#10'This ending editor does not display sprites. Als' +
      'o, the '#13#10'top && bottom rows do not display on NTSC ROMs.'
    Transparent = True
  end
  object lblCurTile: TLabel
    Left = 528
    Top = 384
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
  object cmdEditText: TButton
    Left = 528
    Top = 408
    Width = 121
    Height = 25
    Caption = 'Edit Text'
    TabOrder = 5
    OnClick = cmdEditTextClick
  end
end
