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

unit ctitlescreen;

interface

  uses Sysutils, GR32, classes, dialogs;

  type
  T8x8Graphic = record
    Pixels : Array [0..7, 0..7] of Byte
  end;

  TTitleScreen = class
  private
    _CompressedBuffer : Array [0..1023] Of Byte;
    _UnCompressedBuffer : Array [0..1050] of Byte;
    _PointerOffset : Integer;
    _PaletteOffset : Integer;
    _Palette : Array [0..7, 0..3] of Byte;
    _PatTableOffset : Integer;
    _PatternTable : Array [0.. 4095] of Byte;
    _SizeOfCompressedData : Integer;
    _OriginalCompressedSize : Integer;
    _OriginalOffset : Integer;
    _FreeSpace : Integer;
    function GetAttributeData(Index: Integer): Byte;
    procedure SetAttributeData(Index: Integer; const Value: Byte);
    procedure DrawTitleTile(pOffset: Integer; pBitmap: TBitmap32; pX, pY,
      pIndex: Integer);
    function GetPaletteVal(index, index1: integer): byte;
    procedure SetPaletteVal(index, index1: integer; const Value: byte);
  public
    // The method to create the object.
    constructor Create;
    // This method compresses the data inside the uncompressed buffer.
    procedure CompressData;
    // This method saves the compressed data to a file, for testing.
    procedure DumpCompressedData(pFilename : String);
    // This method saves the uncompressed data to a file, for testing.
    procedure DumpUncompressedData(pFilename : String);
    // Decompress the data in the compressed buffer to the uncompressed buffer.
    procedure DecompressData;
    // The size of the data originally.
    property OriginalCompressedSize : Integer read _OriginalCompressedSize write _OriginalCompressedSize;
    // The offset of the pointers for the title screen.
    property PointerOffset : integer read _PointerOffset write _PointerOffset;
    // The offset of the title screen palette.
    property PaletteOffset : integer read _PaletteOffset write _PaletteOffset;
    // The offset of the pattern table for the title screen.
    property PatternTableOffset : integer read _PatTableOffset write _PatTableOffset;
    // The size of the data currently stored in the compressed buffer.
    property CompressedDataSize : Integer read _SizeOfCompressedData;
    // The original offset of the title screen.
    property OriginalOffset : Integer read _OriginalOffset write _OriginalOffset;
    // The free space that the title screen can use.
    property FreeSpace : Integer read _FreeSpace write _FreeSpace;
    property AttributeData [Index : Integer] : Byte read GetAttributeData write SetAttributeData;
    // Load the pattern table.
    procedure LoadPatternTable;virtual;
    procedure LoadPalette;virtual;
    procedure LoadCompressedData;
    // Draw the title screen.
    procedure Draw(pBitmap : TBitmap32);
    procedure DrawOneTileTitle(pBitmap : TBitmap32;pX,pY : Integer);
    procedure Edit(pX,pY : Integer; pNewByte : Byte);
    function GetTitleScreenTile(pX,pY : Integer):byte;
    function SaveCompressedData() : Boolean;
    procedure DrawPatternTable(pBitmap : TBitmap32; pCurPal : Byte);
    procedure IncrementAttribute(pX,pY : Integer);
    procedure Import8x8Pat(pID: Integer; p8x8: T8x8Graphic);
    function Export8x8Pat(pID: Integer): T8x8Graphic;
    procedure SavePatternTable;virtual;
    procedure SavePalette;virtual;
    procedure EraseTile(pTileID: Byte);
    property Palette[index : Integer; index1 : integer] : byte read GetPaletteVal write SetPaletteVal;
  end;

  TExTitleScreenGFX = record
    StartTile : Byte;
    Offset : Integer;
    NumOfTiles : Integer;
  end;

  TExTitleScreen = class(TTitleScreen)
  private
    _NumOfGFX : Integer;
    _GFX : Array Of TExTitleScreenGFX;
    function GetGFX(index: Integer): TExTitleScreenGFX;
    procedure SetGFX(index: Integer; const Value: TExTitleScreenGFX);
  public
    procedure LoadPatternTable;override;
    procedure SavePatternTable;override;
    procedure LoadPalette;override;
    procedure SavePalette;override;
    property NumOfGFX : Integer read _NumOfGFX write _NumOfGFX;
    property GFX [index : Integer] : TExTitleScreenGFX read GetGFX write SetGFX;
    procedure SetGFXLength(pNewLength : Integer);
  end;

  TEndTitleScreen = class(TExTitleScreen)
  private
    _TextColourOffset : Integer;
    _TextColourChanges : Array [0..4,0..1] of Byte;
    _EndingTextPointerOffset : Integer;
    _NumberOfText : Byte;
    _EndingTextBuffer : Array [0.. $3F] of byte;
    _EndingTextIndex : Byte;
    function GetTextPal(index1, index2: Integer): Byte;
    procedure SetTextPal(index1, index2: Integer; const Value: Byte);
    function GetEndingTextData(index: Integer): Byte;
    procedure SetEndingTextData(index: Integer; const Value: Byte);
  public
    property TextColourOffset : Integer read _TextColourOffset write _TextColourOffset;
    property EndingTextPointerOffset : Integer read _EndingTextPointerOffset write _EndingTextPointerOffset;
    property NumberOfText : Byte read _NumberOfText write _NumberOfText;
    procedure LoadPalette;override;
    procedure SavePalette;override;
    property EndingTextData [index : Integer] : Byte read GetEndingTextData write SetEndingTextData;
    property TextPalette[index1 : Integer; index2 : Integer] : Byte read GetTextPal write SetTextPal;
    procedure LoadEndingData(pIndex : Byte);
    procedure SaveEndingData();
    function GetEndingTextName(pIndex : Byte): String;
    procedure DrawEndingTextBuffer(pBitmap,pBitmap1 : TBitmap32);
  end;

  TIntroExpansion = class
  private
    _IntroGFXOffset : Integer;
    _NewIntroGFXOffset : Integer;
    _IntroDataOffset : Integer;
    _NewIntroDataOffset : Integer;
    _IntroPointerOffset : Integer;
    _CHRRAMSettingsOffset : Integer;
    function GetIntroExpanded: Boolean;
  public
    property IntroGFXOffset : Integer read _IntroGFXOffset write _IntroGFXOffset;
    property NewIntroGFXOffset : Integer read _NewIntroGFXOffset write _NewIntroGFXOffset;
    property IntroDataOffset : Integer read _IntroDataOffset write _IntroDataOffset;
    property NewIntroDataOffset : Integer read _NewIntroDataOffset write _NewIntroDataOffset;
    property IntroPointerOffset : Integer read _IntroPointerOffset write _IntroPointerOffset;
    property CHRRAMSettingsOffset : Integer read _CHRRAMSettingsOffset write _CHRRAMSettingsOffset;
    property IsIntroExpanded : Boolean read GetIntroExpanded;
    procedure ExpandIntro;
  end;


