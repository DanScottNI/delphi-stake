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

unit cMisc;

interface

type
  TDamage = class
  private
    _Stage1to6Offset : Integer;
    _Stage7to11Offset : Integer;
    _Stage12plusOffset : Integer;
    _MeatOffset : Integer;
    function GetStage12plus: Byte;
    function GetStage1to6: Byte;
    function GetStage7to11: Byte;
    procedure SetStage12plus(const Value: Byte);
    procedure SetStage1to6(const Value: Byte);
    procedure SetStage7to11(const Value: Byte);
    function GetMeat: Byte;
    procedure SetMeat(const Value: Byte);
  public
    property Stage1to6Offset : Integer read _Stage1to6Offset write _Stage1to6Offset;
    property Stage7to11Offset : Integer read _Stage7to11Offset write _Stage7to11Offset;
    property Stage12plusOffset : Integer read _Stage12plusOffset write _Stage12plusOffset;
    property MeatOffset : Integer read _MeatOffset write _MeatOffset;
    property Stage1to6 : Byte read GetStage1to6 write SetStage1to6;
    property Stage7to11 : Byte read GetStage7to11 write SetStage7to11;
    property Stage12plus : Byte read GetStage12plus write SetStage12plus;
    property Meat : Byte read GetMeat write SetMeat;
  end;

  TStatistics = class
  private
    _StartingHeartsOffset : Integer;
    _StartingLivesOffset : Integer;
    _SmallHeartsOffset : Integer;
    _BigHeartsOffset : Integer;
    _ClockCostOffset : Integer;
    function GetBigHearts: Byte;
    function GetSmallHearts: Byte;
    function GetStartingHearts: Byte;
    function GetStartingLives: Byte;
    procedure SetBigHearts(const Value: Byte);
    procedure SetSmallHearts(const Value: Byte);
    procedure SetStartingHearts(const Value: Byte);
    procedure SetStartingLives(const Value: Byte);
    function GetClockCost: Byte;
    procedure SetClockCost(const Value: Byte);
  public
    property StartingHeartsOffset : Integer read _StartingHeartsOffset write _StartingHeartsOffset;
    property StartingLivesOffset : Integer read _StartingLivesOffset write _StartingLivesOffset;
    property SmallHeartsOffset : Integer read _SmallHeartsOffset write _SmallHeartsOffset;
    property BigHeartsOffset : Integer read _BigHeartsOffset write _BigHeartsOffset;
    property ClockCostOffset : Integer read _ClockCostOffset write _ClockCostOffset;
    property StartingHearts : Byte read GetStartingHearts write SetStartingHearts;
    property StartingLives : Byte read GetStartingLives write SetStartingLives;
    property SmallHearts : Byte read GetSmallHearts write SetSmallHearts;
    property BigHearts : Byte read GetBigHearts write SetBigHearts;
    property ClockCost : Byte read GetClockCost write SetClockCost;
  end;

  TPatch = class
  private
    _Patch : Array Of Byte;
    _Filename : String;
    _PatchTitle : String;
    _PatchDescription : String;
    _PatchDataStart : Integer;
    _ValidSPF : Boolean;
    function GetFileSize: Integer;
    function GetCRC32: LongWord;
  public
    constructor Create(pFilename : String);
    function IsValidSPF : Boolean;
    property PatchTitle : String read _PatchTitle;
    property PatchDescription : String read _PatchDescription;
    property PatchFilename : String read _Filename write _Filename;
    property PatchFileSize : Integer read GetFileSize;
    property CRC32 : LongWord read GetCRC32;
    procedure Execute;
    destructor Destroy;override;
  end;
implementation

uses cROM, pasCRC32, jclFileUtils,classes, sysutils;

{ TDamage }

function TDamage.GetMeat: Byte;
begin
  result := ROM[self._MeatOffset];
end;

function TDamage.GetStage12plus: Byte;
begin
  result := ROM[self._Stage12plusOffset];
end;

function TDamage.GetStage1to6: Byte;
begin
  result := ROM[self._Stage1to6Offset];
end;

function TDamage.GetStage7to11: Byte;
begin
  result := ROM[self._Stage7to11Offset];
end;

procedure TDamage.SetMeat(const Value: Byte);
begin
  ROM[self._MeatOffset] := Value;
end;

procedure TDamage.SetStage12plus(const Value: Byte);
begin
  ROM[self._Stage12plusOffset] := Value;
end;

procedure TDamage.SetStage1to6(const Value: Byte);
begin
  ROM[self._Stage1to6Offset] := Value;
end;

procedure TDamage.SetStage7to11(const Value: Byte);
begin
  ROM[self._Stage7to11Offset] := Value;
end;

{ TStatistics }

function TStatistics.GetBigHearts: Byte;
begin
  result := ROM[self._BigHeartsOffset];
end;

function TStatistics.GetClockCost: Byte;
begin
  result := ROM[self._ClockCostOffset];
end;

function TStatistics.GetSmallHearts: Byte;
begin
  result := ROM[self._SmallHeartsOffset];
end;

function TStatistics.GetStartingHearts: Byte;
begin
  result := ROM[self._StartingHeartsOffset];
end;

function TStatistics.GetStartingLives: Byte;
begin
  if ROM[_StartingLivesOffset] = 0 then
    ROM[_StartingLivesOffset] := 1;

  result := ROM[self._StartingLivesOffset] - 1;
end;

procedure TStatistics.SetBigHearts(const Value: Byte);
begin
  ROM[self._BigHeartsOffset] := Value;
end;

procedure TStatistics.SetClockCost(const Value: Byte);
begin
  ROM[self._ClockCostOffset] := Value;
end;

