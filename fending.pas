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

unit fending;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32_Image, GR32_layers, gr32;

type
  TfrmEndingEditor = class(TForm)
    lblCompressedDataSize: TLabel;
    lblWarnings: TLabel;
    lblCurTile: TLabel;
    imgTitleScreen: TImage32;
    imgTSA: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    chkViewGridlines: TCheckBox;
    cmdEditText: TButton;
    procedure FormCreate(Sender: TObject);
    procedure imgTitleScreenMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgTitleScreenMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer; Layer: TCustomLayer);
    procedure imgTSAMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgTitleScreenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure cmdOKClick(Sender: TObject);
    procedure chkViewGridlinesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmdEditTextClick(Sender: TObject);
    procedure imgTSAMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
  private
    TitleScr : TBitmap32;
    TileX, TileY, Tile : Integer;
    procedure DrawGridlines;
    procedure DrawPatternTable;
    procedure DrawTitleScreen;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEndingEditor: TfrmEndingEditor;

implementation

uses uglobal, fTileEditor, fendingtext,fErasePatRange;

{$R *.dfm}

procedure TfrmEndingEditor.DrawGridlines;
var
  i : Integer;
begin
  for i := 1 to 31 do
    TitleScr.Line(i*8,0,i*8,titlescr.Height,clWhite32);

  for i := 1 to 29 do
    TitleScr.Line(0,i*8,titlescr.Width,i*8,clWhite32);

end;

procedure TfrmEndingEditor.DrawPatternTable;
var
  PatternTable : TBitmap32;
begin
  PatternTable := TBitmap32.Create;
  try
    PatternTable.Width := 128;
    PatternTable.Height := 128;
    CVROM.Ending.DrawPatternTable(PatternTable,StakeOptions.LastPaletteEnding);
    PatternTable.FrameRectS(TileX,TileY,TileX+8,TileY + 8,clRed32);
    imgTSA.Bitmap := PatternTable;
  finally
    FreeAndNil(PatternTable);
  end;

end;

procedure TfrmEndingEditor.DrawTitleScreen;
begin
  TitleScr.Height := 240;
  TitleScr.Width := 256;
  CVROM.Ending.Draw(TitleScr);
  if chkViewGridlines.Checked = true then
    DrawGridlines();
  imgTitleScreen.Bitmap := TitleScr;

end;

procedure TfrmEndingEditor.FormCreate(Sender: TObject);
begin
  CVROM.Ending.LoadPatternTable;
  CVROM.Ending.LoadPalette;
  CVROM.Ending.LoadCompressedData;
  CVROM.Ending.DecompressData;
  titlescr := TBitmap32.Create;
  DrawTitleScreen;
  DrawPatternTable();
  chkViewGridlines.Checked := StakeOptions.GridlinesOn;
  lblCompressedDataSize.Caption := 'Compressed Data Size: ' + IntToStr(CVROM.Ending.CompressedDataSize) + '/' + IntToStr(CVROM.Ending.OriginalCompressedSize) + ' bytes';
end;

procedure TfrmEndingEditor.imgTitleScreenMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if ((X >= 0) and (X <= imgTitleScreen.Width)) and ((Y >= 0) and (Y <= imgTitleScreen.Height)) then
  begin

    if button = mbLeft then
    begin
      if Tile = $D4 then
      begin
        showmessage('You cannot use this tile. It is the RLE start byte. Using it may have unpredictable effects.');
        exit;
      end
      else if Tile = $D9 then
      begin
        showmessage('You cannot use this tile. It is the title screen end marker.');
        exit;
      end;
      CVROM.Ending.Edit((x div 2) div 8,(y div 2) div 8,Tile);
      CVROM.Ending.DrawOneTileTitle(TitleScr,(X div 2) div 8,(Y div 2) div 8);
      if chkViewGridlines.Checked = true then
        DrawGridlines();
      imgTitleScreen.Bitmap := TitleScr;
    end
    else
    begin
      CVROM.Ending.IncrementAttribute((x div 2) div 8,(y div 2) div 8);
      if chkViewGridlines.Checked = true then
        DrawGridlines();
      drawtitlescreen;
    end;
  end;

end;