implementation

uses cROM;

{ TTitleScreen }

function TTitleScreen.Export8x8Pat(pID: Integer) : T8x8Graphic;
var
  x,y : Integer;
  curBit, curBit2 : Char;
  TempBin1,TempBin2, TempBin3 : String;
  Tile1 : Array [0..15] of Byte;
  p8x8 : T8x8Graphic;
begin
  For y := 0 To 15 do
    Tile1[y] := self._PatternTable[(pID * 16) +y];

  for y := 0 to 7 do
  begin
    TempBin1 := ROM.ByteToBin(Tile1[y]);
    TempBin2 := ROM.ByteToBin(Tile1[y + 8]);
    for x := 0  to 7 do
    begin
      CurBit := TempBin1[x + 1];
      CurBit2 := TempBin2[x + 1];
      TempBin3 := CurBit + CurBit2;

      if TempBin3 = '00' Then
        p8x8.Pixels[y,x] := 0
      else if TempBin3 = '10' Then
        p8x8.Pixels[y,x] := 1
      else if TempBin3 = '01' Then
        p8x8.Pixels[y,x] := 2
      else if TempBin3 = '11' Then
        p8x8.Pixels[y,x] := 3;
    end;
  end;
  result := p8x8;
end;

procedure TTitleScreen.Import8x8Pat(pID: Integer; p8x8: T8x8Graphic);
var
  x,y : Integer;
  TempBin1, TempBin2 : String;
  Tile1 : Array [0..15] of Byte;
