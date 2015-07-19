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

unit fTileEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32, GR32_Image, GR32_layers,StdCtrls, ctitlescreen;

type
  Tfrm8x8TileEditor = class(TForm)
    imgTile: TImage32;
    imgAvailPal: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure imgTileMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgTileMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure imgAvailPalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure cmdOKClick(Sender: TObject);
  private
    SelPalLeft,SelPalRight : Byte;
    procedure Draw8x8Tile;
    procedure DisplayPalette;
    { Private declarations }
  public
    pMode : Byte;
    TileID : Integer;
    { Public declarations }
  end;

var
  frm8x8TileEditor: Tfrm8x8TileEditor;
  DaTile : T8x8Graphic;

implementation

uses uglobal;

{$R *.dfm}
const
  LEVEL : Byte = 0;
  TITLESCREEN : Byte = 1;
  INTRO : Byte = 2;
  ENDING : Byte = 3;

procedure Tfrm8x8TileEditor.FormShow(Sender: TObject);
begin
  if pMode = LEVEL then
  begin
    DaTile := CVROM.Export8x8Pat(TileID);
  end
  else if pMode = TITLESCREEN then
  begin
    DaTile := CVROM.TitleScreen.Export8x8Pat(TileID);
    CVROM.TitleScreen.LoadPalette;
  end
  else if pMode = INTRO then
  begin
    DaTile := CVROM.CastleIntro.Export8x8Pat(TileID);
    CVROM.CastleIntro.LoadPalette;
  end
  else if pMode = ENDING then
  begin
    DaTile := CVROM.Ending.Export8x8Pat(TileID);
    CVROM.Ending.LoadPalette;
  end;


  //  showmessage(IntToStr(DaTile.Pixels[0,0]));
  Draw8x8Tile();
  DisplayPalette();
end;

procedure Tfrm8x8TileEditor.DisplayPalette();
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 100;
    TempBitmap.Height := 25;
    if pMode = LEVEL then
    begin
      TempBitmap.FillRect(0,0,25,25, CVROM.ReturnColor32NESPal(CVROM.Palette[StakeOptions.LastPaletteTileEditor,0]));
      TempBitmap.FillRect(25,0,50,25, CVROM.ReturnColor32NESPal(CVROM.Palette[StakeOptions.LastPaletteTileEditor,1]));
      TempBitmap.FillRect(50,0,75,25, CVROM.ReturnColor32NESPal(CVROM.Palette[StakeOptions.LastPaletteTileEditor,2]));
      TempBitmap.FillRect(75,0,100,25, CVROM.ReturnColor32NESPal(CVROM.Palette[StakeOptions.LastPaletteTileEditor,3]));
    end
    else if pMode = TITLESCREEN then
    begin
      TempBitmap.FillRect(0,0,25,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[StakeOptions.LastPaletteTileEditor,0]));
      TempBitmap.FillRect(25,0,50,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[StakeOptions.LastPaletteTileEditor,1]));
      TempBitmap.FillRect(50,0,75,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[StakeOptions.LastPaletteTileEditor,2]));
      TempBitmap.FillRect(75,0,100,25, CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[StakeOptions.LastPaletteTileEditor,3]));
    end
    else if pMode = INTRO then
    begin
      TempBitmap.FillRect(0,0,25,25, CVROM.ReturnColor32NESPal(CVROM.CastleIntro.Palette[StakeOptions.LastPaletteTileEditor,0]));
      TempBitmap.FillRect(25,0,50,25, CVROM.ReturnColor32NESPal(CVROM.CastleIntro.Palette[StakeOptions.LastPaletteTileEditor,1]));
      TempBitmap.FillRect(50,0,75,25, CVROM.ReturnColor32NESPal(CVROM.CastleIntro.Palette[StakeOptions.LastPaletteTileEditor,2]));
      TempBitmap.FillRect(75,0,100,25, CVROM.ReturnColor32NESPal(CVROM.CastleIntro.Palette[StakeOptions.LastPaletteTileEditor,3]));
    end
    else if pMode = ENDING then
    begin
      TempBitmap.FillRect(0,0,25,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[StakeOptions.LastPaletteTileEditor,0]));
      TempBitmap.FillRect(25,0,50,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[StakeOptions.LastPaletteTileEditor,1]));
      TempBitmap.FillRect(50,0,75,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[StakeOptions.LastPaletteTileEditor,2]));
      TempBitmap.FillRect(75,0,100,25, CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[StakeOptions.LastPaletteTileEditor,3]));
    end;
    TempBitmap.FrameRectS(SelPalLeft * 25,0,SelPalLeft * 25 + 25,25,clRed32);
    TempBitmap.FrameRectS(SelPalRight * 25,0,SelPalRight * 25 + 25,25,clAqua32);
    imgAvailPal.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure Tfrm8x8TileEditor.Draw8x8Tile();
