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

unit cMusic;

interface
  uses Contnrs, SysUtils;

  type
  TSoundEffects = class
  private
    _HeartOffset : Integer;
    _MoneyOffset : Integer;
    _WhipOffset : Integer;
    _CastleDoorOffset : Integer;
    _InvulnerabilityJar1Offset : Integer;
    _InvulnerabilityJar2Offset : Integer;
    _DoorOpeningOffset : Integer;
    _HiddenItemOffset : Integer;
    _ClrScrOffset : Integer;
    _1UPOffset : Integer;
    function GetCastleDoorState: Boolean;
    function GetClearScreenState: Boolean;
    function GetDoorOpeningState: Boolean;
    function GetExtraLifeState: Boolean;
    function GetHeartState: Boolean;
    function GetHiddenItemState: Boolean;
    function GetJar1State: Boolean;
    function GetJar2State: Boolean;
    function GetMoneyState: Boolean;
    function GetWhipState: Boolean;
    procedure SetCastleDoorState(const Value: Boolean);
    procedure SetClearScreenState(const Value: Boolean);
    procedure SetDoorOpeningState(const Value: Boolean);
    procedure SetExtraLifeState(const Value: Boolean);
    procedure SetHeartState(const Value: Boolean);
    procedure SetHiddenItemState(const Value: Boolean);
    procedure SetJar1State(const Value: Boolean);
    procedure SetJar2State(const Value: Boolean);
    procedure SetMoneyState(const Value: Boolean);
    procedure SetWhipState(const Value: Boolean);
  public
    property HeartOffset : Integer read _HeartOffset write _HeartOffset;
    property MoneyOffset : Integer read _MoneyOffset write _MoneyOffset;
    property WhipOffset : Integer read _WhipOffset write _WhipOffset;
    property CastleDoorOffset : Integer read _CastleDoorOffset write _CastleDoorOffset;
    property InvulnerabilityJar1Offset : Integer read _InvulnerabilityJar1Offset write _InvulnerabilityJar1Offset;
    property InvulnerabilityJar2Offset : Integer read _InvulnerabilityJar2Offset write _InvulnerabilityJar2Offset;
    property DoorOpeningOffset : Integer read _DoorOpeningOffset write _DoorOpeningOffset;
    property HiddenItemOffset : Integer read _HiddenItemOffset write _HiddenItemOffset;
    property ClrScrOffset : Integer read _ClrScrOffset write _ClrScrOffset;
    property ExtraLifeOffset : Integer read _1UPOffset write _1UPOffset;
    property SoundHeart : Boolean read GetHeartState write SetHeartState;
    property SoundMoney : Boolean read GetMoneyState write SetMoneyState;
    property SoundWhip : Boolean read GetWhipState write SetWhipState;
    property SoundCastleDoor : Boolean read GetCastleDoorState write SetCastleDoorState;
    property SoundJar1 : Boolean read GetJar1State write SetJar1State;
    property SoundJar2 : Boolean read GetJar2State write SetJar2State;
    property SoundDoorOpening : Boolean read GetDoorOpeningState write SetDoorOpeningState;
    property SoundHiddenItem : Boolean read GetHiddenItemState write SetHiddenItemState;
    property SoundClearScreen : Boolean read GetClearScreenState write SetClearScreenState;
    property SoundExtraLife : Boolean read GetExtraLifeState write SetExtraLifeState;
  end;


  TMusicPointersTemplate = class
  private
    _Name : String;
    _Square1Val : Integer;
    _Square2Val : Integer;
    _TriangleVal : Integer;
  public
    property Name : String read _Name write _Name;
    property Square1 : Integer read _Square1Val write _Square1Val;
    property Square2 : Integer read _Square2Val write _Square2Val;
    property Triangle : Integer read _TriangleVal write _TriangleVal;
  end;

  { This is a class that will be used to store the
    music pointer templates. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TMusicPointersTemplateList = class(TObjectList)
  protected
    function GetMusicPointerTempItem(Index: Integer) : TMusicPointersTemplate;
    procedure SetMusicPointerTempItem(Index: Integer; const Value: TMusicPointersTemplate);
  public
    function Last : TMusicPointersTemplate;
    function Add(AObject: TMusicPointersTemplate) : Integer;
    property Items[Index: Integer] : TMusicPointersTemplate read GetMusicPointerTempItem write SetMusicPointerTempItem;default;
  end;

  TMusicPointers = class
  private
    _Name : String;
    _PointerOffset : Integer;
    function GetSquare1: Integer;
    function GetSquare2: Integer;
    function GetTriangle: Integer;
    procedure SetSquare1(const Value: Integer);
    procedure SetSquare2(const Value: Integer);
    procedure SetTriangle(const Value: Integer);
  public
    property Name : String read _Name write _Name;
    property PointerOffset : Integer read _PointerOffset write _PointerOffset;
    property Triangle : Integer read GetTriangle write SetTriangle;
    property Square1 : Integer read GetSquare1 write SetSquare1;
    property Square2 : Integer read GetSquare2 write SetSquare2;
  end;

  { This is a class that will be used to store the
    music pointer templates. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TMusicPointersList = class(TObjectList)
  protected
    function GetMusicPointerItem(Index: Integer) : TMusicPointers;
    procedure SetMusicPointerItem(Index: Integer; const Value: TMusicPointers);
  public
    function Last : TMusicPointers;
    function Add(AObject: TMusicPointers) : Integer;
    property Items[Index: Integer] : TMusicPointers read GetMusicPointerItem write SetMusicPointerItem;default;
  end;

implementation

uses cROM;

{ TMusicPointers }

function TMusicPointers.GetSquare1: Integer;
begin
  result := StrToInt('$' + IntToHex(ROM[_PointerOffset + 1],2) + IntToHex(ROM[_PointerOffset],2));
end;

function TMusicPointers.GetSquare2: Integer;
begin
  result := StrToInt('$' + IntToHex(ROM[_PointerOffset + 4],2) + IntToHex(ROM[_PointerOffset+3],2));
end;

function TMusicPointers.GetTriangle: Integer;
begin
  result := StrToInt('$' + IntToHex(ROM[_PointerOffset + 7],2) + IntToHex(ROM[_PointerOffset+6],2));
end;

procedure TMusicPointers.SetSquare1(const Value: Integer);
var
  SquarePointer : String;
begin
  SquarePointer := IntToHex(Value,4);
  ROM[_PointerOffset] := StrToInt('$' + SquarePointer[3] + SquarePointer[4]);
  ROM[_PointerOffset+1] := StrToInt('$' + SquarePointer[1] + SquarePointer[2]);
end;

procedure TMusicPointers.SetSquare2(const Value: Integer);
var
  SquarePointer : String;
begin
  SquarePointer := IntToHex(Value,4);
  ROM[_PointerOffset+3] := StrToInt('$' + SquarePointer[3] + SquarePointer[4]);
  ROM[_PointerOffset+4] := StrToInt('$' + SquarePointer[1] + SquarePointer[2]);

end;

procedure TMusicPointers.SetTriangle(const Value: Integer);
var
  SquarePointer : String;
begin
  SquarePointer := IntToHex(Value,4);
  ROM[_PointerOffset+6] := StrToInt('$' + SquarePointer[3] + SquarePointer[4]);
  ROM[_PointerOffset+7] := StrToInt('$' + SquarePointer[1] + SquarePointer[2]);

end;

{ TMusicPointerTemplateList }

function TMusicPointersTemplateList.Add(
  AObject: TMusicPointersTemplate): Integer;
begin
  Result := inherited Add(AObject);
end;

function TMusicPointersTemplateList.GetMusicPointerTempItem(
  Index: Integer): TMusicPointersTemplate;
begin
  Result := TMusicPointersTemplate(inherited Items[Index]);
end;

function TMusicPointersTemplateList.Last: TMusicPointersTemplate;
begin
  Result := TMusicPointersTemplate(inherited Last);
end;

procedure TMusicPointersTemplateList.SetMusicPointerTempItem(Index: Integer;
  const Value: TMusicPointersTemplate);
begin
  inherited Items[Index] := Value;
end;

{ TMusicPointersList }

function TMusicPointersList.Add(AObject: TMusicPointers): Integer;
begin
  Result := inherited Add(AObject);
end;

function TMusicPointersList.GetMusicPointerItem(
  Index: Integer): TMusicPointers;
begin
  Result := TMusicPointers(inherited Items[Index]);
end;

function TMusicPointersList.Last: TMusicPointers;
begin
  Result := TMusicPointers(inherited Last);
end;

procedure TMusicPointersList.SetMusicPointerItem(Index: Integer;
  const Value: TMusicPointers);
begin
  inherited Items[Index] := Value;
end;

{ TSoundEffects }

function TSoundEffects.GetCastleDoorState: Boolean;
begin
  if ROM[CastleDoorOffset] = $10 then
    result := true
  else
    result := false;
end;

function TSoundEffects.GetClearScreenState: Boolean;
begin
  if ROM[ClrScrOffset] = $10 then
    result := true
  else
    result := false;
end;

function TSoundEffects.GetDoorOpeningState: Boolean;
begin
  if ROM[DoorOpeningOffset] = $10 then
    result := true
  else
    result := false;
end;

function TSoundEffects.GetExtraLifeState: Boolean;
begin
  if ROM[ExtraLifeOffset] = $10 then
    result := true
  else
    result := false;
end;

function TSoundEffects.GetHeartState: Boolean;
begin
  if ROM[HeartOffset] = $10 then
    result := true
  else
    result := false;
end;

function TSoundEffects.GetHiddenItemState: Boolean;
begin
  if ROM[HiddenItemOffset] = $10 then
    result := true
  else
    result := false;
end;

function TSoundEffects.GetJar1State: Boolean;
begin
  if ROM[InvulnerabilityJar1Offset] = $10 then
    result := true
  else
    result := false;
end;

function TSoundEffects.GetJar2State: Boolean;
begin
  if ROM[InvulnerabilityJar2Offset] = $10 then
    result := true
  else
    result := false;
end;

function TSoundEffects.GetMoneyState: Boolean;
begin
  if ROM[MoneyOffset] = $10 then
    result := true
  else
    result := false;
end;

function TSoundEffects.GetWhipState: Boolean;
begin
  if ROM[WhipOffset] = $10 then
    result := true
  else
    result := false;
end;

procedure TSoundEffects.SetCastleDoorState(const Value: Boolean);
begin
  if Value = true then
    ROM[CastleDoorOffset] := $10
  else
    ROM[CastleDoorOffset] := $00;
end;

procedure TSoundEffects.SetClearScreenState(const Value: Boolean);
begin
  if Value = true then
    ROM[ClrScrOffset] := $10
  else
    ROM[ClrScrOffset] := $00;
end;

procedure TSoundEffects.SetDoorOpeningState(const Value: Boolean);
begin
  if Value = true then
    ROM[DoorOpeningOffset] := $10
  else
    ROM[DoorOpeningOffset] := $00;
end;

procedure TSoundEffects.SetExtraLifeState(const Value: Boolean);
begin
  if Value = true then
    ROM[ExtraLifeOffset] := $10
  else
    ROM[ExtraLifeOffset] := $00;
end;

procedure TSoundEffects.SetHeartState(const Value: Boolean);
begin
  if Value = true then
    ROM[HeartOffset] := $10
  else
    ROM[HeartOffset] := $00;
end;

procedure TSoundEffects.SetHiddenItemState(const Value: Boolean);
begin
  if Value = true then
    ROM[HiddenItemOffset] := $10
  else
    ROM[HiddenItemOffset] := $00;
end;

procedure TSoundEffects.SetJar1State(const Value: Boolean);
begin
  if Value = true then
    ROM[InvulnerabilityJar1Offset] := $10
  else
    ROM[InvulnerabilityJar1Offset] := $00;
end;

procedure TSoundEffects.SetJar2State(const Value: Boolean);
begin
  if Value = true then
    ROM[InvulnerabilityJar2Offset] := $10
  else
    ROM[InvulnerabilityJar2Offset] := $00;
end;

procedure TSoundEffects.SetMoneyState(const Value: Boolean);
begin
  if Value = true then
    ROM[MoneyOffset] := $10
  else
    ROM[MoneyOffset] := $00;
end;

procedure TSoundEffects.SetWhipState(const Value: Boolean);
begin
  if Value = true then
    ROM[WhipOffset] := $10
  else
    ROM[WhipOffset] := $00;
end;



end.