begin
  For y := 0 To 15 do
    Tile1[y] := self._PatternTable[(pID * 16) +y];

  for y := 0 to 7 do
  begin
    for x := 0  to 7 do
    begin

      TempBin1 := IntToStr(p8x8.Pixels[y,x] and 1) + TempBin1;
      TempBin2 := IntToStr(p8x8.Pixels[y,x] shr 1) + TempBin2;

    end;
    self._PatternTable[(pID * 16) +y] := ROM.BinToByte(TempBin1);
    self._PatternTable[(pID * 16) +y + 8] := ROM.BinToByte(TempBin2);
  end;

end;

procedure TTitleScreen.DrawTitleTile(pOffset: Integer; pBitmap: TBitmap32; pX,
  pY, pIndex: Integer);
var
  x,y : Integer;
  curBit, curBit2 : Char;
  TempBin : String;
  Tile1 : Array [0..15] of Byte;
begin
  For y := 0 To 15 do
    Tile1[y] := _PatternTable[pOffset+y];

  for y := 0 to 7 do
  begin
    for x := 0  to 7 do
    begin
      TempBin := ROM.ByteToBin(Tile1[y]);
      CurBit := TempBin[x + 1];
      TempBin := ROM.ByteToBin(Tile1[y + 8]);
      CurBit2 := TempBin[x + 1];

      TempBin := CurBit + CurBit2;

      if TempBin = '00' Then
        pBitmap.Pixel[pX + x,py+y] := ROM.NESPal[_Palette[pIndex,0]]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX + x,py+y] := ROM.NESPal[_Palette[pIndex,1]]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX + x,py+y] := ROM.NESPal[_Palette[pIndex,2]]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX + x,py+y] := ROM.NESPal[_Palette[pIndex,3]];
    end;
  end;
end;

procedure TTitleScreen.LoadPalette;
var
  i,x : Integer;
begin
  for i :=0 to 7 do
    for x := 0 to 3 do
      _Palette[i,x] := ROM[_PaletteOffset + ((i*4)+x)];
end;

procedure TTitleScreen.Edit(pX, pY: Integer; pNewByte: Byte);
begin
  _UnCompressedBuffer[((pY*32)+pX)] := pNewByte;
end;

procedure TTitleScreen.DrawPatternTable(pBitmap: TBitmap32;
  pCurPal: Byte);
var
  i, X : Integer;
begin
  for i := 0 to 15 do
    for x := 0 to 15 do
      DrawTitleTile((i*16 + x) * 16,pBitmap,x*8,i*8,pCurPal);

end;

procedure TTitleScreen.IncrementAttribute(pX, pY: Integer);
var
  Temp : Byte;
  TempAttributeData : Array [0..1,0..1] of Byte;
begin
  Temp := AttributeData[((pY div 4) * 8) + (pX div 4)];
  tempattributeData[0,0] := Temp and 3;
  tempattributeData[0,1] := (Temp shr 2) and 3;
  tempattributeData[1,0] := (Temp shr 4) and 3;
  tempattributeData[1,1] := (Temp shr 6) and 3;
  if tempattributeData[pY mod 4 div 2, pX mod 4 div 2] = 3 then
    tempattributeData[pY mod 4 div 2, pX mod 4 div 2] :=0
  else
    inc(tempattributeData[pY mod 4 div 2, pX mod 4 div 2]);
  temp := tempattributedata[0,0] + (tempattributedata[0,1] shl 2) + (tempattributedata[1,0] shl 4) + (tempattributedata[1,1] shl 6);
  attributedata[((pY div 4) * 8) + (pX div 4)] := temp;
end;


procedure TTitleScreen.CompressData;
var
  CurrentPosSource, CurrentPosDest,i : Integer;
  NumberOfBytes : Integer;
  RLEByte : Byte;
  D91Set, D92Set, D93Set : Boolean;
