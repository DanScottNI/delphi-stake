{ License:

Copyright (c) 2004 Dan Scott
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. The name of the author may not be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

}

unit fPalette;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32_Image, GR32, GR32_Layers, ComCtrls;

type
  TfrmPaletteEditor = class(TForm)
    lbl000F: TLabel;
    lbl101F: TLabel;
    lbl202F: TLabel;
    lbl303F: TLabel;
    lblCurrentPalette: TLabel;
    imgNESColours: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    pgcPalettes: TPageControl;
    tshLevelPalettes: TTabSheet;
    tshTitleScreen: TTabSheet;
    tshCastleIntroPalette: TTabSheet;
    lblLevelPalette: TLabel;
    imgLevelPal1: TImage32;
    imgLevelPal2: TImage32;
    imgLevelPal3: TImage32;
    imgLevelPal4: TImage32;
    imgSprPal4: TImage32;
    imgSprPal3: TImage32;
    imgSprPal2: TImage32;
    imgSprPal1: TImage32;
    lblTitleScreenPalette: TLabel;
    imgTitScrBGPal1: TImage32;
    imgTitScrBGPal2: TImage32;
    imgTitScrBGPal3: TImage32;
    imgTitScrBGPal4: TImage32;
    lblCastleIntro: TLabel;
    imgCasBGPal1: TImage32;
    imgCasBGPal2: TImage32;
    imgCasBGPal3: TImage32;
    imgCasBGPal4: TImage32;
    imgTitScrSprPal1: TImage32;
    imgTitScrSprPal2: TImage32;
    imgTitScrSprPal3: TImage32;
    imgTitScrSprPal4: TImage32;
    lblSprPalCasMap: TLabel;
    tshEnding: TTabSheet;
    imgEndingBG1: TImage32;
    imgEndingBG2: TImage32;
    imgEndingBG3: TImage32;
    imgEndingBG4: TImage32;
    imgEndingSpr1: TImage32;
    imgEndingSpr2: TImage32;
    imgEndingSpr3: TImage32;
    imgEndingSpr4: TImage32;
    Label1: TLabel;
    imgEndingText1: TImage32;
    imgEndingText2: TImage32;
    imgEndingText3: TImage32;
    imgEndingText4: TImage32;
    lblTextChangeColours: TLabel;
    imgEndingText5: TImage32;
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgNESColoursMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer; Layer: TCustomLayer);
    procedure imgNESColoursMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelPal1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelPal2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelPal3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelPal4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgSprPal1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgSprPal2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgSprPal3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgSprPal4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgTitScrBGPal1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgTitScrBGPal2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgTitScrBGPal3MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgTitScrBGPal4MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgTitScrSprPal1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgTitScrSprPal2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgTitScrSprPal3MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgTitScrSprPal4MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgCasBGPal1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgCasBGPal2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgCasBGPal3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgCasBGPal4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingBG1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingBG2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingBG3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingBG4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingSpr1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingSpr2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingSpr3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingSpr4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingText1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgEndingText2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgEndingText3MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgEndingText4MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgEndingText5MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
  private
    TileX, TileY : Integer;
    CurColour : Byte;
    procedure DrawNESColours;
    procedure DisplayBGPalette;
    procedure DisplaySprPalette;
    procedure DisplayTitleScrBGPalette;
    procedure DisplayTitleScrSprPalette;
    procedure DisplayCastleMapBGPalette;
    procedure DisplayEndingBGPalette;
    procedure DisplayEndingSprPalette;
    procedure DisplayEndingTextChangePalettes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPaletteEditor: TfrmPaletteEditor;

implementation

uses uglobal, fStake;

{$R *.dfm}

procedure TfrmPaletteEditor.cmdOKClick(Sender: TObject);
begin
  CVROM.SaveCurrentPalette;
  CVROm.SaveSpritePalette;
  CVROM.TitleScreen.SavePalette;
  CVROM.CastleIntro.SavePalette;
  CVROM.Ending.SavePalette;
end;