var
  i,x : Integer;
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 8;
    TempBitmap.Height := 8;
    if pMode = LEVEL then
    begin
      for x := 0 to 7 do
        for i := 0 to 7 do
          TempBitmap.Pixel[x,i] := CVROM.ReturnColor32NESPal(CVROM.Palette[StakeOptions.LastPaletteTileEditor,DaTile.Pixels[i,x]]);
    end
    else if pMode = TITLESCREEN then
    begin
      for x := 0 to 7 do
        for i := 0 to 7 do
          TempBitmap.Pixel[x,i] := CVROM.ReturnColor32NESPal(CVROM.TitleScreen.Palette[StakeOptions.LastPaletteTileEditor,DaTile.Pixels[i,x]]);
    end
    else if pMode = INTRO then
    begin
      for x := 0 to 7 do
        for i := 0 to 7 do
          TempBitmap.Pixel[x,i] := CVROM.ReturnColor32NESPal(CVROM.CastleIntro.Palette[StakeOptions.LastPaletteTileEditor,DaTile.Pixels[i,x]]);
    end
    else if pMode = ENDING then
    begin
      for x := 0 to 7 do
        for i := 0 to 7 do
          TempBitmap.Pixel[x,i] := CVROM.ReturnColor32NESPal(CVROM.Ending.Palette[StakeOptions.LastPaletteTileEditor,DaTile.Pixels[i,x]]);
    end;
    imgTile.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure Tfrm8x8TileEditor.imgTileMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if Button = mbLeft then
  begin
    if (y div 20 > 7) or (x div 20 > 7) then exit;
    DaTile.Pixels[Y div 20,X div 20] := SelPalLeft;
    Draw8x8Tile();
  end
  else if Button = mbRight then
  begin
    if (y div 20 > 7) or (x div 20 > 7) then exit;
    DaTile.Pixels[Y div 20,X div 20] := SelPalRight;
    Draw8x8Tile();
  end;
end;

procedure Tfrm8x8TileEditor.imgTileMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if ssLeft in Shift then
  begin
    if (y div 20 > 7) or (x div 20 > 7) then exit;
    DaTile.Pixels[Y div 20,X div 20] := SelPalLeft;
    Draw8x8Tile();
  end
  else if ssRight in Shift then
  begin
    if (y div 20 > 7) or (x div 20 > 7) then exit;
    DaTile.Pixels[Y div 20,X div 20] := SelPalRight;
    Draw8x8Tile();
  end
end;

procedure Tfrm8x8TileEditor.imgAvailPalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if (Button = mbMiddle) or ((Button = mbLeft) and (ssShift in Shift)) then
  begin
    if StakeOptions.LastPaletteTileEditor = 3 then
      StakeOptions.LastPaletteTileEditor := 0
    else
      StakeOptions.LastPaletteTileEditor := StakeOptions.LastPaletteTileEditor +1;

    DisplayPalette;
    Draw8x8Tile();
  end
  else if button = mbLeft then
  begin
    SelPalLeft := X div 25;
    DisplayPalette();
  end
  else if button = mbRight then
  begin
    SelPalRight := X div 25;
    DisplayPalette();
  end
end;

procedure Tfrm8x8TileEditor.cmdOKClick(Sender: TObject);
begin
  if pMode = LEVEL then
    CVROM.Import8x8Pat(TileID,DaTile)
  else if pMode = TITLESCREEN then
    CVROM.TitleScreen.Import8x8Pat(TileID,DaTile)
  else if pMode = INTRO then
    CVROM.CastleIntro.Import8x8Pat(TileID,DaTile)
  else if pMode = ENDING then
    CVROM.Ending.Import8x8Pat(TileID,DaTile);
end;

end.