begin
  CurrentPosDest := 0;
  CurrentPosSource := 0;


  D91Set := False;
  D92Set := False;
  D93Set := False;

  // Clear the compressed buffer.
  for i := 0 to high(_CompressedBuffer) do
    _CompressedBuffer[i] := $FF;

  while (CurrentPosSource < 1024) do
  begin

    NumberOfBytes := 1;

    RLEByte := _UnCompressedBuffer[CurrentPosSource];

    inc(CurrentPosSource);

    while ((_UnCompressedBuffer[CurrentPosSource] = RLEByte) and (NumberOfBytes < 255)) do
    begin
      inc(NumberOfBytes);
      inc(CurrentPosSource);
    end;

    if NumberOfBytes > 1 then
    begin
      if NumberOfBytes > 2 then
      begin
        _CompressedBuffer[CurrentPosDest] := $D4;
        inc(CurrentPosDest);
        _CompressedBuffer[CurrentPosDest] := NumberOfBytes;
        inc(CurrentPosDest);
        _CompressedBuffer[CurrentPosDest] := RLEByte;
        inc(CurrentPosDest);
      end
      else
      begin
        _CompressedBuffer[CurrentPosDest] := RLEByte;
        inc(CurrentPosDest);
        _CompressedBuffer[CurrentPosDest] := RLEByte;
        inc(CurrentPosDest);
      end;
    end
    else
    begin
      _CompressedBuffer[CurrentPosDest] := RLEByte;
      inc(CurrentPosDest);
    end;

    if (D91Set = false) and (CurrentPosSource > 256) then
    begin
      _CompressedBuffer[CurrentPosDest] := $D9;
      D91Set := True;
      inc(CurrentPosDest);
    end
    else if (D92Set = false) and (CurrentPosSource > 512) then
    begin
      _CompressedBuffer[CurrentPosDest] := $D9;
      D92Set := True;
      inc(CurrentPosDest);
    end
    else if (D93Set = false) and (CurrentPosSource > 768) then
    begin
      _CompressedBuffer[CurrentPosDest] := $D9;
      D93Set := True;
      inc(CurrentPosDest);
    end

  end; // End of While (CurrentPosSource < 1024)
  _CompressedBuffer[CurrentPosDest] := $D9;
  inc(CurrentPosDest);
  self._SizeOfCompressedData := CurrentPosDest;
//  dumpcompresseddata('c:\test1.nes');
end;

procedure TTitleScreen.DumpCompressedData(pFilename: String);
var
  Mem : TMemoryStream;
  i : Integer;
begin

  Mem := TMemoryStream.Create;
  try
    Mem.SetSize(high(self._CompressedBuffer));

    Mem.Position :=0;

    for i := 0 to mem.Size do
      Mem.Write(self._CompressedBuffer[i],1);

    Mem.SaveToFile(pFilename);
  finally
    FreeAndNil(Mem);
  end;


end;

procedure TTitleScreen.DumpUncompressedData(pFilename: String);
var
  Mem : TMemoryStream;
  i : Integer;
begin

  Mem := TMemoryStream.Create;
  try
    Mem.SetSize(high(self._UnCompressedBuffer));

    Mem.Position :=0;

    for i := 0 to mem.Size do
      Mem.Write(self._UnCompressedBuffer[i],1);

    Mem.SaveToFile(pFilename);
  finally
    FreeAndNil(Mem);
  end;


end;

procedure TTitleScreen.LoadCompressedData;
var
  i, CurrentPositionArr, CurrentPositionFile : Integer;
  TitleScreenOffset : Integer;
  Size : Integer;
begin
  CurrentPositionArr := -1;
  Size := 0;
  for i := 0 to 3 do
  begin
    CurrentPositionFile := -1;
    TitleScreenOffset := ROM.PointerToOffset(_PointerOffset + (i*2),$18010);
    repeat
      inc(CurrentPositionArr);
      inc(CurrentPositionFile);
      _CompressedBuffer[CurrentPositionArr] := ROM[TitleScreenOffset + CurrentPositionFile];

    until ROM[TitleScreenOffset + CurrentPositionFile] = $D9;
    Size := Size + CurrentPositionFile +1;
  end;
  _SizeOfCompressedData := Size;
end;

procedure TTitleScreen.DecompressData;
var
  CurrentPosSource, CurrentPosDest,i,x : Integer;
  RLEByte : Byte;
