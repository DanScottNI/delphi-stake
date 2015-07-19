object frmDamageSettings: TfrmDamageSettings
  Left = 234
  Top = 113
  HelpContext = 1001
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Damage Settings'
  ClientHeight = 136
  ClientWidth = 314
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
  object lblStage1to6: TLabel
    Left = 8
    Top = 8
    Width = 63
    Height = 13
    Caption = 'Stage 1 to 6:'
  end
  object lblStage7to11: TLabel
    Left = 8
    Top = 32
    Width = 69
    Height = 13
    Caption = 'Stage 7 to 11:'
  end
  object lblStage12Plus: TLabel
    Left = 8
    Top = 56
    Width = 55
    Height = 13
    Caption = 'Stage 12+:'
  end
  object lblMeatEnergy: TLabel
    Left = 8
    Top = 80
    Width = 65
    Height = 13
    Caption = 'Meat Energy:'
  end
  object imgStage1to6: TImage32
    Left = 128
    Top = 8
    Width = 160
    Height = 16
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 0
  end
  object imgStage7to11: TImage32
    Left = 128
    Top = 32
    Width = 160
    Height = 16
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 1
  end
  object imgStage12Plus: TImage32
    Left = 128
    Top = 56
    Width = 160
    Height = 16
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 2
  end
  object cmdStage1to6Down: TButton
    Left = 113
    Top = 8
    Width = 15
    Height = 16
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = cmdStage1to6DownClick
  end
  object cmdStage7to11Down: TButton
    Left = 113
    Top = 32
    Width = 15
    Height = 16
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = cmdStage7to11DownClick
  end
  object cmdStage12plusDown: TButton
    Left = 113
    Top = 56
    Width = 15
    Height = 16
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = cmdStage12plusDownClick
  end
  object cmdStage1to6Up: TButton
    Left = 289
    Top = 8
    Width = 15
    Height = 16
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = cmdStage1to6UpClick
  end
  object cmdStage7to11Up: TButton
    Left = 289
    Top = 32
    Width = 15
    Height = 16
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = cmdStage7to11UpClick
  end
  object cmdStage12PlusUp: TButton
    Left = 289
    Top = 56
    Width = 15
    Height = 16
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = cmdStage12PlusUpClick
  end
  object cmdOk: TButton
    Left = 152
    Top = 104
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 9
    OnClick = cmdOkClick
  end
  object cmdCancel: TButton
    Left = 232
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 10
  end
  object cmdMeatDown: TButton
    Left = 113
    Top = 80
    Width = 15
    Height = 16
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = cmdMeatDownClick
  end
  object imgMeat: TImage32
    Left = 128
    Top = 80
    Width = 160
    Height = 16
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 12
  end
  object cmdMeatUp: TButton
    Left = 289
    Top = 80
    Width = 15
    Height = 16
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = cmdMeatUpClick
  end
  object Bitmap32List: TBitmap32List
    Bitmaps = <
      item
        Bitmap.ResamplerClassName = 'TNearestResampler'
        Bitmap.Data = {
          0500000008000000080000FF080000FF080000FF080000FF080000FF080000FF
          0038FCFF0038FCFF0038FCFF080000FF080000FF0038FCFF0038FCFF0038FCFF
          080000FF080000FF0038FCFF0038FCFF0038FCFF080000FF080000FF0038FCFF
          0038FCFF0038FCFF080000FF080000FF0038FCFF0038FCFF0038FCFF080000FF
          080000FF0038FCFF0038FCFF0038FCFF080000FF080000FF080000FF080000FF
          080000FF080000FF}
      end
      item
        Bitmap.ResamplerClassName = 'TNearestResampler'
        Bitmap.Data = {
          0500000008000000080000FF080000FF080000FF080000FF080000FF080000FF
          FCF8FCFFFCF8FCFFFCF8FCFF080000FF080000FFFCF8FCFF080000FFFCF8FCFF
          080000FF080000FFFCF8FCFF080000FFFCF8FCFF080000FF080000FFFCF8FCFF
          080000FFFCF8FCFF080000FF080000FFFCF8FCFF080000FFFCF8FCFF080000FF
          080000FFFCF8FCFFFCF8FCFFFCF8FCFF080000FF080000FF080000FF080000FF
          080000FF080000FF}
      end>
    Left = 120
    Top = 104
  end
end
