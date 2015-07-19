object frmSelectScreen: TfrmSelectScreen
  Left = 486
  Top = 307
  HelpContext = 1012
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Select Screen'
  ClientHeight = 264
  ClientWidth = 228
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgMap: TImage32
    Left = 0
    Top = 0
    Width = 228
    Height = 245
    Align = alClient
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 0
    OnMouseMove = imgMapMouseMove
    OnMouseUp = imgMapMouseDown
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 245
    Width = 228
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
end