begin
  // Reset the current position in both the source
  // and destination arrays.
  CurrentPosSource := 0;
  CurrentPosDest := 0;
  // D9 ends a particular section of data.
  // D4 starts the RLE compressed stuff, followed by quantity and byte.

  for i := 0 to 3 do
  begin
    while (self._CompressedBuffer[CurrentPosSource] <> $D9) do
    begin
      // Check for the RLE start byte.
      if _CompressedBuffer[CurrentPosSource] = $D4 then
      begin
        inc(CurrentPosSource);
        RLEByte := _CompressedBuffer[CurrentPosSource] -1;
        inc(CurrentPosSource);
        x := 0;
        while (x <= RLEByte) do
        begin
          _UnCompressedBuffer[CurrentPosDest] := _CompressedBuffer[CurrentPosSource];
          inc(CurrentPosDest);
          inc(x);
        end; // End while (x < RLEByte)
        inc(CurrentPosSource);
      end // end if _UnCompressedBuffer[CurrentPosSource] = $D4
      else
      begin
        _UnCompressedBuffer[CurrentPosDest] := _CompressedBuffer[CurrentPosSource];
        inc(CurrentPosDest);
        inc(CurrentPosSource);
      end; // End else.
    end; // end while (self._UnCompressedBuffer[CurrentPosSource] <> $D9)
    inc(CurrentPosSource);
  end; // End for i := 0 to 3
end;

constructor TTitleScreen.Create;
var
  i : Integer;
begin
  for i := 0 to 1023 do
    self._CompressedBuffer[i] := $FF;

  inherited create;

end;

procedure TTitleScreen.Loadpatterntable;
var
  i : Integer;
begin
  for i := 0 to 4095 do
    _PatternTable[i] := ROM[_PatTableOffset + i];
end;

procedure TTitleScreen.SavePatternTable;
var
  i : Integer;
begin
  for i := 0 to 4095 do
    ROM[_PatTableOffset + i] := _PatternTable[i];
end;

procedure TTitleScreen.Draw(pBitmap: TBitmap32);
var
  i,x : Integer;
  Temp : Byte;
  TempAttributeData : Array [0..1,0..1] of Byte;
begin
  for i := 0 to 29 do
    for x := 0 to 31 do
    begin
      Temp := AttributeData[((i div 4) * 8) + (x div 4)];
      tempattributeData[0,0] := Temp and 3;
      tempattributeData[0,1] := (Temp shr 2) and 3;
      tempattributeData[1,0] := (Temp shr 4) and 3;
      tempattributeData[1,1] := (Temp shr 6) and 3;
      DrawTitleTile(_UnCompressedBuffer[((i*32)+x)] * 16,pBitmap,x*8,i*8,tempattributeData[i mod 4 div 2, x mod 4 div 2]);
    end;
end;

procedure TTitleScreen.DrawOneTileTitle(pBitmap : TBitmap32;pX,pY : integer);
var
  Temp : Byte;
  TempAttributeData : Array [0..1,0..1] of Byte;
begin
  Temp := AttributeData[((pY div 4) * 8) + (pX div 4)];
  tempattributeData[0,0] := Temp and 3;
  tempattributeData[0,1] := (Temp shr 2) and 3;
  tempattributeData[1,0] := (Temp shr 4) and 3;
  tempattributeData[1,1] := (Temp shr 6) and 3;

  DrawTitleTile(_UnCompressedBuffer[(pY*32)+pX] * 16,pBitmap,pX*8,pY*8,tempattributeData[pY mod 4 div 2, pX mod 4 div 2]);

end;

function TTitleScreen.SaveCompressedData(): boolean;
var
  i, CurrentPositionArr, CurrentPositionFile : Integer;
  TitleScreenOffset : Integer;
  TitleScreenPointer : Integer;
  TitleScreenPointerStr : String;
begin
  CurrentPositionArr := -1;
  CurrentPositionFile := -1;

  // First we check if the newly compressed data is bigger
  // than the original data. If it is, save it to the free space
  // in the bank. If not, save it to the original offset.
  if CompressedDataSize > OriginalCompressedSize then
{    TitleScreenOffset := FreeSpace
  else
    TitleScreenOffset := OriginalOffset;}
  begin
    showmessage('Unable to save, due to new data is bigger than the old data.');
    result := false;
    exit;
  end;
  TitleScreenOffset := OriginalOffset;

  for i := 0 to 3 do
  begin

    if CurrentPositionFile = -1 then
    begin
      // Now we create the pointer, based on the offset.
      TitleScreenPointer := ((TitleScreenOffset - $18010) + $8000);
      TitleScreenPointerStr := IntToHex(TitleScreenPointer,4);

      ROM[PointerOffset] := StrToInt('$' + TitleScreenPointerStr[3] + TitleScreenPointerStr[4]);
      ROM[PointerOffset+1] := StrToInt('$' + TitleScreenPointerStr[1] + TitleScreenPointerStr[2]);
    end
    else
    begin
      // Now we create the pointer, based on the offset.
      TitleScreenPointer := ((TitleScreenOffset - $18010) + $8000) + CurrentPositionFile + 1;
      TitleScreenPointerStr := IntToHex(TitleScreenPointer,4);
      ROM[PointerOffset + (i * 2)] := StrToInt('$' + TitleScreenPointerStr[3] + TitleScreenPointerStr[4]);
      ROM[PointerOffset + 1 + (i * 2)] := StrToInt('$' + TitleScreenPointerStr[1] + TitleScreenPointerStr[2]);
    end;

    repeat
      inc(CurrentPositionArr);
      inc(CurrentPositionFile);

      ROM[TitleScreenOffset + CurrentPositionFile] := _CompressedBuffer[CurrentPositionArr];

    until _CompressedBuffer[CurrentPositionArr] = $D9;

  end;
  result := true;
