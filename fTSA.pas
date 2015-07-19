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

unit fTSA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32, GR32_Layers, GR32_Image, ComCtrls;

type
  TfrmTSAEditor = class(TForm)
    imgTSA: TImage32;
    TSAStatusbar: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure imgTSAMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgTSAMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
  private
    TileX, TileY : Integer;
    { Private declarations }
  public
    procedure DrawPatternTable;  
    { Public declarations }
  end;

var
  frmTSAEditor: TfrmTSAEditor;

implementation

uses uglobal, fStake,fTileEditor,fErasePatRange;

{$R *.dfm}

procedure TfrmTSAEditor.DrawPatternTable();
var
  TSA : TBitmap32;
begin
  TSA := TBitmap32.Create;
  try
    TSA.Width := 128;
    TSA.Height := 128;
    CVROM.DrawPatternTable(TSA,StakeOptions.LastPaletteTSA);
    TSA.FrameRectS(TileX,TileY,TileX+8,TileY + 8,clRed32);
    imgTSA.Bitmap := TSA;
  finally
    FreeAndNil(TSA);
  end;
end;

procedure TfrmTSAEditor.FormShow(Sender: TObject);
begin
  DrawPatternTable();
  frmStake.CurTSABlock := 0;
end;

procedure TfrmTSAEditor.imgTSAMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
var
  Tile : Integer;
  TilEd : Tfrm8x8TileEditor;
  Erase : TfrmErasePatRange;
begin
  if (Button = mbMiddle) or ((ssShift in Shift) and (Button = mbLeft)) then
  begin
    Tile := ((y div 16) * 16 * 16) + ((X div 16) * 16);
    TileX := (X div 16) * 8;
    TileY := (y div 16) * 8;
    //showmessage(IntToStr(Y));
    frmStake.CurTSABlock := Tile div 16;
    DrawPatternTable();
    TilEd := Tfrm8x8TileEditor.Create(self);
    try
      TilEd.TileID := frmStake.CurTSABlock;
      if TilEd.ShowModal = mrOK then
      begin
        CVROM.SavePatternTable();
        DrawPatternTable();
        frmStake.RedrawScreen;
        frmStake.UpdateTitleCaption;
      end;
    finally
      FreeAndNil(TilEd);
    end;
  end
  else if button = mbLeft then
  begin
    Tile := ((y div 16) * 16 * 16) + ((X div 16) * 16);
    TileX := (X div 16) * 8;
    TileY := (y div 16) * 8;
    //showmessage(IntToStr(Y));
    frmStake.CurTSABlock := Tile div 16;
  end
  else if button = mbRight then
  begin
    if ssShift in Shift then
    begin
      Erase := TfrmErasePatRange.Create(self);
      try
        Erase.Mode := 0;
        if Erase.ShowModal = mrOk then
        begin
          CVROM.SavePatternTable();
          DrawPatternTable();
          frmStake.RedrawScreen;
        end;
      finally
        FreeAndNil(Erase);
      end;
    end
    else
    begin
      if StakeOptions.LastPaletteTSA = 3 then
        StakeOptions.LastPaletteTSA := 0
      else
        StakeOptions.LastPaletteTSA := StakeOptions.LastPaletteTSA + 1;
    end;
  end;
  DrawPatternTable();
end;

procedure TfrmTSAEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmStake.CurTSABlock := -1;
  frmStake.UpdateTitleCaption;
  Action := caFree;
end;

procedure TfrmTSAEditor.imgTSAMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  TSAStatusBar.Panels[0].Text := 'Selected: ' + IntToHex(frmStake.CurTSABlock,2);
  TSAStatusBar.Panels[1].Text := IntToHex((((y div 16) * 16 * 16) + ((X div 16) * 16)) div 16,2);
end;

end.
