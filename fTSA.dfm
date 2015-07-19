object frmTSAEditor: TfrmTSAEditor
  Left = 717
  Top = 416
  HelpContext = 1017
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'TSA Editor'
  ClientHeight = 274
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgTSA: TImage32
    Left = 0
    Top = 0
    Width = 256
    Height = 256
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 0
    OnMouseDown = imgTSAMouseUp
    OnMouseMove = imgTSAMouseMove
  end
  object TSAStatusbar: TStatusBar
    Left = 0
    Top = 255
    Width = 256
    Height = 19
    Panels = <
      item
        Text = 'Selected: 00'
        Width = 128
      end
      item
        Text = '00'
        Width = 128
      end>
  end
end