end;

function TTitleScreen.GetAttributeData(Index: Integer): Byte;
begin
  result := self._UncompressedBuffer[960 + Index];
end;

procedure TTitleScreen.SetAttributeData(Index: Integer; const Value: Byte);
begin
  self._UnCompressedBuffer[960 + index] := Value;
end;

function TTitleScreen.GetTitleScreenTile(pX, pY: Integer): byte;
begin
  result :=  _UnCompressedBuffer[((pY*32)+pX)];
end;

procedure TTitleScreen.SavePalette;
var
  i,x : Integer;
begin
  for i :=0 to 7 do
    for x := 0 to 3 do
      ROM[_PaletteOffset + ((i*4)+x)] := _Palette[i,x];

end;

procedure TTitleScreen.EraseTile(pTileID : Byte);
var
  i : Integer;
begin
  for i := 0 to 15 do
    _patterntable[(pTileID * 16) + i] := 0;
end;

function TTitleScreen.GetPaletteVal(index, index1: integer): byte;
begin
  result := self._Palette[index,index1];
end;

procedure TTitleScreen.SetPaletteVal(index, index1: integer;
  const Value: byte);
begin
  self._Palette[index,index1] := Value;
end;

{ TEndTitleScreen }

procedure TEndTitleScreen.DrawEndingTextBuffer(pBitmap,pBitmap1: TBitmap32);
var
  i,x : Integer;
begin
  for i := 0 to 1 do
    for x := 0 to 15 do
    begin
      if self.EndingTextData[(i*16) + x] < $5A then
      begin
        DrawTitleTile(self.EndingTextData[(i*16) + x] * 16,pBitmap,x*8,i*16,2);
        DrawTitleTile($54 *16,pBitmap,x*8,(i*16) + 8,2);
      end
      else
      begin
        DrawTitleTile(self.EndingTextData[(i*16) + x] * 16,pBitmap,x*8,i*16,2);
        DrawTitleTile((self.EndingTextData[(i*16) + x] +1) * 16,pBitmap,x*8,(i*16) + 8,2);
      end;
    end;

  for i := 2 to 3 do
    for x := 0 to 15 do
    begin
      if self.EndingTextData[(i*16) + x] < $5A then
      begin
        DrawTitleTile(self.EndingTextData[(i*16) + x] * 16,pBitmap1,x*8,(i*16)-32,2);
        DrawTitleTile($54 *16,pBitmap1,x*8,((i*16) + 8)-32,2);
      end
      else
      begin
        DrawTitleTile(self.EndingTextData[(i*16) + x] * 16,pBitmap1,x*8,(i*16)-32,2);
        DrawTitleTile((self.EndingTextData[(i*16) + x] +1) * 16,pBitmap1,x*8,((i*16) + 8)-32,2);
      end;
    end;

end;

function TEndTitleScreen.GetEndingTextData(index: Integer): Byte;
begin
  result := _endingtextbuffer[index];
end;

function TEndTitleScreen.GetEndingTextName(pIndex: Byte): String;
begin

  result := IntToHex(ROM.PointerToOffset(self.EndingTextPointerOffset + (pIndex * 2),0),4);

end;

function TEndTitleScreen.GetTextPal(index1, index2: Integer): Byte;
begin
  result := _TextColourChanges[index1,index2];
end;

procedure TEndTitleScreen.LoadEndingData(pIndex: Byte);
var
  TextOffset,i : Integer;
