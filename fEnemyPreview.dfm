object frmEnemyPreview: TfrmEnemyPreview
  Left = 461
  Top = 301
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enemy Preview Y'
  ClientHeight = 192
  ClientWidth = 248
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
  object imgLevel: TImage32
    Left = 0
    Top = 0
    Width = 248
    Height = 192
    Align = alClient
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    OnMouseUp = imgLevelMouseUp
  end
  object Bitmap32List: TBitmap32List
    Bitmaps = <>
    Left = 112
    Top = 96
  end
end