procedure TfrmEndingEditor.imgTitleScreenMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if ((X >= 0) and (X <= imgTitleScreen.Width)) and ((Y >= 0) and (Y <= imgTitleScreen.Height)) then
  begin
    lblCurTile.Caption := 'Current Tile: ' + IntToHex(CVROM.Ending.GetTitleScreenTile((x div 2) div 8,(y div 2) div 8),2);
    if ssLeft in Shift then
    begin
      if Tile = $D4 then
      begin
        showmessage('You cannot use this tile. It is the RLE start byte. Using it may have unpredictable effects.');
        exit;
      end
      else if Tile = $D9 then
      begin
        showmessage('You cannot use this tile. It is the title screen end marker.');
        exit;
      end;
      CVROM.Ending.Edit((x div 2) div 8,(y div 2) div 8,Tile);
      CVROM.Ending.DrawOneTileTitle(TitleScr,(X div 2) div 8,(Y div 2) div 8);
      if chkViewGridlines.Checked = true then
        DrawGridlines();
      imgTitleScreen.Bitmap := TitleScr;
    end;
  end;
end;

procedure TfrmEndingEditor.imgTSAMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
var
  TilEd : Tfrm8x8TileEditor;
  Erase : TfrmErasePatRange;
begin
  if (Button = mbMiddle) or ((ssShift in Shift) and (Button = mbLeft)) then
  begin
    Tile := (((y div 16) * 16 * 16) + ((X div 16) * 16)) div 16;
    TileX := (X div 16) * 8;
    TileY := (y div 16) * 8;
    //showmessage(IntToStr(Y));
    DrawPatternTable();
    TilEd := Tfrm8x8TileEditor.Create(self);
    try
      TilEd.TileID := Tile;
      TilEd.pMode := 3;
      TilEd.ShowModal;
      if TilEd.ModalResult = mrOK then
      begin
        CVROM.Ending.SavePatternTable;
        DrawTitleScreen();
      end;
    finally
      FreeAndNil(TilEd);
    end;
  end
  else if button = mbLeft then
  begin
    Tile := (((y div 16) * 16 * 16) + ((X div 16) * 16)) div 16;
    TileX := (X div 16) * 8;
    TileY := (y div 16) * 8;
  end
  else if button = mbRight then
  begin
    if ssShift in Shift then
    begin
      Erase := TfrmErasePatRange.Create(self);
      try
        Erase.Mode := 3;
        if Erase.ShowModal = mrOk then
        begin
          CVROM.Ending.SavePatternTable();
          DrawPatternTable();
          DrawTitleScreen;
        end;
      finally
        FreeAndNil(Erase);
      end;
    end
    else
    begin
      if StakeOptions.LastPaletteEnding = 3 then
        StakeOptions.LastPaletteEnding := 0
      else
        StakeOptions.LastPaletteEnding := StakeOptions.LastPaletteEnding +1;
    end;
  end;
  DrawPatternTable();

end;

procedure TfrmEndingEditor.imgTitleScreenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.CompressData;
  if CVROM.Ending.CompressedDataSize > CVROM.Ending.OriginalCompressedSize then
    lblCompressedDataSize.Font.Color := clRed
  else
    lblCompressedDataSize.Font.Color := clBlack;
  lblCompressedDataSize.Caption := 'Compressed Data Size: ' + IntToStr(CVROM.Ending.CompressedDataSize) + '/' + IntToStr(CVROM.Ending.OriginalCompressedSize) + ' bytes';
end;

procedure TfrmEndingEditor.cmdOKClick(Sender: TObject);
begin
  CVROM.Ending.CompressData;
  if CVROM.Ending.SaveCompressedData() = false then
  begin
    modalresult := mrNone;
  end;
end;

procedure TfrmEndingEditor.chkViewGridlinesClick(Sender: TObject);
begin
DrawTitleScreen();
end;

procedure TfrmEndingEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(TitleScr);
end;

procedure TfrmEndingEditor.cmdEditTextClick(Sender: TObject);
var
  endingtext : TfrmEndingTextEditor;
begin
  endingtext := TfrmEndingTextEditor.Create(self);
  try
    endingtext.ShowModal;
  finally
    FreeAndNil(EndingText);
  end;
end;

procedure TfrmEndingEditor.imgTSAMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  lblCurTile.Caption := 'Current Tile: ' + IntToHex((((y div 16) * 16 * 16) + ((X div 16) * 16)) div 16,2);
end;

end.