begin
  _EndingTextIndex := pIndex;

  TextOffset := ROM.PointerToOffset(self.EndingTextPointerOffset + (pIndex * 2),0);

  for i := 0 to $3F do
  begin
    _EndingTextBuffer[i] := ROM[TextOffset + i]
  end;

end;

procedure TEndTitleScreen.LoadPalette;
var
  i,x : Integer;
begin
  for i :=0 to 7 do
    for x := 0 to 3 do
      _Palette[i,x] := ROM[_PaletteOffset + ((i*4)+x)];

  for i := 0 to 4 do
    for x := 0 to 1 do
      _TextColourChanges[i,x] := ROM[TextColourOffset + ((i*2) + x)];

end;

procedure TEndTitleScreen.SaveEndingData;
var
  TextOffset,i : Integer;
begin

  TextOffset := ROM.PointerToOffset(self.EndingTextPointerOffset + (_EndingTextIndex * 2),0);

  for i := 0 to $3F do
  begin
    ROM[TextOffset + i] := _EndingTextBuffer[i];
  end;


end;

procedure TEndTitleScreen.SavePalette;
var
  i,x : Integer;
begin
  for i :=0 to 7 do
    for x := 0 to 3 do
      ROM[_PaletteOffset + ((i*4)+x)] := _Palette[i,x];

  for i := 0 to 4 do
    for x := 0 to 1 do
      ROM[TextColourOffset + ((i*2) + x)] :=  _TextColourChanges[i,x];

end;

procedure TEndTitleScreen.SetEndingTextData(index: Integer;
  const Value: Byte);
begin
  _endingtextbuffer[index] := Value;
end;

procedure TEndTitleScreen.SetTextPal(index1, index2: Integer;
  const Value: Byte);
begin
  _TextColourChanges[index1,index2] := Value;
end;

{ TExTitleScreen }

function TExTitleScreen.GetGFX(index: Integer): TExTitleScreenGFX;
begin
  result := self._GFX[index];
end;

procedure TExTitleScreen.LoadPalette;
var
  i,x : Integer;
begin
  for i :=0 to 3 do
    for x := 0 to 3 do
      _Palette[i,x] := ROM[_PaletteOffset + ((i*4)+x)];
end;

procedure TExTitleScreen.LoadPatternTable;
var
  i,x : Integer;
begin
  inherited;
  for i := 0 to self._NumOfGFX -1 do
    for x := 0 to (_GFX[i].NumOfTiles * 16) - 1 do
      self._PatternTable[(self._GFX[i].StartTile *16) + x] := ROM[_GFX[i].Offset + x];
end;

procedure TExTitleScreen.SavePalette;
var
  i,x : Integer;
begin
  for i :=0 to 3 do
    for x := 0 to 3 do
      ROM[_PaletteOffset + ((i*4)+x)] := _Palette[i,x];
end;

procedure TExTitleScreen.SavePatternTable;
var
  i,x : Integer;
begin
  for i := 0 to self._NumOfGFX -1 do
    for x := 0 to (_GFX[i].NumOfTiles * 16) - 1 do
      ROM[_GFX[i].Offset + x] := self._PatternTable[(self._GFX[i].StartTile *16) + x];

end;

procedure TExTitleScreen.SetGFX(index: Integer;
  const Value: TExTitleScreenGFX);
begin
  self._GFX[Index] := Value;
end;

procedure TExTitleScreen.SetGFXLength(pNewLength: Integer);
begin
  setlength(self._GFX,pNewLength);
end;

{ TIntroExpansion }

procedure TIntroExpansion.ExpandIntro;
var
  TempPtr : String;
  i, Pos : Integer;
