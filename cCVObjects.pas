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

unit cCVObjects;

interface

uses contnrs, sysutils;

type
  TBreakableBlock = class
  private
    _X : Byte;
    _Y : Byte;
    _ItemDropped : Byte;
    _MultiAreaBit : Byte;
    _ScreenNumber : Byte;
    _Stage : Byte;
    _AppearsInSecondQuest : Byte;
    function GetUnknownBit: Boolean;
    procedure SetUnknownBit(const Value: Boolean);
    function GetMultiAreaBit: Boolean;
    procedure SetMultiAreaBit(const Value: Boolean);
  public
    property X : Byte read _X write _X;
    property Y : Byte read _Y write _Y;
    property StageNumber : Byte read _Stage write _Stage;
    property ItemDropped : Byte read _ItemDropped write _ItemDropped;
    property MultiAreaBit : Boolean read GetMultiAreaBit write SetMultiAreaBit;
    property MultiAreaBitRaw : Byte read _MultiAreaBit write _MultiAreaBit;
    property ScreenNumber : Byte read _ScreenNumber write _ScreenNumber;
    property AppearsSecondQuestOnly : Boolean read GetUnknownBit write SetUnknownBit;
    property AppearsSecondQuestOnlyRaw : Byte read _AppearsInSecondQuest write _AppearsInSecondQuest;
  end;

  TDoor = class
  private
    _Offset : Integer;

    _ScreenNumber : Integer;
    _UnknownBit1 : Byte;
    _AnimOffset : Integer; // The offset that specifies where to draw the
                     // door animation at.
    _TileAnimOffset : Integer;
    _NameTable : Integer;
    _X : Byte; // The X position of the door
    _Y : Byte; // The Y position of the door
    _AreaWithMultiple : Byte; // Used to store whether the area has
                           // multiple sections. Not used by my editor,
                           // but stored for when the doors are written
                           // back to disk.
    _AnimationY : Byte;
    _AnimUnknownBit1 : Byte;
    _AnimationMultiArea : Byte;
  public
    // The offset of the door.
    property Offset : Integer read _Offset write _Offset;
    // The screen number of the door.
    property ScreenNumber : Integer read _ScreenNumber write _ScreenNumber;
    // The offset of the door animation's Y co-ordinate.
    property AnimationOffset : Integer read _AnimOffset write _AnimOffset;
    // The offset of the door animation and its disappearing tiles.
    property TileAnimationOffset : Integer read _TileAnimOffset write _TileAnimOffset;
    // The name table that the door is using.
    property NameTable : Integer read _NameTable write _NameTable;
    // The X co-ordinate of the door.
    property X : Byte read _X write _X;
    // The Y co-ordinate of the door.
    property Y : Byte read _Y write _Y;
    // Whether the multi-area bit is set for this door.
    property MultiAreaBitSet : Byte read _AreaWithMultiple write _AreaWithMultiple;
    // The Y co-ordinate of the animation.
    property YAnimation : Byte read _AnimationY write _AnimationY;
    property UnknownBit1 : Byte read _UnknownBit1 write _UnknownBit1;
    property AnimUnknownBit1 : Byte read _AnimUnknownBit1 write _AnimUnknownBit1;
    property AnimationMultiArea : Byte read _AnimationMultiArea write _AnimationMultiArea;
  end;

  TEntrance = class
  private
    _Offset : Integer;
    _X : Integer;
    _Y : Byte;
    _ScreenID : Integer;
    _AreaWithMultiple : Byte;
    _stage: byte;
    function GetMultiAreaBit: Boolean;
    procedure SetMultiAreaBit(const Value: Boolean);
  public
    property Offset : Integer read _Offset write _Offset;
    property X : Integer read _X write _X;
    property Y : Byte read _Y write _Y;
    property ScreenID : Integer read _ScreenID write _ScreenID;
    property MultiAreaBit : Boolean read GetMultiAreaBit write SetMultiAreaBit;
    property StageNumber : Byte read _Stage write _Stage;
    property MultiAreaBitRaw : Byte read _AreaWithMultiple write _AreaWithMultiple;
  end;

  TStair = class
  private
    _X : Byte;
    _Y : Byte;
    _Direction : Byte;
    _ScreenNumber : Byte;
    _MultiAreaBit : Byte;
    _UnknownBit1 : Byte;
    _Stage : Byte;
    function GetMultiAreaBit: Boolean;
    procedure SetMultiAreaBit(const Value: Boolean);
  public
    property X : Byte read _X write _X;
    property Y : Byte read _Y write _Y;
    property Direction : Byte read _Direction write _Direction;
    property ScreenNumber : Byte read _ScreenNumber write _ScreenNumber;
    property UnknownBit1 : Byte read _UnknownBit1 write _UnknownBit1;
    property MultiAreaBit : Boolean read GetMultiAreaBit write SetMultiAreaBit;
    property MultiAreaBitRaw : Byte read _MultiAreaBit write _MultiAreaBit;
    property Stage : Byte read _Stage write _Stage;
  end;

  TNonStandardDoor = class
  private
    _Stage : Byte;
    _Offset : Integer;
    _X : Byte;
    _Y : Byte;
    _ScreenNumber : Byte;
    _WalkToXOffset : Integer;
    _WalkToX : Byte;
  public
    property Stage : Byte read _Stage write _Stage;
    property Offset : Integer read _Offset write _Offset;
    property X : Byte read _X write _X;
    property Y : Byte read _Y write _Y;
    property ScreenNumber : Byte read _ScreenNumber write _ScreenNumber;
    property WalkToXOffset : Integer read _WalkToXOffset write _WalkToXOffset;
    property WalkToX : Byte read _WalkToX write _WalkToX;
  end;

  TSpikeCrusher = class
  private
    _InitialDirection : Byte;
    _Y : Byte;
    _X : SmallInt;
    _Screen : Byte;
    _Desc1 : Byte;
    _Desc2 : Byte;
  public
    property InitialDirection : Byte read _InitialDirection write _InitialDirection;
    property Y : Byte read _Y write _Y;
    property X : SmallInt read _X write _X;
    property Screen : Byte read _Screen write _Screen;
    property Desc1 : Byte read _Desc1 write _Desc1;
    property Desc2 : Byte read _Desc2 write _Desc2;
  end;

  TFloatingPlatform = class
  private
    _UnknownByte1 : Byte;
    _DistanceSpeed : Byte;
    _UnknownByte2 : Byte;
    _NumPixels : Byte;
    _X : SmallInt;
    _Screen : Byte;
    _Y : Byte;
    _MultiAreaBit : Byte;
    _Speed : Byte;
    _Stage : Byte;
    _Offset : Integer;
    function GetMultiAreaBit: Boolean;
    procedure SetMultiAreaBit(const Value: Boolean);
  public
    property UnknownByte1 : Byte read _UnknownByte1 write _UnknownByte1;
    property UnknownByte2 : Byte read _UnknownByte2 write _UnknownByte2;
    property DistanceSpeed : Byte read _DistanceSpeed write _DistanceSpeed;
    property NumPixels : Byte read _NumPixels write _NumPixels;
    property X : SmallInt read _X write _X;
    property Screen : Byte read _Screen write _Screen;
    property Y : Byte read _Y write _Y;
    property MultiAreaBit : Boolean read GetMultiAreaBit write SetMultiAreaBit;
    property MultiAreaBitRaw : Byte read _MultiAreaBit write _MultiAreaBit;
    property Speed : Byte read _Speed write _Speed;
    property Stage : Byte read _Stage write _Stage;
    property Offset : Integer read _Offset write _Offset;
  end;

  THiddenItem = class
  private
    _Offset : Integer;
    _StageNumber : Byte;
    _X : SmallInt;
    _Y : Byte;
    _ScreenNumber : Byte;
    _MultiAreaBit : Byte;
    _SimonMustCrouch : Byte;
    _ItemType : Byte;
    _UnknownBit1 : Byte;
    function GetMultiAreaBit: Boolean;
    function GetSimonCrouch: Boolean;
    procedure SetMultiAreaBit(const Value: Boolean);
    procedure SetSimonCrouch(const Value: Boolean);
  public
    property Offset : Integer read _Offset write _Offset;
    property StageNumber : Byte read _StageNumber write _StageNumber;
    property X : SmallInt read _X write _X;
    property Y : Byte read _Y write _Y;
    property ScreenNumber : Byte read _ScreenNumber write _ScreenNumber;
    property MultiAreaBit : Boolean read GetMultiAreaBit write SetMultiAreaBit;
    property MultiAreaBitRaw : Byte read _MultiAreaBit write _MultiAreaBit;
    property SimonMustCrouch : Boolean read GetSimonCrouch write SetSimonCrouch;
    property SimonMustCrouchRaw : Byte read _SimonMustCrouch write _SimonMustCrouch;
    property ItemType : Byte read _ItemType write _ItemType;
    property UnknownBit1 : Byte read _UnknownBit1 write _UnknownBit1;
  end;

  { This is a class that will be used to store the
    hidden items. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  THiddenItemList = class(TObjectList)
  private
    function GetHiddenItem(Index: Integer): THiddenItem;
    procedure SetHiddenItem(Index: Integer; const Value: THiddenItem);
  public
    function Last : THiddenItem;
    function Add(AObject: THiddenItem) : Integer;
    property Items[Index: Integer] : THiddenItem read GetHiddenItem write SetHiddenItem;default;
  end;

  { This is a class that will be used to store the
    spike crushers. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TSpikeCrusherList = class(TObjectList)
  private
    function GetCrushItem(Index: Integer): TSpikeCrusher;
    procedure SetCrushItem(Index: Integer; const Value: TSpikeCrusher);
  public
    function Last : TSpikeCrusher;
    function Add(AObject: TSpikeCrusher) : Integer;
    property Items[Index: Integer] : TSpikeCrusher read GetCrushItem write SetCrushItem;default;
  end;

  { This is a class that will be used to store the
    entrances. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TEntranceList = class(TObjectList)
  protected
    function GetEntranceItem(Index: Integer) : TEntrance;
    procedure SetEntranceItem(Index: Integer; const Value: TEntrance);
  public
    function Last : TEntrance;
    function Add(AObject: TEntrance) : Integer;
    property Items[Index: Integer] : TEntrance read GetEntranceItem write SetEntranceItem;default;
  end;


  { This is a class that will be used to store the
    doors. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TDoorList = class(TObjectList)
  protected
    function GetDoorItem(Index: Integer) : TDoor;
    procedure SetDoorItem(Index: Integer; const Value: TDoor);
  public
    function Last : TDoor;
    function Add(AObject: TDoor) : Integer;
    property Items[Index: Integer] : TDoor read GetDoorItem write SetDoorItem;default;
  end;

  { This is a class that will be used to store the
    stairs. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TBreakableBlockList = class(TObjectList)
  protected
    function GetBlockItem(Index: Integer) : TBreakableBlock;
    procedure SetBlockItem(Index: Integer; const Value: TBreakableBlock);
  public
    function Last : TBreakableBlock;
    function Add(AObject: TBreakableBlock) : Integer;
    property Items[Index: Integer] : TBreakableBlock read GetBlockItem write SetBlockItem;default;
  end;
  { This is a class that will be used to store the
    spike crushers. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TFloatingPlatformList = class(TObjectList)
  private
    function GetFloatPlatItem(Index: Integer): TFloatingPlatform;
    procedure SetFloatPlatItem(Index: Integer; const Value: TFloatingPlatform);
  public
    function Last : TFloatingPlatform;
    function Add(AObject: TFloatingPlatform) : Integer;
    property Items[Index : Integer] : TFloatingPlatform read GetFloatPlatItem write SetFloatPlatItem;default;
  end;

  { This is a class that will be used to store the
    stairs. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TStairList = class(TObjectList)
  protected
    function GetStairItem(Index: Integer) : TStair;
    procedure SetStairItem(Index: Integer; const Value: TStair);
  public
    function Last : TStair;
    function Add(AObject: TStair) : Integer;
    property Items[Index: Integer] : TStair read GetStairItem write SetStairItem;default;
  end;
  { This is a class that will be used to store the
    non-standard doors. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TNonStandardDoorList = class(TObjectList)
  private
    function GetNonStandardDoorItem(Index: Integer): TNonStandardDoor;
    procedure SetNonStandardDoorItem(Index: Integer; const Value: TNonStandardDoor);
  public
    function Last : TNonStandardDoor;
    function Add(AObject: TNonStandardDoor) : Integer;
    property Items[Index: Integer] : TNonStandardDoor read GetNonStandardDoorItem write SetNonStandardDoorItem;default;
  end;


implementation

uses cROM;

{ TFloatingPlatform }

function TFloatingPlatform.GetMultiAreaBit: Boolean;
begin
  if _MultiAreaBit = 0 then
    result := False
  else
    result := True;
end;

procedure TFloatingPlatform.SetMultiAreaBit(const Value: Boolean);
begin
  if Value = True then
    _MultiAreaBit := 1
  else
    _MultiAreaBit := 0;
end;


{ TStair }

function TStair.GetMultiAreaBit: Boolean;
begin
  if _MultiAreaBit = 0 then
    result := false
  else
    result := True;
end;

procedure TStair.SetMultiAreaBit(const Value: Boolean);
begin
  if Value = True then
    _MultiAreaBit := 4
  else
    _MultiAreaBit := 0;
end;

{ TEntrance }

function TEntrance.GetMultiAreaBit: Boolean;
begin
  if _AreaWithMultiple = 0 then
    result := false
  else
    result := True;
end;

procedure TEntrance.SetMultiAreaBit(const Value: Boolean);
begin
  if Value = True then
    _AreaWithMultiple := 1
  else
    _AreaWithMultiple := 0;
end;

{ TBreakableBlock }

function TBreakableBlock.GetMultiAreaBit: Boolean;
begin
  if _MultiAreaBit > 0 then
    result := true
  else
    result := false;
end;

function TBreakableBlock.GetUnknownBit: Boolean;
begin
  if self._AppearsInSecondQuest > 0 then
    result := true
  else
    result := false;
end;

procedure TBreakableBlock.SetMultiAreaBit(const Value: Boolean);
begin
  if Value = true then
    self._MultiAreaBit :=8
  else
    self._MultiAreaBit := 0;
end;

procedure TBreakableBlock.SetUnknownBit(const Value: Boolean);
begin
  if value = true then
    self._AppearsInSecondQuest := 8
  else
    self._AppearsInSecondQuest := 0;
end;

{ THiddenItem }

function THiddenItem.GetMultiAreaBit: Boolean;
begin
  if self._MultiAreaBit > 0 then
    result := true
  else
    result := false;
end;

function THiddenItem.GetSimonCrouch: Boolean;
begin

end;

procedure THiddenItem.SetMultiAreaBit(const Value: Boolean);
begin

end;

procedure THiddenItem.SetSimonCrouch(const Value: Boolean);
begin

end;

{ TDoorList }

function TDoorList.Add(AObject: TDoor): Integer;
begin
  Result := inherited Add(AObject);
end;

function TDoorList.GetDoorItem(Index: Integer): TDoor;
begin
  Result := TDoor(inherited Items[Index]);
end;

function TDoorList.Last: TDoor;
begin
  Result := TDoor(inherited Last);
end;

procedure TDoorList.SetDoorItem(Index: Integer; const Value: TDoor);
begin
  inherited Items[Index] := Value;
end;

{ TStairList }

function TStairList.Add(AObject: TStair): Integer;
begin
  Result := inherited Add(AObject);
end;

function TStairList.GetStairItem(Index: Integer): TStair;
begin
  Result := TStair(inherited Items[Index]);
end;

function TStairList.Last: TStair;
begin
  Result := TStair(inherited Last);
end;

procedure TStairList.SetStairItem(Index: Integer; const Value: TStair);
begin
  inherited Items[Index] := Value;
end;

{ TEntranceList }

function TEntranceList.Add(AObject: TEntrance): Integer;
begin
  Result := inherited Add(AObject);
end;

function TEntranceList.GetEntranceItem(Index: Integer): TEntrance;
begin
  Result := TEntrance(inherited Items[Index]);
end;

function TEntranceList.Last: TEntrance;
begin
  Result := TEntrance(inherited Last);
end;

procedure TEntranceList.SetEntranceItem(Index: Integer;
  const Value: TEntrance);
begin
  inherited Items[Index] := Value;
end;

{ TBreakableBlockList }

function TBreakableBlockList.Add(AObject: TBreakableBlock): Integer;
begin
  Result := inherited Add(AObject);
end;

function TBreakableBlockList.GetBlockItem(Index: Integer): TBreakableBlock;
begin
  Result := TBreakableBlock(inherited Items[Index]);
end;

function TBreakableBlockList.Last: TBreakableBlock;
begin
  Result := TBreakableBlock(inherited Last);
end;

procedure TBreakableBlockList.SetBlockItem(Index: Integer;
  const Value: TBreakableBlock);
begin
  inherited Items[Index] := Value;
end;


{ TSpikeCrusherList }

function TSpikeCrusherList.Add(AObject: TSpikeCrusher): Integer;
begin
  Result := inherited Add(AObject);
end;

function TSpikeCrusherList.GetCrushItem(Index: Integer): TSpikeCrusher;
begin
  Result := TSpikeCrusher(inherited Items[Index]);
end;

function TSpikeCrusherList.Last: TSpikeCrusher;
begin
  Result := TSpikeCrusher(inherited Last);
end;

procedure TSpikeCrusherList.SetCrushItem(Index: Integer;
  const Value: TSpikeCrusher);
begin
  inherited Items[Index] := Value;
end;

{ TFloatingPlatformList }

function TFloatingPlatformList.Add(AObject: TFloatingPlatform): Integer;
begin
  Result := inherited Add(AObject);
end;

function TFloatingPlatformList.GetFloatPlatItem(
  Index: Integer): TFloatingPlatform;
begin
  Result := TFloatingPlatform(inherited Items[Index]);
end;

function TFloatingPlatformList.Last: TFloatingPlatform;
begin
  Result := TFloatingPlatform(inherited Last);
end;

procedure TFloatingPlatformList.SetFloatPlatItem(Index: Integer;
  const Value: TFloatingPlatform);
begin
  inherited Items[Index] := Value;
end;

{ TNonStandardDoorList }

function TNonStandardDoorList.Add(AObject: TNonStandardDoor): Integer;
begin
  Result := inherited Add(AObject);
end;

function TNonStandardDoorList.GetNonStandardDoorItem(
  Index: Integer): TNonStandardDoor;
begin
  Result := TNonStandardDoor(inherited Items[Index]);
end;

function TNonStandardDoorList.Last: TNonStandardDoor;
begin
  Result := TNonStandardDoor(inherited Last);
end;

procedure TNonStandardDoorList.SetNonStandardDoorItem(Index: Integer;
  const Value: TNonStandardDoor);
begin
  inherited Items[Index] := Value;
end;

{ THiddenItemList }

function THiddenItemList.Add(AObject: THiddenItem): Integer;
begin
  Result := inherited Add(AObject);
end;

function THiddenItemList.GetHiddenItem(Index: Integer): THiddenItem;
begin
  Result := THiddenItem(inherited Items[Index]);
end;

function THiddenItemList.Last: THiddenItem;
begin
  Result := THiddenItem(inherited Last);
end;

procedure THiddenItemList.SetHiddenItem(Index: Integer;
  const Value: THiddenItem);
begin
  inherited Items[Index] := Value;
end;

end.
