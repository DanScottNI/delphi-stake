object frmPaletteEditor: TfrmPaletteEditor
  Left = 405
  Top = 305
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Palette Editor'
  ClientHeight = 311
  ClientWidth = 463
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
  object lbl000F: TLabel
    Left = 368
    Top = 9
    Width = 34
    Height = 13
    Caption = '00 - 0F'
  end
  object lbl101F: TLabel
    Left = 368
    Top = 27
    Width = 34
    Height = 13
    Caption = '10 - 1F'
  end
  object lbl202F: TLabel
    Left = 368
    Top = 45
    Width = 34
    Height = 13
    Caption = '20 - 2F'
  end
  object lbl303F: TLabel
    Left = 368
    Top = 63
    Width = 34
    Height = 13
    Caption = '30 - 3F'
  end
  object lblCurrentPalette: TLabel
    Left = 80
    Top = 88
    Width = 133
    Height = 13
    Caption = 'Current Palette Colour: $00'
  end
  object imgNESColours: TImage32
    Left = 80
    Top = 8
    Width = 286
    Height = 73
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    OnMouseMove = imgNESColoursMouseMove
    OnMouseUp = imgNESColoursMouseUp
  end
  object cmdOK: TButton
    Left = 304
    Top = 280
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    DragCursor = crDefault
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 384
    Top = 280
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object pgcPalettes: TPageControl
    Left = 8
    Top = 112
    Width = 449
    Height = 161
    ActivePage = tshLevelPalettes
    TabOrder = 3
    object tshLevelPalettes: TTabSheet
      Caption = 'Current Level'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblLevelPalette: TLabel
        Left = 8
        Top = 4
        Width = 106
        Height = 13
        Caption = 'Current Level Palette:'
      end
      object imgLevelPal1: TImage32
        Left = 8
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 0
        OnMouseDown = imgLevelPal1MouseDown
      end
      object imgLevelPal2: TImage32
        Left = 117
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 1
        OnMouseDown = imgLevelPal2MouseDown
      end
      object imgLevelPal3: TImage32
        Left = 226
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 2
        OnMouseDown = imgLevelPal3MouseDown
      end
      object imgLevelPal4: TImage32
        Left = 336
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 3
        OnMouseDown = imgLevelPal4MouseDown
      end
      object imgSprPal4: TImage32
        Left = 336
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 4
        OnMouseDown = imgSprPal4MouseDown
      end
      object imgSprPal3: TImage32
        Left = 226
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 5
        OnMouseDown = imgSprPal3MouseDown
      end
      object imgSprPal2: TImage32
        Left = 117
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 6
        OnMouseDown = imgSprPal2MouseDown
      end
      object imgSprPal1: TImage32
        Left = 8
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 7
        OnMouseDown = imgSprPal1MouseDown
      end
    end
    object tshTitleScreen: TTabSheet
      Caption = 'Title Screen'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblTitleScreenPalette: TLabel
        Left = 8
        Top = 4
        Width = 97
        Height = 13
        Caption = 'Title Screen Palette:'
      end
      object imgTitScrBGPal1: TImage32
        Left = 8
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 0
        OnMouseDown = imgTitScrBGPal1MouseDown
      end
      object imgTitScrBGPal2: TImage32
        Left = 117
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 1
        OnMouseDown = imgTitScrBGPal2MouseDown
      end
      object imgTitScrBGPal3: TImage32
        Left = 226
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 2
        OnMouseDown = imgTitScrBGPal3MouseDown
      end
      object imgTitScrBGPal4: TImage32
        Left = 336
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 3
        OnMouseDown = imgTitScrBGPal4MouseDown
      end
      object imgTitScrSprPal1: TImage32
        Left = 8
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 4
        OnMouseDown = imgTitScrSprPal1MouseDown
      end
      object imgTitScrSprPal2: TImage32
        Left = 117
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 5
        OnMouseDown = imgTitScrSprPal2MouseDown
      end
      object imgTitScrSprPal3: TImage32
        Left = 226
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 6
        OnMouseDown = imgTitScrSprPal3MouseDown
      end
      object imgTitScrSprPal4: TImage32
        Left = 336
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 7
        OnMouseDown = imgTitScrSprPal4MouseDown
      end
    end
    object tshCastleIntroPalette: TTabSheet
      Caption = 'Castle Intro/Castle Map'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblCastleIntro: TLabel
        Left = 8
        Top = 4
        Width = 155
        Height = 13
        Caption = 'Castle Intro/Castle Map Palette:'
      end
      object lblSprPalCasMap: TLabel
        Left = 8
        Top = 56
        Width = 306
        Height = 13
        Caption = 
          'The sprite palette for this is shared with the level sprite pale' +
          'tte.'
      end
      object imgCasBGPal1: TImage32
        Left = 8
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 0
        OnMouseDown = imgCasBGPal1MouseDown
      end
      object imgCasBGPal2: TImage32
        Left = 117
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 1
        OnMouseDown = imgCasBGPal2MouseDown
      end
      object imgCasBGPal3: TImage32
        Left = 226
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 2
        OnMouseDown = imgCasBGPal3MouseDown
      end
      object imgCasBGPal4: TImage32
        Left = 336
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 3
        OnMouseDown = imgCasBGPal4MouseDown
      end
    end
    object tshEnding: TTabSheet
      Caption = 'Ending'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 73
        Height = 13
        Caption = 'Ending Palette:'
      end
      object lblTextChangeColours: TLabel
        Left = 8
        Top = 96
        Width = 113
        Height = 13
        Caption = 'Text Changing Colours:'
      end
      object imgEndingBG1: TImage32
        Left = 8
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 0
        OnMouseDown = imgEndingBG1MouseDown
      end
      object imgEndingBG2: TImage32
        Left = 117
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 1
        OnMouseDown = imgEndingBG2MouseDown
      end
      object imgEndingBG3: TImage32
        Left = 226
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 2
        OnMouseDown = imgEndingBG3MouseDown
      end
      object imgEndingBG4: TImage32
        Left = 336
        Top = 24
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 3
        OnMouseDown = imgEndingBG4MouseDown
      end
      object imgEndingSpr1: TImage32
        Left = 8
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 4
        OnMouseDown = imgEndingSpr1MouseDown
      end
      object imgEndingSpr2: TImage32
        Left = 117
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 5
        OnMouseDown = imgEndingSpr2MouseDown
      end
      object imgEndingSpr3: TImage32
        Left = 226
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 6
        OnMouseDown = imgEndingSpr3MouseDown
      end
      object imgEndingSpr4: TImage32
        Left = 336
        Top = 60
        Width = 100
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 7
        OnMouseDown = imgEndingSpr4MouseDown
      end
      object imgEndingText1: TImage32
        Left = 128
        Top = 96
        Width = 50
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 8
        OnMouseDown = imgEndingText1MouseDown
      end
      object imgEndingText2: TImage32
        Left = 184
        Top = 96
        Width = 50
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 9
        OnMouseDown = imgEndingText2MouseDown
      end
      object imgEndingText3: TImage32
        Left = 240
        Top = 96
        Width = 50
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 10
        OnMouseDown = imgEndingText3MouseDown
      end
      object imgEndingText4: TImage32
        Left = 296
        Top = 96
        Width = 50
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 11
        OnMouseDown = imgEndingText4MouseDown
      end
      object imgEndingText5: TImage32
        Left = 352
        Top = 96
        Width = 50
        Height = 25
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 12
        OnMouseDown = imgEndingText5MouseDown
      end
    end
  end
end