procedure TStatistics.SetSmallHearts(const Value: Byte);
begin
  ROM[self._SmallHeartsOffset] := Value;
end;

procedure TStatistics.SetStartingHearts(const Value: Byte);
begin
  ROM[self._StartingHeartsOffset] := Value;
end;

procedure TStatistics.SetStartingLives(const Value: Byte);
begin
  ROM[self._StartingLivesOffset] := Value + 1;
end;

{ TPatch }

constructor TPatch.Create(pFilename: String);
var
  FileSizeInBytes : Longword;
  Mem : TMemoryStream;
  ByteCounter : Longword;
  SizeOfTitle : Byte;
  TitleDes : Array Of Char;
begin
  // Modified from Ultima's sm_verify tool's source, and modified
  // by me to use memory streams, and include try .. finally .. end
  // blocks.
  Mem := TMemoryStream.Create(); // open the file
  try
    Mem.LoadFromFile(pFilename);
    FileSizeInBytes := Mem.Size;

    SetLength(_Patch, FileSizeInBytes); // re-dimension the array to hold the file

    ByteCounter := 0; // start at the beginning of the array

    // hooray for streams...no loop
    Mem.Read(_Patch[ByteCounter], FileSizeInBytes);

    Mem.Seek(0,soFromBeginning);

    setlength(TitleDES,5);
    Mem.Read(TitleDes[0],4);
    TitleDes[4] := chr(0);
    if PChar(TitleDes) <> 'SPF1' then
      self._ValidSPF := False
    else
      self._ValidSPF := True;

    Mem.Seek(4,soFromBeginning);
    SizeOfTitle := 0;
    Mem.Read(SizeOfTitle,1);
    SetLength(TitleDes,SizeOfTitle+1);
    Mem.ReadBuffer(TitleDes[0],SizeOfTitle);
    self._PatchTitle := PChar(TitleDes);

    // Title Description
    SetLength(TitleDes,0);
    SizeOfTitle := 0;
    Mem.Read(SizeOfTitle,1);
    SetLength(TitleDes,SizeOfTitle+1);
    Mem.ReadBuffer(TitleDes[0],SizeOfTitle);
    self._PatchDescription := PChar(TitleDes);

    // Main text
    SetLength(TitleDes,0);
    SetLength(TitleDes,5);
    Mem.ReadBuffer(TitleDes[0],4);
    if PChar(TitleDes) <> 'MAIN' then _ValidSPF := False;
    self._PatchDataStart := Mem.Position;
  finally
    FreeAndNil(Mem); // memory cleanup
  end;

  // Remember to put the XOR decompression code in after debugging.

  // Work out the title.
//  for i := 0 to _Patch[4] - 1 do
//    self._PatchTitle := self._PatchTitle + chr(_Patch[5+i]);
  // Now work out the location of the patch description

//  for i := 0 to _Patch[5 + _Patch[4]] - 1 do
//    self._PatchDescription := self._PatchDescription + chr(_patch[6 + _Patch[4]+i]);
//  self._PatchDataStart := _patch[5 + _Patch[4]]
end;

destructor TPatch.Destroy;
begin
  SetLength(_Patch,0);
  inherited;
end;

procedure TPatch.Execute;
var
  Position, Offset,CurROMPos : Integer;
  Size : Word;
  RLESize : Word;
  RLEVal : Byte;
  i : integer;
begin
  if IsValidSPF = True then
  begin
    Position := self._PatchDataStart;
    while (Position < high(_Patch)) do
    begin
      if (_Patch[Position] = 69) and (_Patch[Position + 1] = 79)
        and (_Patch[Position + 2] =70) then
        break;

      // First load in the offset (3-bytes)
      Offset := StrToInt('$' + IntToHex(_Patch[Position+3],2) +
        IntToHex(_Patch[Position+2],2) +
          IntToHex(_Patch[Position+1],2) +
            IntToHex(_Patch[Position],2));
      Position := Position + 4;

      // Next load in the size of the bytes (2-bytes)
      Size := StrToInt('$' + IntToHex(_Patch[Position+1],2) +
        IntToHex(_Patch[Position],2));
      Position := Position + 2;

      // Now we need to check if the size value is 0.
      // if it is, it's using RLE.
      if Size = 0 then
      begin
        RLESize := StrToInt('$' + IntToHex(_Patch[Position+1],2) +
          IntToHex(_Patch[Position],2));
        Position := Position + 2;

        RLEVal := _Patch[Position];
        inc(Position);

        for i := 0 to RLESize -1 do
          ROM[Offset + i] := RLEVal;
      end
      else if Size >0 then
      begin
        CurROMPos := 0;
//        ROMToBePatched.Seek(Offset,soFromBeginning);
        for i := Position to (Position + Size -1) do
        begin
          ROM[Offset+CurROMPos] := _Patch[i];
          inc(CurROMPos);
        end;
//          ROMToBePatched.Write(IPS[i],1);
        position := Position + Size;

      end;
    end;
  end;
end;

function TPatch.GetCRC32: LongWord;
var
  lwCRC32 : Longword;
begin
  lwCRC32 := $FFFFFFFF; // match "normal" / PKZIP / etc. , step one: initialize with $FFFFFFFF (-1 signed)
  CalcCRC32(@_Patch[0], Length(_Patch), lwCRC32);
  lwCRC32 := not lwCRC32; // match "normal" / PKZIP / etc. , step two: invert the bits of the result

  result := lwCRC32;
end;

function TPatch.GetFileSize: Integer;
begin
  result := FileGetSize(self._Filename);
end;

function TPatch.IsValidSPF: Boolean;
begin
  result := self._ValidSPF;
end;

end.