begin
  // STEP 1 - UPDATE INTRO POINTER
  // Work out the pointer for the new intro screen location
  TempPtr := ROM.OffsetToPointerS(self.NewIntroDataOffset);
  // Update the pointer to the castle intro data.
  ROM[self.IntroPointerOffset] := StrToInt('$' + TempPtr[3] + TempPtr[4]);
  ROM[self.IntroPointerOffset + 1] := StrToInt('$' + TempPtr[1] + TempPtr[2]);

  // STEP 2 - UPDATE CHR-RAM SETTINGS
  if ROM[self.CHRRAMSettingsOffset] = 6 then
  begin
    // Change the bank setting.
    ROM[self.CHRRAMSettingsOffset] := self.NewIntroGFXOffset div $4000;
    TempPtr := ROM.OffsetToPointerS(self.NewIntroGFXOffset);
    // Update the pointer to the castle intro GFX.
    ROM[self.CHRRAMSettingsOffset + 1] := StrToInt('$' + TempPtr[3] + TempPtr[4]);
    ROM[self.CHRRAMSettingsOffset + 2] := StrToInt('$' + TempPtr[1] + TempPtr[2]);
    // Update the position in the PPU to start at
    ROM[self.CHRRAMSettingsOffset + 3] := $00;
    ROM[self.CHRRAMSettingsOffset + 4] := $10;
    // Update the amount of tiles to write in.
    ROM[self.CHRRAMSettingsOffset + 5] := $00;
    ROM[self.CHRRAMSettingsOffset + 6] := $09;
  end;

  // STEP 3 - INSERT 448 BYTES AT NEW INTRO GFX LOCATION.
  for i := 0 to 447 do
  begin
    ROM[self.NewIntroGFXOffset +i] := $00;
  end;
  // STEP 4 - COPY THE TITLE SCREEN GFX TO NEW LOCATION.
  // Resize the array.
  for i := 0 to $51F do
  begin
    ROM[self.NewIntroGFXOffset + ($1C * 16) + i] := ROM[self.IntroGFXOffset + i];
    ROM[self.IntroGFXOffset + i] := $FF;
  end;

  // STEP 5 - MOVE THE INTRO DATA TO NEW LOCATION. UPDATE THE 4 POINTERS.
  Pos := self.NewIntroDataOffset + 8;

  // Heh, the below code could probably be put into a loop, but
  // i'm lazy. :P
  // Update the first pointer to the castle intro data.
  TempPtr := ROM.OffsetToPointerS(Pos);
  ROM[self.NewIntroDataOffset] := StrToInt('$' + TempPtr[3] + TempPtr[4]);
  ROM[self.NewIntroDataOffset + 1] := StrToInt('$' + TempPtr[1] + TempPtr[2]);

  while (ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)] <> $D9) do
  begin
    ROM[Pos] := ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)];
    ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)] := $FF;
    inc(Pos);
  end;
  ROM[Pos] := $D9;

  inc(Pos);
  TempPtr := ROM.OffsetToPointerS(Pos);
  ROM[self.NewIntroDataOffset + 2] := StrToInt('$' + TempPtr[3] + TempPtr[4]);
  ROM[self.NewIntroDataOffset + 3] := StrToInt('$' + TempPtr[1] + TempPtr[2]);
  while (ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)] <> $D9) do
  begin
    ROM[Pos] := ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)];
    ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)] := $FF;
    inc(Pos);
  end;
  ROM[Pos] := $D9;

  inc(Pos);
  TempPtr := ROM.OffsetToPointerS(Pos,$8000);
  ROM[self.NewIntroDataOffset + 4] := StrToInt('$' + TempPtr[3] + TempPtr[4]);
  ROM[self.NewIntroDataOffset + 5] := StrToInt('$' + TempPtr[1] + TempPtr[2]);
  while (ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)] <> $D9) do
  begin
    ROM[Pos] := ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)];
    ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)] := $FF;
    inc(Pos);
  end;
  ROM[Pos] := $D9;

  inc(Pos);
  TempPtr := ROM.OffsetToPointerS(Pos,$8000);
  ROM[self.NewIntroDataOffset + 6] := StrToInt('$' + TempPtr[3] + TempPtr[4]);
  ROM[self.NewIntroDataOffset + 7] := StrToInt('$' + TempPtr[1] + TempPtr[2]);
  while (ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)] <> $D9) do
  begin
    ROM[Pos] := ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)];
    ROM[self.IntroDataOffset + (Pos - NewIntroDataOffset)] := $FF;
    inc(Pos);
  end;
  ROM[Pos] := $D9;
end;

function TIntroExpansion.GetIntroExpanded: Boolean;
begin
  // If the ROM does not support castle intro expansion, then
  // just return true, to indicate that it has already been expanded.
  if Self._IntroPointerOffset = 0 then
  begin
    result := True;
    exit;
  end;

  if ROM.PointerToOffset(self._IntroPointerOffset,$18010) = self._NewIntroDataOffset then
    result := True
  else
    result := False;
end;


end.
