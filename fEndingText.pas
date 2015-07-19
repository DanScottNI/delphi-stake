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

unit fEndingText;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32_Image, GR32, gr32_layers;

type
  TfrmEndingTextEditor = class(TForm)
    lblTextOffsets: TLabel;
    cbTextOffsets: TComboBox;
    cmdOk: TButton;
    cmdCancel: TButton;
    imgEndingText: TImage32;
    imgTSA: TImage32;
    imgEndingText1: TImage32;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTextOffsetsChange(Sender: TObject);
    procedure imgTSAMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure cmdOkClick(Sender: TObject);
    procedure imgEndingTextMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgEndingText1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
  private
    EndingTextBit1,EndingTextBit2 : TBitmap32;
    TileX, TileY, Tile : Integer;
    procedure LoadEndingNames;
    procedure DrawPatternTable;
    procedure DrawEndingText;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEndingTextEditor: TfrmEndingTextEditor;

implementation

uses uglobal, fTileEditor;

{$R *.dfm}

procedure TfrmEndingTextEditor.FormCreate(Sender: TObject);
begin
  CVROM.Ending.LoadEndingData(0);
  LoadEndingNames();
  EndingTextBit1 := TBitmap32.Create;
  EndingTextBit1.Width := 128;
  EndingTextBit1.Height := 64;

  EndingTextBit2 := TBitmap32.Create;
  EndingTextBit2.Width := 128;
  EndingTextBit2.Height :=64;
  DrawEndingText();
  DrawPatternTable;
end;

procedure TfrmEndingTextEditor.LoadEndingNames();
var
  i : Integer;
begin
  cbTextOffsets.Items.Clear;
  for i := 0 to CVROM.Ending.NumberOfText - 1 do
  begin
    cbTextOffsets.Items.Add('Text ' + IntToStr(i+1) + ': $' + CVROM.Ending.GetEndingTextName(i));
  end;

  cbTextOffsets.ItemIndex := 0;
end;

procedure TfrmEndingTextEditor.DrawEndingText();
begin
  CVROM.Ending.DrawEndingTextBuffer(EndingTextBit1,EndingTextBit2);
  imgEndingText.Bitmap := EndingTextBit1;
  imgEndingText1.Bitmap := EndingTextBit2;
//  endingtextbit2.SaveToFile('c:\test.bmp'); 
end;

procedure TfrmEndingTextEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(EndingTextBit1);
  FreeAndNil(EndingTextBit2);  
end;

procedure TfrmEndingTextEditor.cbTextOffsetsChange(Sender: TObject);
begin
  CVROM.Ending.SaveEndingData;
  CVROM.Ending.LoadEndingData(cbTextOffsets.ItemIndex);
  DrawEndingText();
end;

procedure TfrmEndingTextEditor.DrawPatternTable;
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

procedure TfrmEndingTextEditor.imgTSAMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
var
  TilEd : Tfrm8x8TileEditor;
begin
  if (Button = mbMiddle) or ((ssShift in Shift) and (Button = mbLeft)) then
  begin
    Tile := ((y div 16) * 16 * 16) + ((X div 16) * 16);
    TileX := (X div 16) * 8;
    TileY := (y div 16) * 8;
    //showmessage(IntToStr(Y));
    DrawPatternTable();
    TilEd := Tfrm8x8TileEditor.Create(self);
    try
      TilEd.TileID := Tile div 16;
      TilEd.pMode := 3;
      TilEd.ShowModal;
      if TilEd.ModalResult = mrOK then
      begin
        CVROM.Ending.SavePatternTable;
        DrawEndingText();
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
    if StakeOptions.LastPaletteEnding = 3 then
      StakeOptions.LastPaletteEnding := 0
    else
      StakeOptions.LastPaletteEnding := StakeOptions.LastPaletteEnding +1;
  end;
  DrawPatternTable();

end;

procedure TfrmEndingTextEditor.cmdOkClick(Sender: TObject);
begin
  CVROM.Ending.SaveEndingData;
end;

procedure TfrmEndingTextEditor.imgEndingTextMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin

  CVROM.Ending.EndingTextData[(((y div 2) div 16) *16)+ ((x div 2) div 8)] := Tile;
  DrawEndingText;

end;

procedure TfrmEndingTextEditor.imgEndingText1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CVROM.Ending.EndingTextData[(((y div 2) div 16) *16) +32+ ((x div 2) div 8)] := Tile;
  DrawEndingText;
end;

end.