procedure TfrmPaletteEditor.cmdCancelClick(Sender: TObject);
begin
  CVROm.LoadSpritePalette;
  CVROM.TitleScreen.LoadPalette;
  CVROM.CastleIntro.LoadPalette;
  CVROM.Ending.LoadPalette;
  CVROM.LoadCurrentPalette;
  frmStake.RedrawScreen;
end;

procedure TfrmPaletteEditor.DrawNESColours();
var
  i,x : Integer;
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 287;
    TempBitmap.Height := 74;

    for i := 0 to 3 do
      for x :=0 to 15 do
        TempBitmap.FillRect(x*18,i*18 + 1,(x*18)+17,i*18+18,CVROM.ReturnColor32NESPal((i*16) + x));

    tempbitmap.Line(0,0,0,74, clBlack32);


    if TileX = 0 then
      TempBitmap.FrameRectS(TileX,TileY,TileX+18,TileY+19,clRed32)

    else
      TempBitmap.FrameRectS(TileX-1,TileY,TileX+18,TileY+19,clRed32);

    imgNESColours.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmPaletteEditor.DisplayBGPalette();
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;
      imgLevelPal1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Palette[0,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgLevelPal1.Hint := imgLevelPal1.Hint + '$' + IntToHex(CVROM.Palette[0,i],2)  + ' ';
      end;
      imgLevelPal1.Hint := TrimRight(imgLevelPal1.Hint);
      imgLevelPal1.Bitmap := TempBitmap;


      imgLevelPal2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Palette[1,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgLevelPal2.Hint := imgLevelPal2.Hint + '$' + IntToHex(CVROM.Palette[1,i],2)  + ' ';
      end;
      imgLevelPal2.Hint := TrimRight(imgLevelPal2.Hint);
      imgLevelPal2.Bitmap := TempBitmap;

      imgLevelPal3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Palette[2,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgLevelPal3.Hint := imgLevelPal3.Hint + '$' + IntToHex(CVROM.Palette[2,i],2)  + ' ';
      end;
      imgLevelPal3.Hint := TrimRight(imgLevelPal3.Hint);
      imgLevelPal3.Bitmap := TempBitmap;

      imgLevelPal4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Palette[3,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgLevelPal4.Hint := imgLevelPal4.Hint + '$' + IntToHex(CVROM.Palette[3,i],2)  + ' ';
      end;
      imgLevelPal4.Hint := TrimRight(imgLevelPal4.Hint);
      imgLevelPal4.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmPaletteEditor.DisplaySprPalette();
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;

      imgSprPal1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Palette[4,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgSprPal1.Hint := imgSprPal1.Hint + '$' + IntToHex(CVROM.Palette[4,i],2)  + ' ';
      end;
      imgSprPal1.Hint := TrimRight(imgSprPal1.Hint);
      imgSprPal1.Bitmap := TempBitmap;

      imgSprPal2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Palette[5,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgSprPal2.Hint := imgSprPal2.Hint + '$' + IntToHex(CVROM.Palette[5,i],2)  + ' ';
      end;
      imgSprPal2.Hint := TrimRight(imgSprPal2.Hint);
      imgSprPal2.Bitmap := TempBitmap;

      imgSprPal3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Palette[6,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgSprPal3.Hint := imgSprPal3.Hint + '$' + IntToHex(CVROM.Palette[6,i],2)  + ' ';
      end;
      imgSprPal3.Hint := TrimRight(imgSprPal3.Hint);
      imgSprPal3.Bitmap := TempBitmap;

      imgSprPal4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Palette[7,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgSprPal4.Hint := imgSprPal4.Hint + '$' + IntToHex(CVROM.Palette[7,i],2)  + ' ';
      end;
      imgSprPal4.Hint := TrimRight(imgSprPal4.Hint);
      imgSprPal4.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmPaletteEditor.DisplayTitleScrSprPalette();
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;

      imgTitScrSprPal1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[4,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgTitScrSprPal1.Hint := imgTitScrSprPal1.Hint + '$' + IntToHex(CVROM.TitleScreen.Palette[4,i],2)  + ' ';
      end;
      imgTitScrSprPal1.Hint := TrimRight(imgTitScrSprPal1.Hint);
      imgTitScrSprPal1.Bitmap := TempBitmap;

      imgTitScrSprPal2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[5,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgTitScrSprPal2.Hint := imgTitScrSprPal2.Hint + '$' + IntToHex(CVROM.TitleScreen.Palette[5,i],2)  + ' ';
      end;
      imgTitScrSprPal2.Hint := TrimRight(imgTitScrSprPal2.Hint);
      imgTitScrSprPal2.Bitmap := TempBitmap;

      imgTitScrSprPal3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[6,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgTitScrSprPal3.Hint := imgTitScrSprPal3.Hint + '$' + IntToHex(CVROM.TitleScreen.Palette[6,i],2)  + ' ';
      end;
      imgTitScrSprPal3.Hint := TrimRight(imgTitScrSprPal3.Hint);
      imgTitScrSprPal3.Bitmap := TempBitmap;

      imgTitScrSprPal4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[7,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgTitScrSprPal4.Hint := imgTitScrSprPal4.Hint + '$' + IntToHex(CVROM.TitleScreen.Palette[7,i],2)  + ' ';
      end;
      imgTitScrSprPal4.Hint := TrimRight(imgTitScrSprPal4.Hint);
      imgTitScrSprPal4.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;
end;


procedure TfrmPaletteEditor.DisplayTitleScrBGPalette();
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;

      imgTitScrBGPal1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[0,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgTitScrBGPal1.Hint := imgTitScrBGPal1.Hint + '$' + IntToHex(CVROM.TitleScreen.Palette[0,i],2)  + ' ';
      end;
      imgTitScrBGPal1.Hint := TrimRight(imgTitScrBGPal1.Hint);
      imgTitScrBGPal1.Bitmap := TempBitmap;

      imgTitScrBGPal2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[1,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgTitScrBGPal2.Hint := imgTitScrBGPal2.Hint + '$' + IntToHex(CVROM.TitleScreen.Palette[1,i],2)  + ' ';
      end;
      imgTitScrBGPal2.Hint := TrimRight(imgTitScrBGPal2.Hint);
      imgTitScrBGPal2.Bitmap := TempBitmap;

      imgTitScrBGPal3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[2,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgTitScrBGPal3.Hint := imgTitScrBGPal3.Hint + '$' + IntToHex(CVROM.TitleScreen.Palette[2,i],2)  + ' ';
      end;
      imgTitScrBGPal3.Hint := TrimRight(imgSprPal3.Hint);
      imgTitScrBGPal3.Bitmap := TempBitmap;

      imgTitScrBGPal4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[3,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgTitScrBGPal4.Hint := imgTitScrBGPal4.Hint + '$' + IntToHex(CVROM.TitleScreen.Palette[3,i],2)  + ' ';
      end;
      imgTitScrBGPal4.Hint := TrimRight(imgTitScrBGPal4.Hint);
      imgTitScrBGPal4.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmPaletteEditor.DisplayCastleMapBGPalette();
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;

      imgCasBGPal1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.CastleIntro.Palette[0,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgCasBGPal1.Hint := imgCasBGPal1.Hint + '$' + IntToHex(CVROM.CastleIntro.Palette[0,i],2)  + ' ';
      end;
      imgCasBGPal1.Hint := TrimRight(imgCasBGPal1.Hint);
      imgCasBGPal1.Bitmap := TempBitmap;

      imgCasBGPal2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.CastleIntro.Palette[1,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgCasBGPal2.Hint := imgCasBGPal2.Hint + '$' + IntToHex(CVROM.CastleIntro.Palette[1,i],2)  + ' ';
      end;
      imgCasBGPal2.Hint := TrimRight(imgCasBGPal2.Hint);
      imgCasBGPal2.Bitmap := TempBitmap;

      imgCasBGPal3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.CastleIntro.Palette[2,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgCasBGPal3.Hint := imgCasBGPal3.Hint + '$' + IntToHex(CVROM.CastleIntro.Palette[2,i],2)  + ' ';
      end;
      imgCasBGPal3.Hint := TrimRight(imgCasBGPal3.Hint);
      imgCasBGPal3.Bitmap := TempBitmap;

      imgCasBGPal4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.CastleIntro.Palette[3,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgCasBGPal4.Hint := imgCasBGPal4.Hint + '$' + IntToHex(CVROM.CastleIntro.Palette[3,i],2)  + ' ';
      end;
      imgCasBGPal4.Hint := TrimRight(imgCasBGPal4.Hint);
      imgCasBGPal4.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;
end;


procedure TfrmPaletteEditor.FormShow(Sender: TObject);
begin
  CVROM.LoadSpritePalette;
  CVROM.TitleScreen.LoadPalette;
  CVROM.CastleIntro.LoadPalette;
  CVROM.Ending.LoadPalette;
  DrawNESColours();
  DisplayBGPalette();
  DisplaySprPalette();
  DisplayTitleScrBGPalette();
  DisplayTitleScrSprPalette();
  DisplayCastleMapBGPalette();
  DisplayEndingBGPalette;
  DisplayEndingSprPalette;
  DisplayEndingTextChangePalettes;
end;

procedure TfrmPaletteEditor.imgNESColoursMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  lblCurrentPalette.Caption := 'Current Palette Colour: $' + IntToHex(((X div 18) + (Y div 18) * 16),2);
end;

procedure TfrmPaletteEditor.imgNESColoursMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CurColour := ((X div 18) + (Y div 18) * 16);
  TileX := (X div 18) * 18;
  TileY := (y div 18) * 18;
  DrawNESColours();
end;

procedure TfrmPaletteEditor.imgLevelPal1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Palette[0, x div 25] := CurColour;
  DisplayBGPalette();
  frmStake.RedrawScreen();
end;

procedure TfrmPaletteEditor.imgLevelPal2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Palette[1, x div 25] := CurColour;
  DisplayBGPalette();
  frmStake.RedrawScreen();
end;

procedure TfrmPaletteEditor.imgLevelPal3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Palette[2, x div 25] := CurColour;
  DisplayBGPalette();
  frmStake.RedrawScreen();
end;

procedure TfrmPaletteEditor.imgLevelPal4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Palette[3, x div 25] := CurColour;
  DisplayBGPalette();
  frmStake.RedrawScreen();
end;

procedure TfrmPaletteEditor.imgSprPal1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Palette[4, x div 25] := CurColour;
  DisplaySprPalette();
end;

procedure TfrmPaletteEditor.imgSprPal2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Palette[5, x div 25] := CurColour;
  DisplaySprPalette();
end;

procedure TfrmPaletteEditor.imgSprPal3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Palette[6, x div 25] := CurColour;
  DisplaySprPalette();
end;

procedure TfrmPaletteEditor.imgSprPal4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Palette[7, x div 25] := CurColour;
  DisplaySprPalette();
end;

procedure TfrmPaletteEditor.imgTitScrBGPal1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.TitleScreen.Palette[0, x div 25] := CurColour;
  DisplayTitleScrBGPalette();
end;

procedure TfrmPaletteEditor.imgTitScrBGPal2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.TitleScreen.Palette[1, x div 25] := CurColour;
  DisplayTitleScrBGPalette();
end;

procedure TfrmPaletteEditor.imgTitScrBGPal3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.TitleScreen.Palette[2, x div 25] := CurColour;
  DisplayTitleScrBGPalette();
end;

procedure TfrmPaletteEditor.imgTitScrBGPal4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.TitleScreen.Palette[3, x div 25] := CurColour;
  DisplayTitleScrBGPalette();
end;

procedure TfrmPaletteEditor.imgTitScrSprPal1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.TitleScreen.Palette[4, x div 25] := CurColour;
  DisplayTitleScrSprPalette();
end;

procedure TfrmPaletteEditor.imgTitScrSprPal2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.TitleScreen.Palette[5, x div 25] := CurColour;
  DisplayTitleScrSprPalette();
end;

procedure TfrmPaletteEditor.imgTitScrSprPal3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.TitleScreen.Palette[6, x div 25] := CurColour;
  DisplayTitleScrSprPalette();
end;

procedure TfrmPaletteEditor.imgTitScrSprPal4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.TitleScreen.Palette[7, x div 25] := CurColour;
  DisplayTitleScrSprPalette();
end;

procedure TfrmPaletteEditor.imgCasBGPal1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.CastleIntro.Palette[0, x div 25] := CurColour;
  DisplayCastleMapBGPalette();
end;

procedure TfrmPaletteEditor.imgCasBGPal2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.CastleIntro.Palette[1, x div 25] := CurColour;
  DisplayCastleMapBGPalette();
end;

procedure TfrmPaletteEditor.imgCasBGPal3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.CastleIntro.Palette[2, x div 25] := CurColour;
  DisplayCastleMapBGPalette();
end;

procedure TfrmPaletteEditor.imgCasBGPal4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.CastleIntro.Palette[3, x div 25] := CurColour;
  DisplayCastleMapBGPalette();
end;

procedure TfrmPaletteEditor.DisplayEndingBGPalette;
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;

      imgEndingBG1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[0,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingBG1.Hint := imgEndingBG1.Hint + '$' + IntToHex(CVROM.Ending.Palette[0,i],2)  + ' ';
      end;
      imgEndingBG1.Hint := TrimRight(imgEndingBG1.Hint);
      imgEndingBG1.Bitmap := TempBitmap;

      imgEndingBG2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[1,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingBG2.Hint := imgEndingBG2.Hint + '$' + IntToHex(CVROM.Ending.Palette[1,i],2)  + ' ';
      end;
      imgEndingBG2.Hint := TrimRight(imgEndingBG2.Hint);
      imgEndingBG2.Bitmap := TempBitmap;

      imgEndingBG3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[2,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingBG3.Hint := imgEndingBG3.Hint + '$' + IntToHex(CVROM.Ending.Palette[2,i],2)  + ' ';
      end;
      imgEndingBG3.Hint := TrimRight(imgEndingBG3.Hint);
      imgEndingBG3.Bitmap := TempBitmap;

      imgEndingBG4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[3,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingBG4.Hint := imgEndingBG4.Hint + '$' + IntToHex(CVROM.Ending.Palette[3,i],2)  + ' ';
      end;
      imgEndingBG4.Hint := TrimRight(imgEndingBG4.Hint);
      imgEndingBG4.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;

end;

procedure TfrmPaletteEditor.DisplayEndingSprPalette;
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;

      imgEndingSpr1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[4,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingSpr1.Hint := imgEndingSpr1.Hint + '$' + IntToHex(CVROM.Ending.Palette[4,i],2)  + ' ';
      end;
      imgEndingSpr1.Hint := TrimRight(imgEndingSpr1.Hint);
      imgEndingSpr1.Bitmap := TempBitmap;

      imgEndingSpr2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[5,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingSpr2.Hint := imgEndingSpr2.Hint + '$' + IntToHex(CVROM.Ending.Palette[5,i],2)  + ' ';
      end;
      imgEndingSpr2.Hint := TrimRight(imgEndingSpr2.Hint);
      imgEndingSpr2.Bitmap := TempBitmap;

      imgEndingSpr3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[6,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingSpr3.Hint := imgEndingSpr3.Hint + '$' + IntToHex(CVROM.Ending.Palette[6,i],2)  + ' ';
      end;
      imgEndingSpr3.Hint := TrimRight(imgEndingSpr3.Hint);
      imgEndingSpr3.Bitmap := TempBitmap;

      imgEndingSpr4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[7,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingSpr4.Hint := imgEndingSpr4.Hint + '$' + IntToHex(CVROM.Ending.Palette[7,i],2)  + ' ';
      end;
      imgEndingSpr4.Hint := TrimRight(imgEndingSpr4.Hint);
      imgEndingSpr4.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;


end;

procedure TfrmPaletteEditor.DisplayEndingTextChangePalettes;
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;

      imgEndingText1.Hint := '';
      for i := 0 to 1 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.TextPalette[0,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingText1.Hint := imgEndingText1.Hint + '$' + IntToHex(CVROM.Ending.TextPalette[0,i],2)  + ' ';
      end;
      imgEndingText1.Hint := TrimRight(imgEndingText1.Hint);
      imgEndingText1.Bitmap := TempBitmap;

      imgEndingText2.Hint := '';
      for i := 0 to 1 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.TextPalette[1,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingText2.Hint := imgEndingText2.Hint + '$' + IntToHex(CVROM.Ending.TextPalette[1,i],2)  + ' ';
      end;
      imgEndingText2.Hint := TrimRight(imgEndingText2.Hint);
      imgEndingText2.Bitmap := TempBitmap;

      imgEndingText3.Hint := '';
      for i := 0 to 1 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.TextPalette[2,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingText3.Hint := imgEndingText3.Hint + '$' + IntToHex(CVROM.Ending.TextPalette[2,i],2)  + ' ';
      end;
      imgEndingText3.Hint := TrimRight(imgEndingText3.Hint);
      imgEndingText3.Bitmap := TempBitmap;

      imgEndingText4.Hint := '';
      for i := 0 to 1 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.TextPalette[3,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingText4.Hint := imgEndingText4.Hint + '$' + IntToHex(CVROM.Ending.TextPalette[3,i],2)  + ' ';
      end;
      imgEndingText4.Hint := TrimRight(imgEndingText4.Hint);
      imgEndingText4.Bitmap := TempBitmap;

      imgEndingText5.Hint := '';
      for i := 0 to 1 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.TextPalette[4,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgEndingText5.Hint := imgEndingText5.Hint + '$' + IntToHex(CVROM.Ending.TextPalette[4,i],2)  + ' ';
      end;
      imgEndingText5.Hint := TrimRight(imgEndingText5.Hint);
      imgEndingText5.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;

end;

procedure TfrmPaletteEditor.imgEndingBG1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.Palette[0, x div 25] := CurColour;
  DisplayEndingBGPalette();
end;

procedure TfrmPaletteEditor.imgEndingBG2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.Palette[1, x div 25] := CurColour;
  DisplayEndingBGPalette();
end;

procedure TfrmPaletteEditor.imgEndingBG3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.Palette[2, x div 25] := CurColour;
  DisplayEndingBGPalette();
end;

procedure TfrmPaletteEditor.imgEndingBG4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.Palette[3, x div 25] := CurColour;
  DisplayEndingBGPalette();
end;

procedure TfrmPaletteEditor.imgEndingSpr1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.Palette[4, x div 25] := CurColour;
  DisplayEndingSprPalette();
end;

procedure TfrmPaletteEditor.imgEndingSpr2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.Palette[5, x div 25] := CurColour;
  DisplayEndingSprPalette();
end;

procedure TfrmPaletteEditor.imgEndingSpr3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.Palette[6, x div 25] := CurColour;
  DisplayEndingSprPalette();
end;

procedure TfrmPaletteEditor.imgEndingSpr4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.Palette[7, x div 25] := CurColour;
  DisplayEndingSprPalette();
end;

procedure TfrmPaletteEditor.imgEndingText1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.TextPalette[0, x div 25] := CurColour;
  DisplayEndingTextChangePalettes();
end;

procedure TfrmPaletteEditor.imgEndingText2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.TextPalette[1, x div 25] := CurColour;
  DisplayEndingTextChangePalettes();
end;

procedure TfrmPaletteEditor.imgEndingText3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.TextPalette[2, x div 25] := CurColour;
  DisplayEndingTextChangePalettes();
end;

procedure TfrmPaletteEditor.imgEndingText4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.TextPalette[3, x div 25] := CurColour;
  DisplayEndingTextChangePalettes();
end;

procedure TfrmPaletteEditor.imgEndingText5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.TextPalette[4, x div 25] := CurColour;
  DisplayEndingTextChangePalettes();
end;

end.
