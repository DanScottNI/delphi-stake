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

unit cCVROM;

interface

uses Forms,dialogs,Sysutils, Gr32,classes,MemINIHexFile,uEnemyType,
  ImgList, jclFileUtils, gr32_image, cMusic, Contnrs,
  ctitlescreen, cMisc, cCVObjects;

 type

  TEnemy = class
  private
    _Offset : Integer;
    _EnemyType : TEnemyType;
    _X : Byte;
    _Y : Byte;
    _Type : Byte;
  public
    constructor Create(pPointerOffset : Integer);
    property EnemyType : TEnemyType read _EnemyType write _EnemyType;
    property Offset : Integer read _Offset write _Offset;
    property X : Byte read _X write _X;
    property Y : Byte read _Y write _Y;
    property EnemyItem : Byte read _Type write _Type;
  end;


  TEnemyData = record
//    Offset : Integer;
    PointerOffset : Integer;
    Count : Integer;
  end;

  TCVScreen = class
  private
    _id : Integer;
    // This is the length of the level position
    // +1 is usually the start of the data.
    _Offset : Integer;
    _StageNumber : Integer;
    _ScreenNumber : Integer;
    _EnemyList : Integer;
    _X : Integer;
    _Y : Integer;
    _MultiAreaBit : Boolean;
    _Enabled : Boolean;
  public
    property ID : Integer read _ID write _ID;
    property Offset : Integer read _Offset write _Offset;
    property XPos : Integer read _X write _X;
    property YPos : Integer read _Y write _Y;
    property StageNumber : Integer read _StageNumber write _StageNumber;
    property ScreenNumber : Integer read _ScreenNumber write _ScreenNumber;
    property MultiAreaBit : Boolean read _MultiAreaBit write _MultiAreaBit;
    property EnemyList : Integer read _EnemyList write _EnemyList;
    property Enabled : Boolean read _Enabled write _Enabled;
  end;

  { This is a class that will be used to store the
    entrances. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TScreenList = class(TObjectList)
  protected
    function GetScreenItem(Index: Integer) : TCVScreen;
    procedure SetScreenItem(Index: Integer; const Value: TCVScreen);
  public
    function Last : TCVScreen;
    function Add(AObject: TCVScreen) : Integer;
    property Items[Index: Integer] : TCVScreen read GetScreenItem write SetScreenItem;default;
  end;

  TLevel = class
  private
    _Name : String;
    _BGPalOffset : Integer;
    _TSAOffset : Integer;
    _GFXOffset : Integer;
    _NumberOfTiles : Byte;
    _NumberOfScreens : Byte;
    _Length : Byte;
    _Height : Byte;
    _StartX : Byte;
    _StartY : Byte;
    _NumberOfStages : Byte;
    _NumberOfDoors : Integer;
    _NumberOfEntrances : Integer;
    _NumberOfSpikeCrushers : Integer;
    _NumberOfFloatingPlatformSets : Integer;
    _NumberOfNonStandardDoors : Integer;
    _SpikeCrusherOffset : Integer;
    _SpikeCrusherStage : Byte;
    _StairPointers : Array Of Integer;
    _BreakableBlockPointers : Array Of Integer;
    _HiddenItemPointers : Array Of Integer;
    _TimeOffsets : Array Of Integer;
    _BossOffsets : Array Of Integer;
    _NumberOfEnemySets : Integer;
    _EnemyOffsets : Array Of TEnemyData;
    function GetTimeVal(Index: Integer): Byte;
    procedure SetTimeVal(Index: Integer; const Value: Byte);
    function GetBossVal(Index: Integer): Byte;
    procedure SetBossVal(Index: Integer; const Value: Byte);
  public
    // The stairs that are in the level.
    Stairs : TStairList;
    // The doors that are in the level.
    Doors : TDoorList;
    // Breakable blocks
    BreakableBlocks : TBreakableBlockList;
    // The entrances that are in the level.
    Entrances : TEntranceList;
    // The screens that are in the level.
    Screens : TScreenList;
    // The spike crushers that are in a level.
    SpikeCrushers : TSpikeCrusherList;
    // The floating platforms that are in a level.
    FloatingPlatforms : TFloatingPlatformList;
    // The non-standard doors that are in a level.
    NonStandardDoors : TNonStandardDoorList;
    // The hidden items that are in the level.
    HiddenItems : THiddenItemList;
    // The name of the level.
    property Name : String read _Name write _Name;
    property TimeVal[Index: Integer] : Byte read GetTimeVal write SetTimeVal;
    property BossVal[Index: Integer] : Byte read GetBossVal write SetBossVal;
    // The length of the level.
    property Length : Byte read _Length write _Length;
    // The height of the level.
    property Height : Byte read _Height write _height;
    // The number of tiles in the level.
    property NumberOfLevelTiles : Byte read _NumberOfTiles write _NumberOfTiles;
    // The number of stages in the level.
    property NumberOfStages : Byte read _NumberOfStages write _NumberOfStages;
    // The offset of the palette for the level.
    property BGPaletteOffset : Integer read _BGPalOffset write _BGPalOffset;
    // The offset of the TSA for the level.
    property TSAOffset : Integer read _TSAOffset write _TSAOffset;
    // The offset of the pattern table for the level.
    property GFXOffset : Integer read _GFXOffset write _GFXOffset;
    // The start X of the level.
    property StartX : Byte read _StartX write _StartX;
    // The start Y of the level.
    property StartY : Byte read _StartY write _StartY;
    // The number of enemy points in the level.
    property NumberOfEnemySets : Integer read _NumberOfEnemySets write _NumberOfEnemySets;
    // The number of screens in the level.
    property NumberOfScreens : Byte read _NumberOfScreens write _NumberOfScreens;
    function GetEnemyDataOffset(pScreenID : Integer) : Integer;
    function GetEnemyDataPointer(pScreenID : Integer) : String;
    function GetEnemyDataPointerOffset(pScreenID : Integer) : Integer;
    destructor Destroy;override;
  end;

  { This is a class that will be used to store the
    levels. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TLevelList = class(TObjectList)
  protected
    _CurrentLevel : Integer;
    function GetCurrentLevel: Integer;
    procedure SetCurrentLevel(const Value: Integer);
    function GetLevelItem(Index: Integer) : TLevel;
    procedure SetLevelItem(Index: Integer; const Value: TLevel);
  public
    function Add(AObject: TLevel) : Integer;
    property Items[Index: Integer] : TLevel read GetLevelItem write SetLevelItem;default;
    property CurrentLevel : Integer read GetCurrentLevel write SetCurrentLevel;
  end;

  { This is a class that will be used to store the
    enemies. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TEnemyList = class(TObjectList)
  private
    function GetEnemyItem(Index: Integer): TEnemy;
    procedure SetEnemyItem(Index: Integer; const Value: TEnemy);
  public
    function Last : TEnemy;
    function Add(AObject: TEnemy) : Integer;
    function NumberOfEnemies : integer;
    function NumberOfCandleStands : Integer;
    function NumberOfCandles : Integer;
    function NumberOfEnemiesFilter(pIndex : Integer) : integer;
    function NumberOfCandleStandsFilter(pIndex : Integer) : Integer;
    function NumberOfCandlesFilter(pIndex : Integer) : Integer;
    property Items[Index: Integer] : TEnemy read GetEnemyItem write SetEnemyItem;default;
  end;

  TCVROM = class
  private
//    _CurrentLevel : TLevel;
    _SprPalOffset : Integer;
    _CastleMapPalOffset : Integer;
    _PatternTableItems : Integer;
    _PatternTableStatusbar : Integer;
    _Palette : Array [0..7,0..3] of Byte;
    _PatternTable : Array [0.. 4095] of Byte;
    _Level : Integer;
    _Screen : Integer;
    _ScreenData : Array [0 .. 7, 0..5] of Byte;
    _DrawBlock : Array [0..255] of Boolean;
    _Tiles : TBitmap32;
    _NumberOfLevels : Integer;
    _Map : Array Of Array Of Byte;
    _SPFFolder : String;
    _StairsFreeSpace : Integer;
    _BreakableBlocksFreeSpace : Integer;
    _EnemyPointer : Integer;
    _NumberOfEnemies : Integer;
    _DisableTitleScreen : Boolean;
    _EnemyData : Array Of Byte;
    procedure SetupMap();
    procedure LoadScreenData();
    procedure SetLevel(pLevel : Integer);
    function GetLevel(): Integer;
//    procedure DrawCVTile(pOffset: Integer; pBitmap: TBitmap32; pX, pY,
//      pPalOffset, pDefaultColour: Integer);overload;
    procedure DrawCVTile(pOffset: Integer; pBitmap: TBitmap32; pX, pY,
      pIndex: Integer);overload;
    procedure DrawLevelTile(pTileNumber: Byte);
    procedure LoadPatternTable();
    procedure DumpPatternTable(pFilename: String);
    function GetNumberOfTiles: Integer; // Not required.
    procedure SaveScreenData;
    procedure LoadStairsData;
    procedure SaveStairsData;
    procedure LoadSpikeCrushersData;
    procedure SaveSpikeCrushersData;
    procedure LoadFloatingPlatformData;
    procedure SaveFloatingPlatformData;
    procedure LoadDoorsData;
    procedure LoadEntranceData;
    procedure SaveDoorsData;
    procedure SaveEntranceData;
    function GetScreen: Integer;
    procedure SetScreen(const Value: Integer);
    function GetMapHeight: Integer;
    function GetMapWidth: Integer;
    function GetLevelName: String;
    function GetNumberOfStairs: Integer;
    function GetLevelStartX: Integer;
    function GetLevelStartY: Integer;
    function GetFilename: String;
    procedure LoadBreakableBlocksData;
    function GetNumberOfBreakableBlocks: Integer;
    procedure SaveBreakableBlocksData;
    procedure LoadNonDoors;
    procedure SaveNonDoors;
    function GetEnemyArrData(index: Integer): Byte;
    procedure SetEnemyArrData(index: Integer; const Value: Byte);
    function GetEnemyDataSize: Integer;
    function GetPalVal(index1, index2: Integer): Byte;
    procedure SetPalVal(index1, index2: Integer; const Value: Byte);
    function GetMapVal(index1, index2: Integer): Byte;
    procedure SetMapVal(index1, index2: Integer; const Value: Byte);
    function GetScreenData(index1, index2: Integer): Byte;
    procedure SetScreenData(index1, index2: Integer; const Value: Byte);
    procedure LoadHiddenItemsData;
    procedure SaveHiddenItemsData;
    function GetNumberOfHiddenItems: Integer;
    procedure SetChanged(pChanged : Boolean);
    function GetChanged() : Boolean;
  public
    CurrLevel : TLevel;
    Levels : TLevelList;
    SoundEffects : TSoundEffects;
    Statistics : TStatistics;
    CurrentPalette : Array [0..15] of Byte;
    TitleScreen : TTitleScreen;
    CastleIntro : TExTitleScreen;
    Ending : TEndTitleScreen;
    MusicPointers : TMusicPointersList;
    MusicPointersTemplate : TMusicPointersTemplateList;
    Damage : TDamage;
    Enemies :TEnemyList;
    IntroExpansion : TIntroExpansion;
    constructor Create(pROMFileName,pDataFileName : string); overload;
    destructor Destroy;override;
    // functions
    function AddNewStair: Integer;
    function AddNewBreakableBlock : Integer;
    function DrawTileSelector(pIndex: Integer; pBitmap: TBitmap32): Boolean;
    function EditTSA(pBlock, pTileIndex1, pTileIndex2: Integer;
      pNewTile: Byte): Integer;
    function Export8x8Pat(pID: Integer) : T8x8Graphic;
    function GetBreakableBlockUnderMouse(pX, pY: Integer): Integer;
    function GetBreakableBlockXY(pStairID : Integer;pXY : Byte):Integer;
    function GetCurrentScreenXYPos(pXY : Byte): Integer;
    function GetDoorUnderMouse(pX,pY: Integer): Integer;
    function GetDoorXY(pXY,pDoorID: Integer): Integer;
    function GetNonDoorUnderMouse(pX,pY: Integer): Integer;
    function GetNonDoorXY(pXY,pDoorID: Integer): Integer;
    function GetEntranceUnderMouse(pX,pY : integer) : Integer;
    function GetEntranceXY(pXY: Byte; pEntranceID : Integer): Integer;
    function GetNumberOfBrBlocksInCurrentStage(): Byte;
    function GetSpikeCrusherUnderMouse(pX, pY: Integer): Integer;
    function GetSpikeCrusherXY(pStairID : Integer;pXY : Byte):Integer;
    function GetFloatingPlatformUnderMouse(pX, pY: Integer): Integer;
    function GetFloatingPlatformXY(pStairID : Integer;pXY : Byte):Integer;
    function GetStageID: Integer;
    function GetStairUnderMouse(pX, pY: Integer): Integer;
    function GetStairXY(pStairID : Integer;pXY : Byte):Integer;
    function IncrementBlockAttributes(pBlock, pTileIndex1,
      pTileIndex2: Integer): Integer;
    function IsCVROM : Boolean;
    function MemoryMapper : Byte;
    function MemoryMapperStr : String;
    function PRGCount : Byte;
    function CHRCount : Byte;
    function FileSize : Integer;
    function ReturnColor32NESPal(pElement: Integer): TColor32;
    function Save : boolean;
    // Procedures
    procedure DeleteStair(pID : Integer);
    procedure DeleteBreakableBlock(pID : Integer);
    procedure DrawCurrentScreen(pBitmap: TBitmap32; pImageList : TBitmap32List;pDrawOptions : Byte);
    procedure DrawEnemies(pBitmap :TBitmap32;pItemIndex,pIndex: Integer);
    procedure DrawCandles(pBitmap :TBitmap32;pItemIndex,pIndex: Integer);
    procedure DrawCandlestand(pBitmap :TBitmap32;pItemIndex,pIndex: Integer);
    procedure DrawMap(pBitmap : TBitmap32);
    procedure DrawPatternTable(pBitmap: TBitmap32; pPal: Integer);
    procedure EraseTile(pTileID: Byte);
    procedure ExportLevel(pFilename : String; pId: Integer; pAllow : Byte);
    procedure GetScreenStairs(pStringList: TStringList; pStairID: Integer);
    procedure GetStageScreenNumbers(pStringList : TStringList);
    procedure GetScreenBrBlocks(pStringList: TStringList; pBlockID: Integer);
    procedure GetScreenSpikeCrushers(pStringList: TStringList;
      pCrusherID: Integer);
    procedure GetScreenFloatingPlatform(pStringList: TStringList;
      pFloatID: Integer);
    procedure Import8x8Pat(pID : Integer; p8x8 : T8x8Graphic);
    procedure ImportLevel(pFilename: String);
    procedure IncrementStairDirection(pStairID: Integer);
    procedure IncrementBrBlockItem(pBlockID : Integer);
    procedure LevelName (pStringList : TStringList);
    procedure LoadCurrentPalette();
    procedure LoadDataFile(pFilename : String);
    Procedure LoadDefaultPalette();
    procedure LoadEnemyData;
    procedure LoadEnemyPosData;
    procedure LoadPaletteFile(pFilename : String);
    procedure LoadSpritePalette();
    procedure RefreshOnScreenTiles(pTileSelectorValue: Byte);

    procedure SaveCurrentPalette();
    procedure SaveEnemyData;
    procedure SaveEnemyPosData;
    procedure SaveSpritePalette();
    procedure SavePatternTable;
    procedure SetDoorXY(pDoorID,pX,pY : Integer);
    procedure SetNonDoorXY(pDoorID,pX,pY : Integer);
    procedure SetEntranceXY(pX,pY,pEntranceID : Integer);
    procedure SetStairsXY(pStairID: Integer; pX, pY: Integer);
    procedure SetBreakableBlockXY(pStairID: Integer; pX, pY: Integer);
    procedure SetSpikeCrusherXY(pStairID: Integer; pX, pY: Integer);
    procedure SetFloatingPlatformXY(pPlatID: Integer; pX, pY: Integer);
    procedure TestTileDrawing;
    // Properties
    property AreaName : String read GetLevelName;
    property DisableTitleScreen : Boolean read _DisableTitleScreen write _DisableTitleScreen;
    property EnemyData[index : Integer] : Byte read GetEnemyArrData write SetEnemyArrData;
    property EnemyDataSize : Integer read GetEnemyDataSize;
    property Filename : String read GetFilename;
    property Level : Integer read GetLevel write SetLevel;
    property LevelStartX : Integer read GetLevelStartX;
    property LevelStartY : Integer read GetLevelStartY;
    property MapHeight : Integer read GetMapHeight;
    property MapWidth : Integer read GetMapWidth;
    property Map [index1 : Integer; index2 : Integer] : Byte read GetMapVal write SetMapVal;
    property NumberOfBreakableBlocks : Integer read GetNumberOfBreakableBlocks;
    property NumberOfHiddenItems : Integer read GetNumberOfHiddenItems;
    property NumberOfEnemies : Integer read _NumberOfEnemies;
    property NumberOfStairs : Integer read GetNumberOfStairs;
    property NumberOfTiles : Integer read GetNumberOfTiles;
    property Palette [index1 : Integer;index2: Integer] : Byte read GetPalVal write SetPalVal;
    property ScreenID : Integer read GetScreen write SetScreen;
    property ScreenData [index1 : Integer;index2 : Integer] : Byte read GetScreenData write SetScreenData;
    property SPFFolder : String read _SPFFolder write _SPFFolder;
    property Changed : Boolean read GetChanged write SetChanged;
  end;

implementation

uses CROM, iNESImage;

{ TCVROM }

const
  MAXSTAIRSINSTAGE : Integer = 30;
  MAXBRBLOCKSINSTAGE : Integer = 5;
  // Draw Options
  DRAWOPTSTAIRS : Byte = 1;
  DRAWOPTENTRANCES : Byte = 2;
  DRAWOPTDOORS : Byte = 4;
  DRAWOPTFLOATINGPLATFORMS : Byte = 8;
  DRAWOPTBREAKABLEBLOCKS : Byte = 16;
  DRAWOPTSPIKECRUSHERS : Byte = 32;
  DRAWOPTHIDDENITEMS : Byte = 64;
  DRAWOPTHORIZONTALBAR : Byte = 128;
  // Export options
  EXPORTLEVELS : Byte = 1;
  EXPORTTSA : Byte = 2;
  EXPORTGRAPHICS : Byte = 4;
  EXPORTPALETTE : Byte = 8;
  EXPORTENEMYDATA : Byte = 16;

var
  StageColours : Array [0..6] of TColor32 = (
  clBlue32,clRed32,clFuchsia32,clYellow32,clAqua32,clPurple32, clGray32);

constructor TCVROM.Create(pROMFileName, pDataFileName: string);
begin
  if ROM <> nil then
    FreeAndNil(ROM);
  ROM := TiNESImage.Create(pROMFilename);

  LoadDataFile(pDataFileName);

  _tiles := TBitmap32.Create;
  try
    _tiles.width := 8192;
    _tiles.Height := 32;
  except
    freeandNil(_Tiles);
  end;

  _Screen := -1;
  LoadStairsData();
  LoadBreakableBlocksData();
  LoadHiddenItemsData();
  LoadEnemyPosData();

end;

function TCVROM.GetLevel: Integer;
begin
  result := _Level;
end;

procedure TCVROM.LoadDataFile(pFilename: String);
var
  ini : TMemINIHexFile;
  i,x,z,Num : Integer;
  LevelLoad :TLevel;
  ScreenLoad : TCVScreen;
  Door : TDoor;
  Entrance : TEntrance;
  MusicPointer : TMusicPointers;
  MusPointTemp : TMusicPointersTemplate;
  NonDoor : TNonStandardDoor;
  TGFX : TExTitleScreenGFX;
begin
  ini := TMemINIHexFile.Create(pFilename);
  try
    _CastleMapPalOffset := INI.ReadHexValue('General','CastleMapPal');
    _SprPalOffset := INI.ReadHexValue('General','SpritePalette');
    _PatternTableStatusbar := INI.ReadHexValue('General','StatusBarGFX');
    _PatternTableItems := INI.ReadHexValue('General','ItemsGFX');
    _SPFFolder := INI.ReadString('SPF','Folder');
    Levels := TLevelList.Create(True);
    _StairsFreeSpace := INI.ReadHexValue('General','StairsFreeSpace');
    _BreakableBlocksFreeSpace := INI.ReadHexValue('General','BreakableBlocksFreeSpace');
    // Now load in the number of levels to load
    _NumberOfLevels := INI.ReadInteger('General','NumberOfLevels');

    // Load in the sound effects.
    SoundEffects := TSoundEffects.Create;
    SoundEffects.HeartOffset := INI.ReadHexValue('SoundEffectToggles','Heart');
    SoundEffects.MoneyOffset := INI.ReadHexValue('SoundEffectToggles','Money');
    SoundEffects.WhipOffset := INI.ReadHexValue('SoundEffectToggles','Whip');
    SoundEffects.CastleDoorOffset := INI.ReadHexValue('SoundEffectToggles','CastleDoor');
    SoundEffects.InvulnerabilityJar1Offset := INI.ReadHexValue('SoundEffectToggles','InvulnerabilityJar1');
    SoundEffects.InvulnerabilityJar2Offset := INI.ReadHexValue('SoundEffectToggles','InvulnerabilityJar2');
    SoundEffects.DoorOpeningOffset := INI.ReadHexValue('SoundEffectToggles','DoorOpening');
    SoundEffects.HiddenItemOffset := INI.ReadHexValue('SoundEffectToggles','HiddenItem');
    SoundEffects.ClrScrOffset := INI.ReadHexValue('SoundEffectToggles','ClrScr');
    SoundEffects.ExtraLifeOffset := INI.ReadHexValue('SoundEffectToggles','1UP');

    // Load in the title screen data
    TitleScreen := TTitleScreen.Create;
    _DisableTitleScreen := INI.ReadBool('TitleScreen','Disable',False);
    TitleScreen.PointerOffset := INI.ReadHexValue('TitleScreen','Pointers');
    TitleScreen.PaletteOffset := INI.ReadHexValue('TitleScreen','Palette');
    TitleScreen.PatternTableOffset := INI.ReadHexValue('TitleScreen','PatternTable');
    TitleScreen.OriginalCompressedSize := INI.ReadInteger('TitleScreen','OriginalCompressedSize');
    TitleScreen.FreeSpace := INI.ReadHexValue('TitleScreen','TitleScreenFreeSpace');
    TitleScreen.OriginalOffset := INI.ReadHexValue('TitleScreen','OriginalTitleScreenOffset');

    // Load in the intro expansion data.
    IntroExpansion := TIntroExpansion.Create;
    IntroExpansion.IntroGFXOffset := INI.ReadHexValue('IntroExpansion','IntroGFXOffset');
    IntroExpansion.NewIntroGFXOffset := INI.ReadHexValue('IntroExpansion','NewIntroGFXOffset');
    IntroExpansion.IntroDataOffset := INI.ReadHexValue('IntroExpansion','IntroDataOffset');
    IntroExpansion.NewIntroDataOffset := INI.ReadHexValue('IntroExpansion','NewIntroDataOffset');
    IntroExpansion.IntroPointerOffset := INI.ReadHexValue('IntroExpansion','IntroPointer');
    IntroExpansion.CHRRAMSettingsOffset := INI.ReadHexValue('IntroExpansion','CHRRAMSettings');

    // Load in the castle intro data
    CastleIntro := TExTitleScreen.Create;
    CastleIntro.PointerOffset := INI.ReadHexValue('CastleIntro','Pointers');
    CastleIntro.PaletteOffset := INI.ReadHexValue('CastleIntro','Palette');
    CastleIntro.PatternTableOffset := INI.ReadHexValue('CastleIntro','PatternTable');
    CastleIntro.OriginalCompressedSize := INI.ReadInteger('CastleIntro','OriginalCompressedSize');
    CastleIntro.FreeSpace := INI.ReadHexValue('CastleIntro','TitleScreenFreeSpace');
    CastleIntro.OriginalOffset := INI.ReadHexValue('CastleIntro','OriginalTitleScreenOffset');
    CastleIntro.NumOfGFX := INI.ReadInteger('CastleIntro','NumOfGFX');
    CastleIntro.SetGFXLength(CastleIntro.NumOfGFX);
    for i := 0 to CastleIntro.NumOfGFX -1 do
    begin
      TGFX := CastleIntro.GFX[i];
      TGFX.StartTile := INI.ReadHexValue('CastleIntro','GFX' + IntToStr(i+1) + 'PPU');
      TGFX.Offset := INI.ReadHexValue('CastleIntro','GFX' + IntToStr(i+1) + 'Offset');
      TGFX.NumOfTiles := INI.ReadInteger('CastleIntro','GFX' + IntToStr(i+1) + 'Num');
      CastleIntro.GFX[i] := TGFX;
    end;

    // Load in the ending data
    Ending := TEndTitleScreen.Create;
    Ending.PointerOffset := INI.ReadHexValue('Ending','Pointers');
    Ending.PaletteOffset := INI.ReadHexValue('Ending','Palette');
    Ending.PatternTableOffset := INI.ReadHexValue('Ending','PatternTable');
    Ending.OriginalCompressedSize := INI.ReadInteger('Ending','OriginalCompressedSize');
    Ending.FreeSpace := INI.ReadHexValue('Ending','TitleScreenFreeSpace');
    Ending.OriginalOffset := INI.ReadHexValue('Ending','OriginalTitleScreenOffset');
    Ending.NumOfGFX := INI.ReadInteger('Ending','NumOfGFX');
    ending.TextColourOffset := INI.ReadHexValue('Ending','TextColourOffset');
    ending.SetGFXLength(Ending.NumOfGFX);
    for i := 0 to Ending.NumOfGFX -1 do
    begin
      TGFX := Ending.GFX[i];
      TGFX.StartTile := INI.ReadHexValue('Ending','GFX' + IntToStr(i+1) + 'PPU');
      TGFX.Offset := INI.ReadHexValue('Ending','GFX' + IntToStr(i+1) + 'Offset');
      TGFX.NumOfTiles := INI.ReadInteger('Ending','GFX' + IntToStr(i+1) + 'Num');
      Ending.GFX[i] := TGFX;
    end;
    Ending.EndingTextPointerOffset := INI.Readhexvalue('Ending','TextPointersOffset');
    Ending.NumberOfText := INI.ReadInteger('Ending','NumberOfText');

    // Load in the statistics data
    Statistics := TStatistics.Create;
    Statistics.StartingHeartsOffset := INI.ReadHexValue('Statistics','StartingHearts');
    Statistics.StartingLivesOffset := INI.ReadHexValue('Statistics','StartingLives');
    Statistics.SmallHeartsOffset := INI.ReadHexValue('Statistics','SmallHeartValue');
    Statistics.BigHeartsOffset := INI.ReadHexValue('Statistics','BigHeartValue');
    Statistics.ClockCostOffset := INI.ReadHexValue('Statistics','ClockCost');

    // Load in the damage values
    Damage := TDamage.Create;
    Damage.Stage1to6Offset := INI.ReadHexValue('Damage','Stage1to6');
    Damage.Stage7to11Offset := INI.ReadHexValue('Damage','Stage7to11');
    Damage.Stage12plusOffset := INI.ReadHexValue('Damage','Stage12Plus');
    Damage.MeatOffset := INI.ReadHexValue('Damage','Meat');

    // load in the music pointers
    MusicPointers := TMusicPointersList.Create(true);
    Num := INI.ReadInteger('MusicPointers','NumberOfPointers');
    for i := 1 to num do
    begin
      MusicPointers.Add(TMusicPointers.Create);
      MusicPointer := MusicPointers.Last;
      MusicPointer.Name := INI.ReadString('MusicPointers','MusicPointer' + IntToStr(i) + 'Name');
      MusicPointer.PointerOffset := INI.ReadHexValue('MusicPointers','MusicPointer'+IntToStr(i));
    end;

    // load in the music pointers
    MusicPointersTemplate := TMusicPointersTemplateList.Create(true);
    Num := INI.ReadInteger('MusicTemplate','NumberOfTemplates');
    for i := 1 to num do
    begin
      MusicPointersTemplate.Add(TMusicPointersTemplate.Create);
      MusPointTemp := MusicPointersTemplate.Last;
      MusPointTemp.Name := INI.ReadString('MusicTemplate','MusicTemplate' + IntToStr(i) + 'Name');
      MusPointTemp.Square1 := INI.ReadHexValue('MusicTemplate','MusicTemplate' + IntToStr(i) + 'Square1');
      MusPointTemp.Square2 := INI.ReadHexValue('MusicTemplate','MusicTemplate' + IntToStr(i) + 'Square2');
      MusPointTemp.Triangle := INI.ReadHexValue('MusicTemplate','MusicTemplate' + IntToStr(i) + 'Triangle');
    end;

    // Now load in the enemy pointer
    _EnemyPointer := INI.ReadHexValue('EnemyDataTable','PointerOffset');
    _NumberOfEnemies  := INI.ReadInteger('EnemyDataTable','AmountOfEnemies');

    // Now loop through all the blocks
    for i := 0 to _NumberOfLevels - 1 do
    begin
      Levels.Add(TLevel.Create);
      LevelLoad := TLevel(levels.last);

      LevelLoad.Name := INI.ReadString('Level' + IntToStr(i),'LevelName');
      LevelLoad.GFXOffset  := INI.ReadHexValue('Level' + IntToStr(i),'GFXOffset');
      LevelLoad.BGPaletteOffset := INI.ReadHexValue('Level' + IntToStr(i),'PaletteOffset');
      LevelLoad.TSAOffset := INI.ReadHexValue('Level' + IntToStr(i),'TSAOffset');
      LevelLoad.NumberOfLevelTiles := INI.ReadHexValue('Level' + IntToStr(i),'NumOfTiles');
      LevelLoad.NumberOfScreens := INI.ReadInteger('Level' + IntToStr(i),'NumOfScreens');
      LevelLoad.Length := INI.ReadInteger('Level' + IntToStr(i),'LevelLen');
      LevelLoad.Height := INI.ReadInteger('Level' + IntToStr(i),'LevelHei');
      LevelLoad.StartX := INI.ReadInteger('Level' + IntToStr(i),'LevelStartX');
      LevelLoad.StartY := INI.ReadInteger('Level' + IntToStr(i),'LevelStartY');

      LevelLoad._NumberOfEnemySets := INI.ReadInteger('Level' + IntToStr(i),'NumEnemyPoint');
      SetLength(LevelLoad._EnemyOffsets,LevelLoad._NumberOfEnemySets);
      for x := 0 to LevelLoad._NumberOfEnemySets - 1 do
      begin
//        LevelLoad._EnemyOffsets[x].Offset := INI.ReadHexValue('Level' + IntToStr(i),'Point' + IntToStr(x+1) + 'Enemy');
        LevelLoad._EnemyOffsets[x].Count  := INI.ReadInteger('Level' + IntToStr(i),'Point' + IntToStr(x+1) + 'Num');
        LevelLoad._EnemyOffsets[x].PointerOffset := INI.ReadHexValue('Level' + IntToStr(i),'Point' + IntToStr(x+1) + 'EnemyPo');
      end;
      LevelLoad._NumberOfStages := INI.ReadInteger('Level' + IntToStr(i),'NumOfStages');
      // Load in the location of the stair pointers.
      SetLength(LevelLoad._StairPointers,LevelLoad._NumberOfStages);
      for x := 0 to LevelLoad._NumberOfStages - 1 do
        LevelLoad._StairPointers[x] := INI.ReadHexValue('Level' + IntToStr(i),'Stage' + IntToStr(x+1) + 'StairPointers');
      // Load in the location of the hidden item pointers.
      SetLength(LevelLoad._HiddenItemPointers,LevelLoad._NumberOfStages);
      for x := 0 to LevelLoad._NumberOfStages - 1 do
        LevelLoad._HiddenItemPointers[x] := INI.ReadHexValue('Level' + IntToStr(i),'Stage' + IntToStr(x+1) + 'HiddenItems');
      // Load in the location of the breakable block pointers.
      SetLength(LevelLoad._BreakableBlockPointers,LevelLoad._NumberOfStages);
      for x := 0 to LevelLoad._NumberOfStages - 1 do
        LevelLoad._BreakableBlockPointers[x] := INI.ReadHexValue('Level' + IntToStr(i),'Stage' + IntToStr(x+1) + 'BrBlockPointers');
      // Load in the time offsets.
      SetLength(LevelLoad._TimeOffsets,LevelLoad._NumberOfStages);
      for x := 0 to LevelLoad._NumberOfStages - 1 do
        LevelLoad._TimeOffsets[x] := INI.ReadHexValue('Level' + IntToStr(i),'Stage' + IntToStr(x+1) + 'Time');
      // Load in the boss offsets.
      SetLength(levelload._BossOffsets,LevelLoad._NumberOfStages);
      for x := 0 to LevelLoad._NumberOfStages - 1 do
        LevelLoad._BossOffsets[x] := INI.ReadHexValue('Level' + IntToStr(i),'Stage' + IntToStr(x+1) + 'Boss');

      LevelLoad.Screens := TScreenList.Create(True);
      for x := 0 to LevelLoad._NumberOfScreens - 1 do
      begin
        LevelLoad.Screens.Add(TCVScreen.Create);
        ScreenLoad := LevelLoad.Screens.Last;
        ScreenLoad.id := x;
        ScreenLoad.Offset := INI.ReadHexValue('Level' + IntToStr(i),'Screen' + IntToStr(x) + 'Offset');
        ScreenLoad.XPos := INI.ReadInteger('Level' + IntToStr(i),'Screen' + IntToStr(x) + 'X');
        ScreenLoad.YPos := INI.ReadInteger('Level' + IntToStr(i),'Screen' + IntToStr(x) + 'Y');
        ScreenLoad.StageNumber := INI.ReadInteger('Level' + IntToStr(i),'Screen' + IntToStr(x) + 'Stage');
        ScreenLoad.ScreenNumber := INI.ReadInteger('Level' + IntToStr(i),'Screen' + IntToStr(x) + 'Screen');
        ScreenLoad.EnemyList := INI.ReadInteger('Level' + IntToStr(i),'Screen' + IntToStr(x) + 'EnemyPoint');
        ScreenLoad.MultiAreaBit := INI.ReadBool('Level' + IntToStr(i),'Screen' + IntToStr(x) + 'MultiAreaBitSet',False);
        screenload.Enabled := INI.ReadBool('Level' + IntToStr(i),'Screen' + IntToStr(x) + 'Enabled',True);
      end;

      LevelLoad._NumberOfDoors := INI.ReadInteger('Level' + IntToStr(i),'NumOfDoors');
      if LevelLoad._NumberOfDoors > 0 then
      begin
        LevelLoad.Doors := TDoorList.Create (True);
        for x := 1 to LevelLoad._NumberOfDoors do
        begin
          LevelLoad.Doors.Add(TDoor.Create);
          Door := LevelLoad.Doors.Last;
          Door.Offset := INI.ReadHexValue('Level' + IntToStr(i),'Door' + IntToStr(x) + 'Offset');
          Door.ScreenNumber := INI.ReadInteger('Level' + IntToStr(i),'Door' + IntToStr(x) + 'Screen');
          Door.AnimationOffset := INI.ReadHexValue('Level' + IntToStr(i),'Door' + IntToStr(x) + 'AnimOffset');
          Door.TileAnimationOffset := INI.ReadHexValue('Level' + IntToStr(i),'Door' + IntToStr(x) + 'TileOffset');
        end;
      end;

      LevelLoad._NumberOfEntrances := INI.ReadInteger('Level' + IntToStr(i),'NumOfEntrances');
      if LevelLoad._NumberOfEntrances > 0 then
      begin
        LevelLoad.Entrances := TEntranceList.Create (True);
        for x := 1 to LevelLoad._NumberOfEntrances do
        begin
          LevelLoad.Entrances.Add(TEntrance.Create);
          Entrance := LevelLoad.Entrances.Last;
          Entrance.Offset := INI.ReadHexValue('Level' + IntToStr(i),'Entrance' + IntToStr(x) + 'Offset');
          Entrance.StageNumber := INI.ReadInteger('Level' + IntToStr(i),'Entrance' + IntToStr(x) + 'Stage');
        end;
      end;

      // Load the location of the spike crushers from the ROM.
      // There should only be some in level 2, though.
      LevelLoad._NumberOfSpikeCrushers := INI.ReadInteger('Level' + IntToStr(i),'NumOfSpikes');
      if LevelLoad._NumberOfSpikeCrushers > 0 then
      begin
        LevelLoad._SpikeCrusherOffset := INI.ReadHexValue('Level' + IntToStr(i),'SpikeOffset');
        LevelLoad._SpikeCrusherStage := INI.ReadInteger('Level' + IntToStr(i),'SpikeStage');
      end;

      LevelLoad._NumberOfFloatingPlatformSets := INI.ReadInteger('Level' + IntToStr(i),'NumOfFloatSets');
      if LevelLoad._NumberOfFloatingPlatformSets > 0 then
      begin
        LevelLoad.FloatingPlatforms := TFloatingPlatformList.Create(True);
        for x := 0 to LevelLoad._NumberOfFloatingPlatformSets - 1 do
        begin
          num := INI.ReadInteger('Level' + IntToStr(i),'FloatPlat' + IntToStr(x+1) + 'Num');
          for z := 0 to num -1 do
          begin
            LevelLoad.FloatingPlatforms.Add(TFloatingPlatform.Create);
            LevelLoad.FloatingPlatforms.Last.Stage := INI.ReadInteger('Level' + IntToStr(i),'FloatPlat' + IntToStr(x+1) + 'Stage');
            LevelLoad.FloatingPlatforms.Last.Offset := INI.ReadHexValue('Level' + IntToStr(i),'FloatPlat' + IntToStr(x+1) + 'Offset') + (z * 8);
          end;
        end;
      end;

      LevelLoad._NumberOfNonStandardDoors := INI.ReadInteger('Level' + IntToStr(i),'NumOfNonStandardDoors',0);
      if LevelLoad._NumberOfNonStandardDoors > 0 then
      begin
        LevelLoad.NonStandardDoors := TNonStandardDoorList.Create(True);
        for x := 0 to LevelLoad._NumberOfNonStandardDoors - 1 do
        begin
          LevelLoad.NonStandardDoors.Add(TNonStandardDoor.Create);
          NonDoor := LevelLoad.NonStandardDoors.Last;
          NonDoor.Stage := INI.ReadInteger('Level' + IntToStr(i),'NonDoor' + IntToStr(x + 1) + 'Stage');
          NonDoor.Offset := INI.ReadHexValue('Level' + IntToStr(i),'NonDoor' + IntToStr(x + 1) + 'Offset');
          NonDoor.WalkToXOffset := INI.ReadHexValue('Level' + IntToStr(i),'NonDoor' + IntToStr(x + 1) + 'WalkTo');
        end;
      end;

    end;
  finally
    FreeAndNil(INI);
  end;
end;

procedure TCVROM.SetLevel(pLevel: Integer);
var
  i : Integer;
begin
  if _Screen > -1 then
  begin
    SaveScreenData();
    SaveEnemyData();
    SaveDoorsData();
    SaveStairsData();
    SaveBreakableBlocksData();
//    SaveHiddenItemsData();
    SaveEntranceData();
    SaveSpikeCrushersData();
    SaveFloatingPlatformData();
    SaveNonDoors();
  end;
  for i := 0 to 255 do
    _DrawBlock[i] := False;
//  Levels.CurrentLevel := Levels[pLevel];
  levels.CurrentLevel := pLevel;
  _Level := pLevel;
  CurrLevel := levels[_level];
  _Screen := 0;
  SetupMap;
  LoadCurrentPalette();
  LoadPatternTable();
  LoadScreenData();
  LoadEnemyData();
//  LoadStairsData();
  LoadDoorsData();
  LoadEntranceData();
  LoadSpikeCrushersData();
  LoadFloatingPlatformData();
  LoadNonDoors;
end;

procedure TCVROM.LoadPatternTable();
var
  i : Integer;
begin

  for i :=0 to 2303 do
    _PatternTable[i] := ROM[CurrLevel._GFXOffset + i];
  for i := 0 to 1023 do
    _PatternTable[i+2304] := ROM[_PatternTableItems + i];
  for i := 0 to 767 do
    _PatternTable[i+3328] := ROM[_PatternTableStatusbar + i];

end;

procedure TCVROM.SavePatternTable();
var
  i : Integer;
begin

  for i :=0 to 2303 do
    ROM[CurrLevel._GFXOffset + i] := _PatternTable[i];
  for i := 0 to 1023 do
    ROM[_PatternTableItems + i] := _PatternTable[i+2304];
  for i := 0 to 767 do
    ROM[_PatternTableStatusbar + i] := _PatternTable[i+3328];

end;

procedure TCVROM.EraseTile(pTileID : Byte);
var
  i : Integer;
begin
  for i := 0 to 15 do
    _patterntable[(pTileID * 16) + i] := 0;
end;

procedure TCVROM.DumpPatternTable(pFilename : String);
var
  Mem : TMemoryStream;
  i : Integer;
begin

  Mem := TMemoryStream.Create;
  try
    Mem.SetSize(high(_PatternTable));

    Mem.Position :=0;

    for i := 0 to mem.Size do
      Mem.Write(_PatternTable[i],1);

    Mem.SaveToFile(pFilename);
  finally
    FreeAndNil(Mem);
  end;

end;

procedure TCVROM.DrawPatternTable(pBitmap : TBitmap32; pPal : Integer);
var
  i,x : Integer;
begin
  for i := 0 to 15 do
    for x := 0 to 15 do
      DrawCVTile((i*16 + x) * 16,pBitmap,x*8,i*8,pPal);
end;

procedure TCVROM.DrawLevelTile(pTileNumber : Byte);
var
  i,x : Integer;
  TilePal : Array [0..1,0..1] Of Byte;

begin

  if assigned(_Tiles) = false then
    exit;
  TilePal[0,0] := (ROM[CurrLevel._TSAOffset +(ptilenumber*17)]) and 3;
  tilepal[0,1] := (ROM[CurrLevel._TSAOffset +(ptilenumber*17)] shr 2) and 3;
  tilepal[1,0] := (ROM[CurrLevel._TSAOffset +(ptilenumber*17)] shr 4) and 3;
  tilepal[1,1] := (ROM[CurrLevel._TSAOffset +(ptilenumber*17)] shr 6) and 3;

  for i := 0 to 3 do
    for x := 0 to 3 do
      ROM.DrawNESTile(@_PatternTable[ROM[CurrLevel._TSAOffset+ ((pTileNumber * 17)+1) + (i *4 + x)]*16] ,_tiles,(pTileNumber * 32) + x * 8,i*8,@_Palette[tilepal[i div 2,x div 2],0]);
//      DrawCVTile(ROM[CurrLevel._TSAOffset+ ((pTileNumber * 17)+1) + (i *4 + x)]*16,_Tiles,(pTileNumber * 32) + x * 8,i*8,tilepal[i div 2,x div 2]);

end;

procedure TCVROM.LoadCurrentPalette();
var
  i,x : Integer;
begin

  for i := 0 to 3 do
    for x := 0 to 3 do
      _Palette[i,x] := ROM[CurrLevel._BGPalOffset + (i*4)+x];
end;

{procedure TCVROM.DrawCVTile(pOffset: Integer; pBitmap: TBitmap32; pX,
  pY, pPalOffset, pDefaultColour : Integer);
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
        pBitmap.Pixel[pX + x,py+y] := ROM.NESPal[pDefaultColour]
      else if TempBin = '10' Then
        pBitmap.Pixel[pX + x,py+y] := ROM.NESPal[ROM[pPalOffset]]
      else if TempBin = '01' Then
        pBitmap.Pixel[pX + x,py+y] := ROM.NESPal[ROM[pPalOffset+1]]
      else if TempBin = '11' Then
        pBitmap.Pixel[pX + x,py+y] := ROM.NESPal[ROM[pPalOffset+2]];
    end;
  end;
end;}

procedure TCVROM.SaveScreenData;
var
  i, x : Integer;
  TempScreen : TCVScreen;
begin

  TempScreen := CurrLevel.Screens[_Screen];

  For i := 0 To 7 do
    For x := 0 To 5 do
      ROM[TempScreen._Offset + (i * 6) + x] := _ScreenData[i, x];

end;

procedure TCVROM.DrawCurrentScreen(pBitmap: TBitmap32; pImageList : TBitmap32List;pDrawOptions : Byte);
var
  i, x : Integer;
  TempScreen : TCVScreen;
  Stair : TStair;
  Door : TDoor;
  Entrance : TEntrance;
  BrBlock : TBreakableBlock;
  Spike : TSpikeCrusher;
  Floaty : TFloatingPlatform;
  NonDoor : TNonStandardDoor;
  Hid : THiddenItem;
begin

  TempScreen := CurrLevel.Screens[_Screen];

  for i := 0 to 7 do
    for x := 0 to 5 do
      pBitmap.Draw(bounds(i*32,x * 32,32,32),bounds(_ScreenData[i,x] * 32,0,32,32),_Tiles);

  if (pDrawOptions and DRAWOPTHORIZONTALBAR) = DRAWOPTHORIZONTALBAR then
  begin
    pBitmap.FillRect(0,0,pBitmap.Width,16,clBlack32);
  end;

  if (pDrawOptions and DRAWOPTSTAIRS) = DRAWOPTSTAIRS then
  begin
    if NumberOfStairs > 0 then
    begin
      for i := 0 to CurrLevel.Stairs.Count - 1 do
      begin
        Stair := CurrLevel.Stairs[i];
        if (Stair.Stage = TempScreen._StageNumber) and (Stair.ScreenNumber = TempScreen._ScreenNumber) then
          if TempScreen.MultiAreaBit = Stair.MultiAreaBit then
            pBitmap.Draw(Stair.X,Stair.Y,pImageList.Bitmap[Stair.Direction]);
      end;
    end;
  end;

  if (pDrawOptions and DRAWOPTDOORS) = DRAWOPTDOORS then
  begin
    if CurrLevel.Doors <> nil then
    begin
      for i := 0 to CurrLevel.Doors.Count -1 do
      begin
        Door := CurrLevel.Doors[i];
        if ScreenID = Door.ScreenNumber then
          pBitmap.Draw(Door.X ,Door.Y,pImageList.Bitmap[4]);
      end;
    end;

    if Assigned(CurrLevel.NonStandardDoors) = True then
    begin
      for i := 0 to CurrLevel.NonStandardDoors.Count -1 do
      begin
        NonDoor := CurrLevel.NonStandardDoors[i];
        if (TempScreen.ScreenNumber = NonDoor.ScreenNumber) and (NonDoor.Stage = TempScreen.StageNumber) then
          pBitmap.Draw(NonDoor.X ,NonDoor.Y,pImageList.Bitmap[16]);
      end;
    end;

  end;

  if (pDrawOptions and DRAWOPTENTRANCES) = DRAWOPTENTRANCES then
  begin
    for i := 0 to CurrLevel.Entrances.Count -1 do
    begin
      Entrance := CurrLevel.Entrances[i];
      if TempScreen.MultiAreaBit = Entrance.MultiAreaBit then
      begin
        if (TempScreen.ScreenNumber = Entrance.ScreenID) and (Entrance.StageNumber = TempScreen.StageNumber) then
        begin
          pBitmap.Draw(Entrance.X ,Entrance.Y,pImageList.Bitmap[5]);
        end;
      end;
    end;
  end;

  if (pDrawOptions and DRAWOPTBREAKABLEBLOCKS) = DRAWOPTBREAKABLEBLOCKS then
  begin
    if NumberOfBreakableBlocks > 0 then
    begin
      for i := 0 to CurrLevel.BreakableBlocks.Count - 1 do
      begin
        BrBlock := CurrLevel.BreakableBlocks[i];
        if (BrBlock.StageNumber = TempScreen._StageNumber) and (BrBlock.ScreenNumber = TempScreen._ScreenNumber) then
          if TempScreen.MultiAreaBit = BrBlock.MultiAreaBit then
          begin
            pBitmap.Draw(BrBlock.X,BrBlock.Y,pImageList.Bitmap[6+ BrBlock.ItemDropped]);
            if BrBlock.AppearsSecondQuestOnly = True then
            begin
              pBitmap.Line(BrBlock.X,BrBlock.Y,BrBlock.X+16,BrBlock.Y+16,clRed32);
              pBitmap.Line(BrBlock.X+16,BrBlock.Y,BrBlock.X,BrBlock.Y+16,clRed32);
            end;
          end;
      end;
    end;
  end;

{    if NumberOfHiddenItems > 0 then
    begin
      for i := 0 to Levels[Levels.CurrentLevel].HiddenItems.Count - 1 do
      begin
        Hid := Levels[Levels.CurrentLevel].HiddenItems[i];
        if (Hid.StageNumber = TempScreen._StageNumber) and (Hid.ScreenNumber = TempScreen._ScreenNumber) then
          if TempScreen.MultiAreaBit = Hid.MultiAreaBit then
          begin
            pBitmap.Draw(Hid.X,Hid.Y,pImageList.Bitmap[17]);
          end;
      end;
    end;}

  if (pDrawOptions AND DRAWOPTSPIKECRUSHERS) = DRAWOPTSPIKECRUSHERS then
  begin
    if Assigned(CurrLevel.SpikeCrushers) = true then
    begin
      if CurrLevel._NumberOfSpikeCrushers > 0 then
      begin
        for i := 0 to CurrLevel.SpikeCrushers.Count - 1 do
        begin
          Spike := CurrLevel.SpikeCrushers[i];
          // There currently does not seem to be a provision for
          // multi-area screens in the data format. So just draw
          // the crushers on screens without the multi-area bit
          // set.
          if (TempScreen.MultiAreaBit = False) and (TempScreen.StageNumber = CurrLevel._SpikeCrusherStage) and (TempScreen._ScreenNumber = Spike.Screen) then
          begin
            pBitmap.Draw(Spike.X,Spike.Y,pImageList.Bitmap[14]);
          end;
        end;
      end;
    end;
  end;

  if (pDrawOptions AND DRAWOPTFLOATINGPLATFORMS) = DRAWOPTFLOATINGPLATFORMS then
  begin
    if Assigned(CurrLevel.FloatingPlatforms) = True then
    begin
      for i := 0 to CurrLevel.FloatingPlatforms.Count - 1 do
      begin
        floaty := CurrLevel.FloatingPlatforms[i];
        if TempScreen.StageNumber = floaty.Stage then
        begin
          if (TempScreen.MultiAreaBit = True) and (Floaty.MultiAreaBit = True) and (Floaty.Screen = TempScreen.ScreenNumber) then
          begin
            pBitmap.Draw(floaty.X,floaty.Y,pImageList.Bitmap[15]);
          end
          else if (TempScreen.MultiAreaBit = False) and (Floaty.MultiAreaBit = False)  and (Floaty.Screen = TempScreen.ScreenNumber) then
          begin
            pBitmap.Draw(floaty.X,floaty.Y,pImageList.Bitmap[15]);
          end;
        end;
      end;
    end;
  end;

end;

procedure TCVROM.DrawCVTile(pOffset: Integer; pBitmap: TBitmap32; pX, pY,
  pIndex: Integer);
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

function TCVROM.GetScreen: Integer;
begin
  result := _Screen;
end;

procedure TCVROM.SetScreen(const Value: Integer);
begin
  if _Screen > -1 then
  begin
    SaveScreenData();
    SaveEnemyData();
  end;

  _Screen := Value;

  LoadScreenData();
  LoadEnemyData();

end;

procedure TCVROM.LoadStairsData();
var
  TempLevel : TLevel;
  i,x,z : Integer;
  Stair : TStair;
begin

  for i := 0 to _NumberOfLevels - 1 do
  begin

    TempLevel := Levels[i];
    if assigned(TempLevel.Stairs) = false then
      TempLevel.Stairs := TStairList.Create(True)
    else
      exit;

    for x := 0 to TempLevel._NumberOfStages -1 do
    begin
      z := ROM.PointerToOffset(TempLevel._StairPointers[x],$18010,$8000);
      // Now we load in all the stairs.
      while (ROM[z] > $00) do
      begin

        TempLevel.Stairs.Add(TStair.Create);

        Stair := TStair(TempLevel.Stairs.Last);
        Stair.Stage := x;
        Stair.Y := (ROM[z] and 240) - 16;
        Stair.UnknownBit1 := ROM[z] and 8;
        Stair.MultiAreaBitRaw := ROM[z] and 4;
        Stair.Direction := ROM[z] and 3;

        Stair.X := (ROM[z+1] and 248);
        Stair.ScreenNumber := ROM[z+1] and 7;
        z := z + 2;
      end;
    end;
  end;

end;

procedure TCVROM.LoadBreakableBlocksData();
var
  TempLevel : TLevel;
  i,x,z : Integer;
  BreakableBlock : TBreakableBlock;
begin

  for i := 0 to _NumberOfLevels - 1 do
  begin

    TempLevel := Levels[i];
    if assigned(TempLevel.BreakableBlocks) = false then
      TempLevel.BreakableBlocks := TBreakableBlockList.Create(True)
    else
      exit;

    for x := 0 to TempLevel._NumberOfStages -1 do
    begin

      z := ROM.PointerToOffset(TempLevel._BreakableBlockPointers[x],$18010);
      // Now we load in all the breakable blocks.
      while (ROM[z] > $00) do
      begin

        TempLevel.BreakableBlocks.Add(TBreakableBlock.Create);

        BreakableBlock := TempLevel.BreakableBlocks.Last;
        BreakableBlock.StageNumber := x;
        BreakableBlock.Y := (ROM[z] and $F0) -32;
        BreakableBlock.ItemDropped := ROM[z] and 7;
        BreakableBlock.X := (ROM[z+1] and $F0);
        BreakableBlock.MultiAreaBitRaw := ROM[z] and 8;
        BreakableBlock.AppearsSecondQuestOnlyRaw := ROM[z+1] and 8;
        BreakableBlock.ScreenNumber := ROM[z+1] and $7;

        z := z + 2;
      end;
    end;
  end;

end;

procedure TCVROM.SaveStairsData();
var
  TempLevel : TLevel;
  i,x,z : Integer;
  Stair : TStair;
  CurrentStairPos : Integer;
  StairPointer : String;
begin

  CurrentStairPos := _StairsFreeSpace;

  for i := 0 to _NumberOfLevels -1 do
  begin
    TempLevel := Levels[i];

    for x := 0 to  TempLevel._NumberOfStages -1 do
    begin
      // Update the stairs pointer.
      // This assumes that the bank which the stair
      // is stored in is the normal one.
      StairPointer := IntToHex((CurrentStairPos - $18010) + $8000,4);
      ROM[TempLevel._StairPointers[x]] := StrToInt('$' + StairPointer[3] + StairPointer[4]);
      ROM[TempLevel._StairPointers[x]+1] := StrToInt('$' + StairPointer[1] + StairPointer[2]);
//      showmessage(IntToHex(StairPointer,4));
      if TempLevel.Stairs.Count > 0 then
      begin

        for z := 0 to TempLevel.Stairs.Count -1 do
        begin
          Stair := TStair(TempLevel.Stairs[z]);
          if Stair.Stage = x then
          begin
//            if Stair._X >= 240 then
//              Stair._X := 239;
            ROM[CurrentStairPos] := ((Stair.Y + 16) and 240) +
              (Stair.UnknownBit1 and 8) + (Stair.MultiAreaBitRaw and 4)
                + (Stair.Direction and 3);
            ROM[CurrentStairPos + 1] := ((Stair.X) and 248) + (
              Stair.ScreenNumber and 7);

            inc(CurrentStairPos,2);
          end; // if Stair._Stage = x
        end; // z

      end; // else if stairs.count > 0

      ROM[CurrentStairPos] := 0;
      inc(CurrentStairPos);

    end; // x
  end; // i

end;

procedure TCVROM.SaveBreakableBlocksData();
var
  TempLevel : TLevel;
  i,x,z : Integer;
  BrBlock : TBreakableBlock;
  CurrentBrBlockPos : Integer;
  BrBlockPointer : String;
begin

  CurrentBrBlockPos := _BreakableBlocksFreeSpace;

  for i := 0 to _NumberOfLevels -1 do
  begin
    TempLevel := Levels[i];

    for x := 0 to  TempLevel._NumberOfStages -1 do
    begin
      // Update the stairs pointer.
      // This assumes that the bank which the stair
      // is stored in is the normal one.
      BrBlockPointer := IntToHex((CurrentBrBlockPos - $18010) + $8000,4);
      ROM[TempLevel._BreakableBlockPointers[x]] := StrToInt('$' + BrBlockPointer[3] + BrBlockPointer[4]);
      ROM[TempLevel._BreakableBlockPointers[x]+1] := StrToInt('$' + BrBlockPointer[1] + BrBlockPointer[2]);
//      showmessage(IntToHex(StairPointer,4));
      if TempLevel.BreakableBlocks.Count > 0 then
      begin

        for z := 0 to TempLevel.BreakableBlocks.Count -1 do
        begin
          BrBlock := TempLevel.BreakableBlocks[z];
          if BrBlock.StageNumber = x then
          begin

            ROM[CurrentBrBlockPos] := ((BrBlock.Y + 32) and $F0) +
              (BrBlock.MultiAreaBitRaw and 8) + (BrBlock.ItemDropped and 7);
            ROM[CurrentBrBlockPos + 1] := ((BrBlock.X) and $F0) +
            (BrBlock.AppearsSecondQuestOnlyRaw and 8) + (BrBlock.ScreenNumber and 7);

            inc(CurrentBrBlockPos,2);
          end; // if Stair._Stage = x
        end; // z

      end; // else if stairs.count > 0

      ROM[CurrentBrBlockPos] := 0;
      inc(CurrentBrBlockPos);
    end; // x
  end; // i
end;

function TCVROM.DrawTileSelector(pIndex : Integer;pBitmap : TBitmap32): Boolean;
var
  i : Integer;
begin
  if assigned(_Tiles) = false then
  begin
    result := false;

  end
  else
  begin
    for i := 0 to 5 do
    begin
      if _DrawBlock[pindex + i] = False then
      begin
        if _tiles <> nil then DrawLevelTile(pindex + i);
        _DrawBlock[pindex + i] := True;
      end;
      pBitmap.Draw(bounds(0,i * 32,32,32),bounds((pindex+i) * 32,0,32,32),_tiles);
    end;
    result := true;
  end;
end;

function TCVROM.GetNumberOfTiles: Integer;
begin
  result := Levels[Levels.CurrentLevel]._NumberOfTiles;
end;

procedure TCVROM.LoadScreenData;
var
  i, x : Integer;
  TempBlock : TCVScreen;
begin

  TempBlock := Levels[Levels.CurrentLevel].Screens[_Screen];

  For i := 0 To 7 do
  begin
    For x := 0 To 5 do
    begin
      _ScreenData[i, x] := ROM[TempBlock._Offset + (i * 6) + x];

      if _DrawBlock[_ScreenData[i,x]] = False then
      begin
        if _tiles <> nil then DrawLevelTile(_screendata[i,x]);
        _DrawBlock[_ScreenData[i, x]] := True;
      end;
    end;
  end;
end;

function TCVROM.EditTSA(pBlock,pTileIndex1,pTileIndex2 : Integer; pNewTile : Byte): Integer;
begin
  ROM[Levels[Levels.CurrentLevel]._TSAOffset+ (pBlock * 17+1) + (pTileIndex1 *4 + pTileIndex2)] := pNewTile;
  DrawLevelTile(pBlock);
  result := 1;
end;

function TCVROM.IncrementBlockAttributes(pBlock,pTileIndex1,pTileIndex2 : Integer): Integer;
var
  TilePal : Array [0..1,0..1] Of Byte;
begin

  TilePal[0,0] := (ROM[Levels[Levels.CurrentLevel]._TSAOffset +(pBlock*17)]) and 3;
  tilepal[0,1] := (ROM[Levels[Levels.CurrentLevel]._TSAOffset +(pBlock*17)] shr 2) and 3;
  tilepal[1,0] := (ROM[Levels[Levels.CurrentLevel]._TSAOffset +(pBlock*17)] shr 4) and 3;
  tilepal[1,1] := (ROM[Levels[Levels.CurrentLevel]._TSAOffset +(pBlock*17)] shr 6) and 3;

  if tilepal[pTileIndex1,pTileIndex2] = 3 then
    tilepal[pTileIndex1,pTileIndex2] := 0
  else
    inc(tilepal[pTileIndex1,pTileIndex2]);

  ROM[Levels[Levels.CurrentLevel]._TSAOffset+ (pBlock * 17)] := (TilePal[1,1] shl 6) + (TilePal[1,0] shl 4) + (TilePal[0,1] shl 2) + (TilePal[0,0]);

  DrawLevelTile(pBlock);

  result := 1;

end;



procedure TCVROM.RefreshOnScreenTiles(pTileSelectorValue : Byte);
var
  i, x : integer;
begin

  // Reset all the tiles back to the false drawing state.
  for i := 0 to 255 do
    _DrawBlock[i] := false;

  for i := 0 to 7 do
    for x := 0 to 5 do
      if _DrawBlock[_ScreenData[i,x]] = false then
      begin
        DrawLevelTile(_screendata[i,x]);
        _DrawBlock[_ScreenData[i,x]] := True;
      end;

  // Now scroll through the blocks displayed in the tile selector
  for i := pTileSelectorValue to pTileSelectorValue + 5 do
    if _DrawBlock[i] = false then
    begin
      DrawLevelTile(i);
      _DrawBlock[i] := True;
    end;

end;

procedure TCVROM.SaveCurrentPalette;
var
  i,x : Integer;
begin

  for i := 0 to 3 do
    for x := 0 to 3 do
      ROM[Levels[Levels.CurrentLevel]._BGPalOffset + (i*4)+x] := _Palette[i,x];
end;

function TCVROM.GetStairUnderMouse(pX,pY : Integer): Integer;
var
  TempScreen : TCVScreen;
  i : Integer;
  Stair : TStair;
begin

  TempScreen := Levels[Levels.CurrentLevel].Screens[_Screen];
  result := -1;

  if NumberOfStairs > 0 then
  begin

    for i := 0 to Levels[Levels.CurrentLevel].Stairs.Count - 1 do
    begin

      Stair := Levels[Levels.CurrentLevel].Stairs[i];

      if (Stair.Stage = TempScreen.StageNumber) and (Stair.ScreenNumber = TempScreen.ScreenNumber) then
      begin

        if TempScreen.MultiAreaBit = Stair.MultiAreaBit then
        begin
          if ((pX >= Stair.X) and (pX <= Stair.X + 16)) and ((pY >= Stair.Y) and (pY <= Stair.Y + 16)) then
          begin
            result := i;
            exit;
          end
        end;

      end;
    end;
  end;

end;

procedure TCVROM.SetStairsXY(pStairID : Integer;pX,pY : Integer);
var
  Stair : TStair;
begin

  Stair := Levels[Levels.CurrentLevel].Stairs[pStairID];
  if pX > -1 then
  begin
    if pX > 240 then
      Stair.X := 240
    else
      Stair.X := pX;
  end;
  if pY > -1 then
    Stair.Y := pY;
  ROM.Changed := True;
end;

procedure TCVROM.IncrementStairDirection(pStairID : Integer);
var
  Stair : TStair;
begin

  Stair := Levels[Levels.CurrentLevel].Stairs[pStairID];
  if Stair.Direction = 3 then
    Stair.Direction := 0
  else
    Stair.Direction := Stair.Direction + 1;
  ROM.Changed := True;
end;

function TCVROM.GetStairXY(pStairID: Integer; pXY: Byte): Integer;
var
  Stair : TStair;
begin

  Stair := Levels[Levels.CurrentLevel].Stairs[pStairID];
  if pXY = 0 then
    result := Stair.X
  else
    result := Stair.Y;

end;

function TCVROM.GetDoorUnderMouse(pX, pY: Integer): Integer;
var
  Door : TDoor;
  i : Integer;
begin

  result := -1;

  if assigned(Levels[Levels.CurrentLevel].Doors) = false then
    exit;

  if (Levels[Levels.CurrentLevel].Doors.Count = 0) then
    exit;

  for i := 0 to Levels[Levels.CurrentLevel].Doors.Count - 1 do
  begin
    Door := Levels[Levels.CurrentLevel].Doors[i];
    if Door.ScreenNumber = ScreenID then
    begin
      if (pX >= Door.X) and (pX <= Door.X + 16) then
      begin
        if (pY >= Door.Y) and (pY <= Door.Y + 16) then
        begin
          result := i;
          exit;
        end;
      end;
    end;
  end;

end;

function TCVROM.GetEntranceUnderMouse(pX, pY: integer): Integer;
var
  Entrance : TEntrance;
  TempScreen : TCVScreen;
  i : Integer;
begin
  TempScreen := Levels[Levels.CurrentLevel].Screens[_Screen];
  result := -1;

  if assigned(Levels[Levels.CurrentLevel].Entrances) = false then
    exit;

  if Levels[Levels.CurrentLevel].Entrances.count = 0 then
    exit;

  for i := 0 to Levels[Levels.CurrentLevel].Entrances.Count - 1 do
  begin
    Entrance := Levels[Levels.CurrentLevel].Entrances[i];
    if (Entrance.MultiAreaBit = TempScreen.MultiAreaBit) and (Entrance.StageNumber = TempScreen.StageNumber) then
    begin
      if Entrance.ScreenID = TempScreen.ScreenNumber then
      begin
        if (pX >= Entrance.X) and (pX <= Entrance.X + 16) then
        begin
          if (pY >= Entrance.Y) and (pY <= Entrance.Y + 16) then
          begin
            result := i;
            exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TCVROM.SetDoorXY(pDoorID, pX,pY: Integer);
begin
  if pX > -1 then
  begin
    if pX > 240 then
      Levels[Levels.CurrentLevel].Doors[pDoorID].X := 240
    else
      Levels[Levels.CurrentLevel].Doors[pDoorID].X := pX;
  end;
  if pY > -1 then
    Levels[Levels.CurrentLevel].Doors[pDoorID].Y := pY;
  ROM.Changed := True;
end;

procedure TCVROM.SetEntranceXY(pX, pY, pEntranceID: Integer);
begin
  if pX > -1 then
  begin
    if pX > 240 then
      Levels[Levels.CurrentLevel].Entrances[pEntranceID].X := 240
    else
      Levels[Levels.CurrentLevel].Entrances[pEntranceID].X := pX;
  end;
  if pY > -1 then
  begin
    if pY > 176 then
      Levels[Levels.CurrentLevel].Entrances[pEntranceID].Y := 176
    else
      Levels[Levels.CurrentLevel].Entrances[pEntranceID].Y := pY;
  end;
  ROM.Changed := True;  
end;

function TCVROM.GetDoorXY(pXY,pDoorID: Integer): Integer;
begin
  if pXY = 0 then
    result := Levels[Levels.CurrentLevel].Doors[pDoorID].X
  else
    result := Levels[Levels.CurrentLevel].Doors[pDoorID].Y;
end;

function TCVROM.GetEntranceXY(pXY: Byte; pEntranceID : Integer): Integer;
begin
  if pXY = 0 then
    result := Levels[Levels.CurrentLevel].Entrances[pEntranceID].X
  else
    result := Levels[Levels.CurrentLevel].Entrances[pEntranceID].Y;
end;

procedure TCVROM.SaveDoorsData();
var
  i,tempadd, temp : Integer;
  Door : TDoor;
begin

  if assigned(Levels[Levels.CurrentLevel].Doors) = false then exit;

  for i := 0 to Levels[Levels.CurrentLevel].Doors.Count - 1 do
  begin
    Door := Levels[Levels.CurrentLevel].Doors[i];
    ROM[Door.Offset] := ((Door.Y + 32) and 254) + (Door.MultiAreaBitSet and 1);
    ROM[Door.Offset + 1] := ((Door.X + 8) and 254) + Door.UnknownBit1;

    if Door.AnimationOffset > 0 then
      ROM[Door.AnimationOffset] := (Door.Y and 240) + (Door.AnimUnknownBit1 and 14) + (Door.AnimationMultiArea and 1);
//    ROM[Door._AnimOffset] := (Door._AnimationY and 2) + (Door._AnimationMultiArea and 1);
    if Door.X and 128 = 128 then
      tempadd := 16
    else
      tempadd := 0;
    // Presumably, the point in the nametable where the door tiles disappear and the door
    // appears over them.
    temp := (((Door.Y) div 8)*32) + ((((Door.X) and 248) +tempadd) div 8) + Door.NameTable;
    if Door.TileAnimationOffset > 0 then
    begin
      ROM[Door.TileAnimationOffset] := StrToInt('$' + copy(inttohex(temp,4),1,2));
      ROM[Door.TileAnimationOffset + 1] := StrToInt('$' + copy(inttohex(temp,4),3,2));
    end;

  end;

end;

procedure TCVROM.LoadDoorsData();
var
  i : Integer;
  Door : TDoor;
begin

  if assigned(Levels[Levels.CurrentLevel].Doors) = false then exit;

  for i := 0 to Levels[Levels.CurrentLevel].Doors.Count - 1 do
  begin
    Door := Levels[Levels.CurrentLevel].Doors[i];
    Door.Y := (ROM[Door.Offset] and 254)-32;
    Door.X := ((ROM[Door.Offset +1]) and 254) -8;
    Door.UnknownBit1 := ROM[Door.Offset +1] and 1;
    Door.MultiAreaBitSet := ROM[Door.Offset] and 1;
    Door.YAnimation := (ROM[Door.AnimationOffset] and 240);
    Door.AnimUnknownBit1 := ROM[Door.AnimationOffset] and 14;
    Door.AnimationMultiArea := (ROM[Door.AnimationOffset] and 1);
    // Work out the name table address.
    if (ROM[Door.TileAnimationOffset] >= $20) and (ROM[Door.TileAnimationOffset] <= $23) then
      Door.NameTable := $2000
    else if (ROM[Door.TileAnimationOffset] >= $24) and (ROM[Door.TileAnimationOffset] <= $27) then
      Door.NameTable := $2400
    else if (ROM[Door.TileAnimationOffset] >= $28) and (ROM[Door.TileAnimationOffset] <= $2B) then
      Door.NameTable := $2800
    else if (ROM[Door.TileAnimationOffset] >= $2C) and (ROM[Door.TileAnimationOffset] <= $29) then
      Door.NameTable := $2C00;
  end;

end;

procedure TCVROM.SaveEntranceData();
var
  i : Integer;
  Entrance : TEntrance;
begin
  for i := 0 to Levels[Levels.CurrentLevel].Entrances.Count - 1 do
  begin
    Entrance := Levels[Levels.CurrentLevel].Entrances[i];
    ROM[Entrance.Offset] := ((Entrance.Y + 48) and 248) + (Entrance.ScreenID and 7);
    ROM[Entrance.Offset + 1] := ((Entrance.X + 8) and 254) + (Entrance.MultiAreaBitRaw and 1);
  end;
end;

procedure TCVROM.LoadEntranceData();
var
  i : Integer;
  Entrance : TEntrance;
begin

  for i := 0 to Levels[Levels.CurrentLevel].Entrances.Count - 1 do
  begin
    Entrance := Levels[Levels.CurrentLevel].Entrances[i];
    Entrance.Y := (ROM[Entrance.Offset] and 248)-48;
    Entrance.ScreenID := (ROM[Entrance.Offset] and 7);
    Entrance.X := (ROM[Entrance.Offset +1] and 254)-8;
    Entrance.MultiAreaBitRaw := (ROM[Entrance.Offset+1] and 1);
  end;
end;

procedure TCVROM.TestTileDrawing();
var
  i : Integer;
begin
  LoadPatternTable();
  LoadCurrentPalette();
  for i := 0 to 100 do
    self.DrawLevelTile(i);
  _Tiles.SaveToFile('C:\test.bmp');
  DumpPatternTable('C:\test.nes');
end;

function TCVROM.GetMapHeight: Integer;
begin
  result := Levels[Levels.CurrentLevel]._Height;
end;

function TCVROM.GetMapWidth: Integer;
begin
  result := Levels[Levels.CurrentLevel]._Length;
end;

procedure TCVROM.SetupMap;
var
  TempScreen : TCVScreen;
  i,x : Integer;
begin

  SetLength(_Map,Levels[Levels.CurrentLevel]._Length, Levels[Levels.CurrentLevel]._Height);

  for i := 0 to Levels[Levels.CurrentLevel]._Length -1 do
    for x := 0 to Levels[Levels.CurrentLevel]._Height -1 do
      _Map[i,x] := $FF;


  for i := 0 to Levels[Levels.CurrentLevel]._NumberOfScreens - 1 do
  begin
    TempScreen := Levels[Levels.CurrentLevel].Screens[i];
    if TempScreen._Enabled = True then
      _Map[TempScreen._X,TempScreen._Y] := TempScreen._id;
  end;

//  showmessage('end');
end;

function TCVROM.Save() : Boolean;
begin
  SaveScreenData();
  SaveEnemyData();
  SaveDoorsData();
  SaveStairsData();
  SaveBreakableBlocksData();
  SaveEntranceData();
  SaveFloatingPlatformData();
  SaveNonDoors();
  result := ROM.Save;
end;

function TCVROM.GetNumberOfStairs: Integer;
var
  TempScreen : TCVScreen;
  count, i : Integer;
begin

  TempScreen := Levels[Levels.CurrentLevel].Screens[self._Screen];
  count := 0;

  if assigned(Levels[Levels.CurrentLevel].Stairs) = false then
  begin
    result := count;
    exit;
  end;

  for i := 0 to Levels[Levels.CurrentLevel].Stairs.Count - 1 do
    if Levels[Levels.CurrentLevel].Stairs[i].Stage = TempScreen._StageNumber then
      inc(count);

  result := count;
end;

function TCVROM.AddNewStair: Integer;
var
  TempScreen : TCVScreen;
  Stair : TStair;
begin
  TempScreen := Levels[Levels.CurrentLevel].Screens[self._Screen];

  if Levels[Levels.CurrentLevel].Stairs.Count < MAXSTAIRSINSTAGE then
  begin
    Levels[Levels.CurrentLevel].Stairs.Add(TStair.Create);

    Stair := Levels[Levels.CurrentLevel].Stairs.Last;

    Stair.Stage := TempScreen._StageNumber;

    Stair.ScreenNumber := TempScreen._ScreenNumber;
    Stair.MultiAreaBit := TempScreen.MultiAreaBit;
    result := 1;
  end
  else
    result := -1;
  ROM.Changed := True;
end;

procedure TCVROM.DeleteStair(pID: Integer);
begin

  if MessageDlg('Are you sure that you wish to delete this stair?',mtConfirmation,[mbYes, mbNo],0) = 6 then
    Levels[Levels.CurrentLevel].Stairs.Delete(pID);
  ROM.Changed := True;
end;

function TCVROM.GetLevelName: String;
begin
  result := Levels[Levels.CurrentLevel]._Name;
end;

procedure TCVROM.GetScreenStairs(pStringList: TStringList; pStairID : Integer);
var
  TempScreen : TCVScreen;
  TempStair : TStair;
  i : Integer;
begin
  TempStair := Levels[Levels.CurrentLevel].Stairs.Items[pStairID];
  for i := 0 to Levels[Levels.CurrentLevel].Screens.Count - 1 do
  begin
    TempScreen := Levels[Levels.CurrentLevel].Screens.Items[i];
    if TempScreen._StageNumber = TempStair.Stage then
      pStringList.Add(IntToHex(TempScreen._id,2));
  end;

end;

function TCVROM.Export8x8Pat(pID: Integer) : T8x8Graphic;
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


procedure TCVROM.Import8x8Pat(pID: Integer; p8x8: T8x8Graphic);
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
//    showmessage(TempBin2);
  end;

end;



function TCVROM.GetCurrentScreenXYPos(pXY: Byte): Integer;
var
  TempScreen : TCVScreen;
begin
  TempScreen := Levels[Levels.CurrentLevel].Screens[self.ScreenID];
  if pXY = 0 then
    result := TempScreen._X
  else
    result := TempScreen._Y;
end;

function TCVROM.GetLevelStartX: Integer;
begin
  result := Levels[Levels.CurrentLevel]._StartX;
end;

function TCVROM.GetLevelStartY: Integer;
begin
  result := Levels[Levels.CurrentLevel]._StartY;
end;

function TCVROM.ReturnColor32NESPal(pElement: Integer): TColor32;
begin
  result := ROM.NESPal[pElement];
end;

function TCVROM.IsCVROM: Boolean;
begin
  if (ROM.MapperNumber = 2) and (ROM.PRGCount = 8) and (ROM.CHRCount = 0) then
    result := true
  else
    result := False;
end;

procedure TCVROM.LoadDefaultPalette;
begin
  ROM.LoadDefaultPalette;
end;

procedure TCVROM.LoadPaletteFile(pFilename: String);
begin
  ROM.LoadPaletteFile(pFilename); 
end;

function TCVROM.GetFilename: String;
begin
  result := ROM.Filename;
end;

procedure TCVROM.LevelName(pStringList: TStringList);
var
  i : Integer;
begin
  for i := 0 to 6 do
    pStringList.Add(self.Levels[i]._Name);
end;

procedure TCVROM.LoadSpritePalette;
var
  i,x : Integer;
begin
  for i := 0 to 3 do
    for x := 0 to 3 do
      _Palette[i+4,x] := ROM[self._SprPalOffset + (i*4)+x];
end;

procedure TCVROM.SaveSpritePalette;
var
  i,x : Integer;
begin
  for i := 0 to 3 do
    for x := 0 to 3 do
      ROM[self._SprPalOffset + (i*4)+x] := _Palette[i+4,x];
end;

function TCVROM.GetNumberOfBreakableBlocks: Integer;
var
  TempScreen : TCVScreen;
  count, i : Integer;
begin

  TempScreen := Levels[Levels.CurrentLevel].Screens[self._Screen];
  count := 0;

  if assigned(Levels[Levels.CurrentLevel].BreakableBlocks) = false then
  begin
    result := count;
    exit;
  end;

  if (Levels[Levels.CurrentLevel].BreakableBlocks.Count = 0) then
  begin
    result := count;
    exit;
  end;

  for i := 0 to Levels[Levels.CurrentLevel].BreakableBlocks.Count - 1 do
    if Levels[Levels.CurrentLevel].BreakableBlocks[i].StageNumber = TempScreen._StageNumber then
      inc(count);

  result := count;

end;

function TCVROM.GetBreakableBlockUnderMouse(pX, pY: Integer): Integer;
var
  TempScreen : TCVScreen;
  i : Integer;
  BrBlock : TBreakableBlock;
begin

  TempScreen := Levels[Levels.CurrentLevel].Screens[self._Screen];
  result := -1;

  if self.NumberOfBreakableBlocks > 0 then
  begin

    for i := 0 to Levels[Levels.CurrentLevel].BreakableBlocks.Count - 1 do
    begin

      BrBlock := Levels[Levels.CurrentLevel].BreakableBlocks[i];

      if (BrBlock.StageNumber = TempScreen._StageNumber) and (BrBlock.ScreenNumber = TempScreen._ScreenNumber) then
      begin
        if TempScreen.MultiAreaBit = BrBlock.MultiAreaBit then
        begin
          if ((pX >= BrBlock.X) and (pX <= BrBlock.X + 16)) and ((pY >= BrBlock.Y) and (pY <= BrBlock.Y + 16)) then
          begin
            result := i;
            exit;
          end
        end;
      end;
    end;
  end;

end;

function TCVROM.GetBreakableBlockXY(pStairID: Integer; pXY: Byte): Integer;
begin
  if pXY = 0 then
    result := Levels[Levels.CurrentLevel].BreakableBlocks[pStairID].X
  else
    result := Levels[Levels.CurrentLevel].BreakableBlocks[pStairID].Y;

end;

procedure TCVROM.SetBreakableBlockXY(pStairID, pX, pY: Integer);
begin
  if pStairID = -1 then exit;
  if pX > -1 then
    Levels[Levels.CurrentLevel].BreakableBlocks[pStairID].X := pX;
  if pY > -1 then
    Levels[Levels.CurrentLevel].BreakableBlocks[pStairID].Y := pY;
  ROM.Changed := True;
end;

procedure TCVROM.GetScreenBrBlocks(pStringList: TStringList;
  pBlockID: Integer);
var
  TempScreen : TCVScreen;
  TempBrBlock : TBreakableBlock;
  i : Integer;
begin
  TempBrBlock := Levels[Levels.CurrentLevel].BreakableBlocks.Items[pBlockID];
  for i := 0 to Levels[Levels.CurrentLevel].Screens.Count - 1 do
  begin
    TempScreen := Levels[Levels.CurrentLevel].Screens.Items[i];
    if TempScreen._StageNumber = TempBrBlock.StageNumber then
      pStringList.Add(IntToHex(TempScreen._id,2));
  end;

end;

procedure TCVROM.IncrementBrBlockItem(pBlockID: Integer);
var
  BrBlock : TBreakableBlock;
begin

  BrBlock := Levels[Levels.CurrentLevel].BreakableBlocks[pBlockID];
  if BrBlock.ItemDropped = 7 then
    BrBlock.ItemDropped := 0
  else
    BrBlock.ItemDropped := BrBlock.ItemDropped + 1;
  ROM.Changed := True;
end;

procedure TCVROM.GetScreenSpikeCrushers(pStringList: TStringList;
  pCrusherID: Integer);
var
  TempScreen : TCVScreen;
  i : Integer;
begin
  if Assigned(levels[levels.currentlevel].SpikeCrushers) = True then
  begin
    for i :=0 to Levels[Levels.CurrentLevel].Screens.Count - 1 do
    begin
      TempScreen := Levels[Levels.CurrentLevel].Screens[i];
      if (TempScreen._StageNumber = Levels[Levels.CurrentLevel]._SpikeCrusherStage) and (TempScreen.MultiAreaBit = False) then
      begin
        pStringList.Add(IntToHex(TempScreen._id,2));
      end;
    end;
  end;
end;

function TCVROM.GetChanged: Boolean;
begin
  result := ROM.Changed;
end;

function TCVROM.GetStageID : Integer;
begin
  result := self.Levels[self._Level].Screens[self._Screen]._StageNumber;
end;

procedure TCVROM.GetStageScreenNumbers(pStringList: TStringList);
var
  i : Integer;
begin
  for i := 0 to self.Levels[self._Level].Screens.Count - 1 do
  begin
    if self.Levels[self._Level].Screens[i]._StageNumber = self.Levels[_Level].Screens[_Screen]._StageNumber then
    begin
      pStringList.Add(IntToHex(i,2));
    end;
  end;
end;

procedure TCVROM.DrawMap(pBitmap: TBitmap32);
var
  i, x : Integer;
begin
  for i := 0 to self.MapHeight-1 do
  begin
    for x := 0 to self.MapWidth -1 do
    begin
      if _Map[x,i] < $FF then
      begin
//        pBitmap.RenderText(x*16,i*16,IntToHex(_Map[i,x],1),0,clWhite32);
//        pBitmap.FillRect(16+x*16,16+i*16,16+x*16+16,16+i*16+16,clFuchsia32);
//        pBitmap.FrameRectS(16+x*16,16+i*16,16+x*16+16,16+i*16+16,clWhite32);
        pBitmap.FillRect(x*16,i*16,x*16+16,i*16+16,StageColours[self.Levels[self.Level].Screens[self.Map[x,i]]._StageNumber] );
        pBitmap.FrameRectS(x*16,i*16,x*16+16,i*16+16,clWhite32);
      end;
    end;
  end;
end;

procedure TCVROM.LoadEnemyPosData;
var
  i : Integer;
begin
  if Assigned(Self.Enemies) = True then
    FreeAndNil(self.Enemies);

  self.Enemies := TEnemyList.Create(True);
  for i := 0 to self._NumberOfEnemies - 1 do
  begin
    Enemies.Add(TEnemy.Create(self._EnemyPointer + (i * 2)));
  end;
end;

procedure TCVROM.SaveEnemyPosData;
var
  i : Integer;
begin
  for i := 0 to Enemies.Count -1 do
  begin
    if ROM[Enemies[i].Offset] = 0 then
      // Do nothing.
    else
    begin
      if ROM[Enemies[i].Offset] = $FF then
      begin
        ROM[Enemies[i].Offset+1] := Enemies[i]._Type;
        if ROM[Enemies[i].Offset+2] = $FE then
        begin
          ROM[Enemies[i].Offset+3] := Enemies[i].X;
          ROM[Enemies[i].Offset+4] := Enemies[i].Y;
        end
        else
        begin
          ROM[Enemies[i].Offset+2] := Enemies[i].X;
          ROM[Enemies[i].Offset+3] := Enemies[i].Y;
        end;
      end
      else if ROM[Enemies[i].Offset] = $FE then
      begin
        ROM[Enemies[i].Offset+1] := Enemies[i].X;
        ROM[Enemies[i].Offset+2] := Enemies[i].Y;
      end
      else if ROM[Enemies[i]._Offset] and $20 = $20 then
      begin
        ROM[Enemies[i].Offset] := Enemies[i].X;
        ROM[Enemies[i].Offset+1] := Enemies[i].Y;
      end
      else
      begin
        ROM[Enemies[i].Offset] := Enemies[i].EnemyItem;
        ROM[Enemies[i].Offset+1] := Enemies[i].X;
        ROM[Enemies[i].Offset+2] := Enemies[i].Y;
      end;
    end;
  end;
end;

function TCVROM.GetNumberOfBrBlocksInCurrentStage: Byte;
var
  i : Integer;
  StageNo : Integer;
  count : Integer;
begin
  StageNo := self.Levels[self._Level].Screens[self._Screen].StageNumber;
  Count := 0;
  for i := 0 to self.Levels[self._Level].BreakableBlocks.Count - 1 do
  begin
    if self.Levels[self._Level].BreakableBlocks[i].StageNumber = StageNo then
      inc(Count);
  end;

  result := count;
end;

function TCVROM.AddNewBreakableBlock: Integer;
var
  TempScreen : TCVScreen;
  BreakableBlock : TBreakableBlock;
begin
  TempScreen := Levels[Levels.CurrentLevel].Screens[self._Screen];

  if self.GetNumberOfBrBlocksInCurrentStage < MAXBRBLOCKSINSTAGE then
  begin
    Levels[Levels.CurrentLevel].BreakableBlocks.Add(TBreakableBlock.Create);

    BreakableBlock := Levels[Levels.CurrentLevel].BreakableBlocks.Last;

    BreakableBlock.StageNumber := TempScreen._StageNumber;

    BreakableBlock.ScreenNumber := TempScreen._ScreenNumber;
    BreakableBlock.MultiAreaBit := TempScreen.MultiAreaBit;
    result := 1;
  end
  else
    result := -1;
  ROM.Changed := True;
end;

procedure TCVROM.DeleteBreakableBlock(pID: Integer);
begin
  if MessageDlg('Are you sure that you wish to delete this breakable block?',mtConfirmation,[mbYes, mbNo],0) = 6 then
    Levels[Levels.CurrentLevel].BreakableBlocks.Delete(pID);
  ROM.Changed := True;
end;

function TCVROM.GetEnemyArrData(index: Integer): Byte;
begin
  result := self._EnemyData[index];
end;

procedure TCVROM.SetEnemyArrData(index: Integer; const Value: Byte);
begin
  self._EnemyData[index] := Value;
  ROM.Changed := True;
end;

procedure TCVROM.LoadEnemyData;
var
  i : Integer;
  EnemyOffset : Integer;
begin
  SetLength(_EnemyData,Levels[Levels.CurrentLevel]._EnemyOffsets[Levels[Levels.CurrentLevel].Screens[self.ScreenID]._EnemyList].Count);
  EnemyOffset := ROM.PointerToOffset(Levels[Levels.CurrentLevel]._EnemyOffsets[Levels[Levels.CurrentLevel].Screens[self.ScreenID]._EnemyList].PointerOffset,0,$C000);
  for i := 0 to Levels[Levels.CurrentLevel]._EnemyOffsets[Levels[Levels.CurrentLevel].Screens[self.ScreenID]._EnemyList].Count -1 do
    _EnemyData[i] := ROM[EnemyOffset+i];

end;

procedure TCVROM.SaveEnemyData;
var
  i : Integer;
  EnemyOffset : Integer;
begin
  EnemyOffset := ROM.PointerToOffset(Levels[Levels.CurrentLevel]._EnemyOffsets[Levels[Levels.CurrentLevel].Screens[self.ScreenID]._EnemyList].PointerOffset,0,$C000);
  for i := 0 to Levels[Levels.CurrentLevel]._EnemyOffsets[Levels[Levels.CurrentLevel].Screens[self.ScreenID]._EnemyList].Count -1 do
    ROM[EnemyOffset+i] :=  _EnemyData[i];
end;

procedure TCVROM.DrawCandles(pBitmap: TBitmap32; pItemIndex,pIndex: Integer);
var
  ArrPos, i,x, count, total : Integer;
  NumbersBMP : TBitmap32;
begin
  ArrPos :=  2+ (self.Levels[self._level].screens[self._screen]._ScreenNumber*8);
  // Draw the enemy
  if FileExists(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp') =  true then
  begin
    NumbersBMP := TBitmap32.Create;
    try
      NumbersBMP.Width := 136;
      NumbersBMP.Height := 8;
      NumbersBMP.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp');
      NumbersBMP.DrawMode := dmBlend;

      for i := 0 to 7 do
      begin
        if (i mod 2 = 1) and ((Enemies[_EnemyData[ArrPos+i]]._EnemyType = etCandle) or (Enemies[_EnemyData[ArrPos+i]]._EnemyType = etCandleNoXEditing) or (Enemies[_EnemyData[ArrPos+i]]._EnemyType = etNone)) then
        begin
          if _EnemyData[ArrPos+i] > 0 then
          begin
            NumbersBMP.MasterAlpha := 255;
            if Enemies[_EnemyData[ArrPos+i]].Y > $D8 then
            begin
              pBitmap.Draw(bounds(self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[1])*8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds((self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8) +8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[2])*8,0,8,8),NumbersBMP);
            end
            else
            begin
              pBitmap.Draw(bounds(self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8,self.Enemies[self._EnemyData[ArrPos+i]].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[1])*8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds((self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8) +8,self.Enemies[self._EnemyData[ArrPos+i]].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[2])*8,0,8,8),NumbersBMP);
            end;
          end
          else
          begin
            // Insert all drawing code here.
            NumbersBMP.MasterAlpha := 170;
            total := pIndex * 16;
            count := 0;
            for x := 0 to Enemies.Count -1 do
            begin
              if ((Enemies[x]._EnemyType = etCandle)  or ((Enemies[x]._EnemyType = etCandleNoXEditing)))and (Enemies[x]._Type  = pItemIndex)  then
              begin
                if (count >= total - 16) then
                begin
                  if self.Enemies[x].Y > $D8 then
                  begin
                    pBitmap.Draw(bounds(self.Enemies[x].X + ((i div 2) * 64)-8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[1])*8,0,8,8),NumbersBMP);
                    pBitmap.Draw(bounds((self.Enemies[x].X + ((i div 2) * 64)-8) +8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[2])*8,0,8,8),NumbersBMP);
                  end
                  else
                  begin
                    pBitmap.Draw(bounds(self.Enemies[x].X + ((i div 2) * 64)-8,self.Enemies[x].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[1])*8,0,8,8),NumbersBMP);
                    pBitmap.Draw(bounds((self.Enemies[x].X + ((i div 2) * 64)-8) +8,self.Enemies[x].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[2])*8,0,8,8),NumbersBMP);
                  end;
                end;
                inc(Count);

                if Count = total then
                  break;

              end;

            end;
          end;
        end;
      end;
    finally
    FreeAndNil(NumbersBMP);
    end;
  end;

end;

procedure TCVROM.DrawCandlestand(pBitmap: TBitmap32; pItemIndex,pIndex: Integer);
var
  ArrPos, i,x, count, total : Integer;
  NumbersBMP : TBitmap32;
begin
  ArrPos :=  2+ (self.Levels[self._level].screens[self._screen]._ScreenNumber*8);
  // Draw the enemy
  if FileExists(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp') =  true then
  begin
    NumbersBMP := TBitmap32.Create;
    try
      NumbersBMP.Width := 136;
      NumbersBMP.Height := 8;
      NumbersBMP.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp');
      NumbersBMP.DrawMode := dmBlend;
      for i := 0 to 7 do
      begin
        if (i mod 2 = 1) and ((Enemies[_EnemyData[ArrPos+i]]._EnemyType = etCandleStand) or (Enemies[_EnemyData[ArrPos+i]]._EnemyType = etNone)) then
        begin
          if _EnemyData[ArrPos+i] > 0 then
          begin
            NumbersBMP.MasterAlpha := 255;
            if Enemies[_EnemyData[ArrPos+i]].Y > $D8 then
            begin
              pBitmap.Draw(bounds(self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[1])*8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds((self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8) +8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[2])*8,0,8,8),NumbersBMP);
            end
            else
            begin
              pBitmap.Draw(bounds(self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8,self.Enemies[self._EnemyData[ArrPos+i]].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[1])*8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds((self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8) +8,self.Enemies[self._EnemyData[ArrPos+i]].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[2])*8,0,8,8),NumbersBMP);
            end;
          end
          else if _EnemyData[ArrPos+i] = 0 then
          begin
            // Insert all drawing code here.

            NumbersBMP.MasterAlpha := 200;
            total := pIndex * 16;
            count := 0;
            for x := 0 to Enemies.Count -1 do
            begin
              if (Enemies[x]._EnemyType = etCandleStand)and (Enemies[x]._Type  = pItemIndex)  then
              begin
                if (count >= total - 16) then
                begin
                  if self.Enemies[x].Y > $D8 then
                  begin
                    pBitmap.Draw(bounds(self.Enemies[x].X + ((i div 2) * 64)-8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[1])*8,0,8,8),NumbersBMP);
                    pBitmap.Draw(bounds((self.Enemies[x].X + ((i div 2) * 64)-8) +8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[2])*8,0,8,8),NumbersBMP);
                  end
                  else
                  begin
                    pBitmap.Draw(bounds(self.Enemies[x].X + ((i div 2) * 64)-8,self.Enemies[x].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[1])*8,0,8,8),NumbersBMP);
                    pBitmap.Draw(bounds((self.Enemies[x].X + ((i div 2) * 64)-8) +8,self.Enemies[x].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[2])*8,0,8,8),NumbersBMP);
                  end;
                end;
                inc(Count);

                if Count = total then
                  break;

              end;

            end;

          end;
        end;
      end;
    finally
    FreeAndNil(NumbersBMP);
    end;
  end;

end;

procedure TCVROM.DrawEnemies(pBitmap: TBitmap32; pItemIndex,pIndex: Integer);
var
  ArrPos, i,x, count, total : Integer;
  NumbersBMP : TBitmap32;
begin
  ArrPos :=  2+ (self.Levels[self._level].screens[self._screen]._ScreenNumber*8);
  // Draw the enemy
  if FileExists(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp') =  true then
  begin
    NumbersBMP := TBitmap32.Create;
    try
      NumbersBMP.Width := 136;
      NumbersBMP.Height := 8;
      NumbersBMP.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp');
      NumbersBMP.DrawMode := dmBlend;
      NumbersBMP.MasterAlpha := 200;
      for i := 0 to 7 do
      begin
        if i mod 2 = 0 then
        begin

          if _EnemyData[ArrPos+i] > 0 then
          begin
            NumbersBMP.MasterAlpha := 255;
            if Enemies[_EnemyData[ArrPos+i]].Y > $D8 then
            begin
              pBitmap.Draw(bounds(self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[1])*8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds((self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8) +8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[2])*8,0,8,8),NumbersBMP);
            end
            else
            begin
              pBitmap.Draw(bounds(self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8,self.Enemies[self._EnemyData[ArrPos+i]].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[1])*8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds((self.Enemies[self._EnemyData[ArrPos+i]].X + ((i div 2) * 64)-8) +8,self.Enemies[self._EnemyData[ArrPos+i]].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(_EnemyData[ArrPos+i],2)[2])*8,0,8,8),NumbersBMP);
            end;
          end
          else
          begin
            NumbersBMP.MasterAlpha := 170;
            total := pIndex * 16;
            count := 0;
            for x := 0 to Enemies.Count -1 do
            begin
              if (Enemies[x]._EnemyType = etEnemy)and (Enemies[x]._Type  = pItemIndex)  then
              begin
                if (count >= total - 16) then
                begin
                  if self.Enemies[x].Y > $D8 then
                  begin
                    pBitmap.Draw(bounds(self.Enemies[x].X + ((i div 2) * 64)-8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[1])*8,0,8,8),NumbersBMP);
                    pBitmap.Draw(bounds((self.Enemies[x].X + ((i div 2) * 64)-8) +8,$D0-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[2])*8,0,8,8),NumbersBMP);
                  end
                  else
                  begin
                    pBitmap.Draw(bounds(self.Enemies[x].X + ((i div 2) * 64)-8,self.Enemies[x].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[1])*8,0,8,8),NumbersBMP);
                    pBitmap.Draw(bounds((self.Enemies[x].X + ((i div 2) * 64)-8) +8,self.Enemies[x].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(x,2)[2])*8,0,8,8),NumbersBMP);
                  end;
                end;
                inc(Count);

                if Count = total then
                  break;

              end;

            end;
          end;
        end;
      end;
    finally
    FreeAndNil(NumbersBMP);
    end;
  end;
end;

function TCVROM.GetEnemyDataSize: Integer;
begin
  result := length(_EnemyData);
end;

procedure TCVROM.ExportLevel(pFilename : String; pId: Integer;pAllow : Byte);
var
  Mem : TMemoryStream;
  TempString : String;
  TempVar,TempVar2 : Integer;
  TempByte : Byte;
  i,x : Integer;
begin
  Mem := TMemoryStream.Create;
  try
    // Write the header of the SPF file.
    TempString := 'SPF1' + chr(0);
    Mem.Write(TempString[1],4);

    // Write the title of the SPF file.
    TempString := self.Levels[pID]._Name + ' Exported Data';
    TempVar :=Length(TempString);
    Mem.Write(TempVar,1);
    Mem.Write(TempString[1],TempVar);

    // Write the description of the SPF file.
    TempString := 'Exported By Stake v1.1';
    TempVar := Length(TempString);
    Mem.Write(TempVar,1);
    Mem.Write(TempString[1],TempVar);

    // Write the MAIN part.
    TempString := 'MAIN';
    Mem.Write(TempString[1],4);

    if pAllow AND EXPORTGRAPHICS = EXPORTGRAPHICS then
    begin
      // Begin writing the graphics
      Mem.Write(Levels[pID]._GFXOffset,4);
      TempVar := 2304;
      Mem.Write(TempVar,2);
  //    Mem.Write(ROM[Levels[pID]._GFXOffset],TempVar);
      for i :=0 to 2303 do
      begin
        TempVar2 := ROM[Levels[pID]._GFXOffset + i];
        Mem.Write(TempVar2,1);
      end;
    end;
    if pAllow AND EXPORTTSA = EXPORTTSA then
    begin
      // Begin writing the TSA data
      TempVar := Levels[pid].NumberOfLevelTiles * 17;
      Mem.Write(Levels[pID]._TSAOffset,4);
      Mem.Write(TempVar,2);
      for i := 0 to TempVar - 1 do
      begin
        TempVar2 := ROM[Levels[pID].TSAOffset + i];
        Mem.Write(TempVar2,1);
      end;
    end;

    if pAllow AND EXPORTLEVELS = EXPORTLEVELS then
    begin
      // Begin writing the screen data
      for x := 0 to Levels[pID].Screens.Count -1 do
      begin
        Mem.Write(Levels[pID].Screens[x]._Offset,4);
        TempVar := 48;
        Mem.Write(TempVar,2);
        for i := 0 to 47 do
        begin
          TempVar2 := ROM[Levels[pID].Screens[x]._Offset + i];
          Mem.Write(TempVar2,1);
        end;
      end;
    end;

    if pAllow AND EXPORTPALETTE = EXPORTPALETTE then
    begin
      // Write the palette
      Mem.Write(Levels[pID]._BGPalOffset,4);
      TempVar := 16;
      Mem.Write(TempVar,2);
      for i := 0 to 15 do
      begin
        TempVar2 := ROM[Levels[pID]._BGPalOffset + i];
        Mem.Write(TempVar2,1);
      end;
    end;
    if pAllow AND EXPORTENEMYDATA = EXPORTENEMYDATA then
    begin
      // Write the enemy data
      for x := 0 to Levels[pID]._NumberOfEnemySets - 1 do
      begin
        // Write the enemy data pointer.
        Mem.Write(Levels[pID]._EnemyOffsets[x].PointerOffset,4);
        TempVar := 2;
        Mem.Write(TempVar,2);
        TempByte := ROM[Levels[pID]._EnemyOffsets[x].PointerOffset];
        Mem.Write(TempByte,1);
        TempByte := ROM[Levels[pID]._EnemyOffsets[x].PointerOffset + 1];
        Mem.Write(TempByte,1);
        TempVar := ROM.PointerToOffset(Levels[pID]._EnemyOffsets[x].PointerOffset,0,$C000);
        Mem.Write(TempVar,4);
        Mem.Write(Levels[pID]._EnemyOffsets[x].Count,2);
        for i := 0 to Levels[pID]._EnemyOffsets[x].Count - 1 do
        begin
          TempVar2 := ROM[TempVar+i];
          Mem.Write(TempVar2,1);
        end;
      end;
    end;

    // Write the EOF
    TempString := 'EOF';
    Mem.Write(TempString[1],3);
    Mem.SaveToFile(pFilename);
  finally
    FreeAndNil(Mem);
  end;
end;

procedure TCVROM.ImportLevel(pFilename: String);
var
  PatchFile : TPatch;
begin
  if FileExists(pFilename) = True then
  begin
    PatchFile := TPatch.Create(pFilename);
    try
      PatchFile.Execute;
      LoadCurrentPalette();
      LoadPatternTable();
      LoadScreenData();
      LoadEnemyData();
    finally
      FreeAndNil(PatchFile);
    end;
  end;

end;

procedure TCVROM.LoadSpikeCrushersData;
var
  i : Integer;
  TempSpike : TSpikeCrusher;
begin
  if Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers > 0 then
  begin
    if Assigned(Levels[Levels.CurrentLevel].SpikeCrushers) = True then
      FreeAndNil(Levels[self._Level].SpikeCrushers);
      
    Levels[Levels.CurrentLevel].SpikeCrushers := TSpikeCrusherList.Create(True);
    for i := 0 to Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers -1 do
    begin
      Levels[self._Level].SpikeCrushers.Add(TSpikeCrusher.Create);
      TempSpike := Levels[Levels.CurrentLevel].SpikeCrushers.Last;
      TempSpike.InitialDirection := ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i];
      TempSpike.Y := ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i + (1*Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers)] - $20;
      TempSpike.X := ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i + (2*Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers)];
      TempSpike.Screen := ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i + (3*Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers)];
      TempSpike.Desc1 := ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i + (4*Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers)] and $F0;
      TempSpike.Desc2 := ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i + (4*Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers)] and $0F;
    end;
  end;
end;

procedure TCVROM.SaveSpikeCrushersData;
var
  i : Integer;
  TempSpike : TSpikeCrusher;
begin

  if (Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers > 0) and (Assigned(Levels[Levels.CurrentLevel].SpikeCrushers) = True) then
  begin
    for i := 0 to Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers -1 do
    begin
      TempSpike := Levels[Levels.CurrentLevel].SpikeCrushers[i];
      ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i] := TempSpike.InitialDirection;
      ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i + (1*Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers)] := TempSpike.Y + $20;
      ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i + (2*Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers)] := TempSpike.X;
      ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i + (3*Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers)] := TempSpike.Screen;
      ROM[Levels[Levels.CurrentLevel]._SpikeCrusherOffset + i + (4*Levels[Levels.CurrentLevel]._NumberOfSpikeCrushers)] := (TempSpike.Desc1 and $F0) + (TempSpike.Desc2 and $0F);
    end;
  end;

end;

function TCVROM.GetSpikeCrusherUnderMouse(pX, pY: Integer): Integer;
var
  TempScreen : TCVScreen;
  i : Integer;
  Spike : TSpikeCrusher;
begin

  TempScreen := Levels[Levels.CurrentLevel].Screens[self._Screen];
  result := -1;

  if self.Levels[levels.CurrentLevel]._NumberOfSpikeCrushers > 0 then
  begin

    for i := 0 to Levels[Levels.CurrentLevel].SpikeCrushers.Count - 1 do
    begin

      Spike := Levels[Levels.CurrentLevel].SpikeCrushers[i];

      if (TempScreen.StageNumber = Levels[levels.CurrentLevel]._SpikeCrusherStage) and (Spike.Screen = TempScreen.ScreenNumber) then
      begin
        if TempScreen.MultiAreaBit = False Then
        begin

          if ((pX >= Spike.X) and (pX <= Spike.X + 16)) and ((pY >= Spike.Y) and (pY <= Spike.Y + 16)) then
          begin
            result := i;
            exit;
          end
        end
      end;
    end;
  end;

end;

function TCVROM.GetSpikeCrusherXY(pStairID: Integer; pXY: Byte): Integer;
begin
  if pXY = 0 then
    result := Levels[Levels.CurrentLevel].SpikeCrushers[pStairID].X
  else
    result := Levels[Levels.CurrentLevel].SpikeCrushers[pStairID].Y;
end;

procedure TCVROM.SetSpikeCrusherXY(pStairID, pX, pY: Integer);
begin
  if pStairID = -1 then exit;
  if pX > -1 then
  begin
    if pX > 240 then
      Levels[Levels.CurrentLevel].SpikeCrushers[pStairID].X := 240
    else
      Levels[Levels.CurrentLevel].SpikeCrushers[pStairID].X := pX;;
  end;
  if pY > -1 then
  begin
    if pY > 176 then
      Levels[Levels.CurrentLevel].SpikeCrushers[pStairID].Y := 176
    else
      Levels[Levels.CurrentLevel].SpikeCrushers[pStairID].Y := pY;
  end;
  ROM.Changed := True;
end;

procedure TCVROM.LoadFloatingPlatformData;
var
  i : Integer;
begin
  if Assigned(Levels[Levels.CurrentLevel].FloatingPlatforms) = True then
  begin
    for i := 0 to Levels[Levels.CurrentLevel].FloatingPlatforms.Count -1 do
    begin
      Levels[Levels.CurrentLevel].FloatingPlatforms[i].UnknownByte1 := ROM[Levels[Levels.CurrentLevel].FloatingPlatforms[i].Offset];
      Levels[Levels.CurrentLevel].FloatingPlatforms[i].DistanceSpeed := ROM[Levels[Levels.CurrentLevel].FloatingPlatforms[i].Offset + 1];
      Levels[Levels.CurrentLevel].FloatingPlatforms[i].UnknownByte2 := ROM[Levels[Levels.CurrentLevel].FloatingPlatforms[i].Offset + 2];
      Levels[Levels.CurrentLevel].FloatingPlatforms[i].NumPixels := ROM[Levels[Levels.CurrentLevel].FloatingPlatforms[i].Offset + 3];
      Levels[Levels.CurrentLevel].FloatingPlatforms[i].X := ROM[Levels[Levels.CurrentLevel].FloatingPlatforms[i].Offset + 4];
      Levels[Levels.CurrentLevel].FloatingPlatforms[i].Screen := ROM[Levels[Levels.CurrentLevel].FloatingPlatforms[i].Offset + 5];
      Levels[Levels.CurrentLevel].FloatingPlatforms[i].Y := (ROM[Levels[Levels.CurrentLevel].FloatingPlatforms[i].Offset + 6] and $FE) - $20;
      Levels[Levels.CurrentLevel].FloatingPlatforms[i].MultiAreaBitRaw := ROM[Levels[Levels.CurrentLevel].FloatingPlatforms[i].Offset + 6] and 1;
      Levels[Levels.CurrentLevel].FloatingPlatforms[i].Speed := ROM[Levels[Levels.CurrentLevel].FloatingPlatforms[i].Offset + 7];
    end;
  end;
end;

procedure TCVROM.SaveFloatingPlatformData;
var
  i : Integer;
  TempFloat : TFloatingPlatform;
begin
  if Assigned(Levels[Levels.CurrentLevel].FloatingPlatforms) = True then
  begin
    for i := 0 to Levels[Levels.CurrentLevel].FloatingPlatforms.Count -1 do
    begin
      TempFloat := Levels[Levels.CurrentLevel].FloatingPlatforms[i];
      ROM[TempFloat.Offset] := TempFloat.UnknownByte1;
      ROM[TempFloat.Offset + 1] := TempFloat.DistanceSpeed;
      ROM[TempFloat.Offset + 2] := TempFloat.UnknownByte2;
      ROM[TempFloat.Offset + 3] := TempFloat.NumPixels;
      ROM[TempFloat.Offset + 4] := TempFloat.X;
      ROM[TempFloat.Offset + 5] := TempFloat.Screen;
      ROM[TempFloat.Offset + 6] := ((TempFloat.Y + $20) and $FE) + (TempFloat.MultiAreaBitRaw and $1);
      ROM[TempFloat.Offset + 7] := TempFloat.Speed;
    end;
  end;

end;

function TCVROM.GetFloatingPlatformUnderMouse(pX, pY: Integer): Integer;
var
  TempScreen : TCVScreen;
  i : Integer;
  Floaty : TFloatingPlatform;
begin

  TempScreen := Levels[Levels.CurrentLevel].Screens[self._Screen];
  result := -1;

  if Assigned(self.Levels[Levels.CurrentLevel].FloatingPlatforms) = True then
  begin

    for i := 0 to Levels[Levels.CurrentLevel].FloatingPlatforms.Count - 1 do
    begin

      Floaty := Levels[Levels.CurrentLevel].FloatingPlatforms[i];

      if (Floaty.Stage = TempScreen.StageNumber) and (Floaty.Screen = TempScreen.ScreenNumber) then
      begin
        if TempScreen.MultiAreaBit = Floaty.MultiAreaBit then
        begin
          if ((pX >= Floaty.X) and (pX <= Floaty.X + 32)) and ((pY >= Floaty.Y) and (pY <= Floaty.Y + 16)) then
          begin
            result := i;
            exit;
          end
        end;
      end;
    end;
  end;


end;

function TCVROM.GetFloatingPlatformXY(pStairID: Integer;
  pXY: Byte): Integer;
begin
  if pXY = 0 then
    result := Levels[Levels.CurrentLevel].FloatingPlatforms[pStairID].X
  else
    result := Levels[Levels.CurrentLevel].FloatingPlatforms[pStairID].Y;
end;

procedure TCVROM.SetFloatingPlatformXY(pPlatID, pX, pY: Integer);
begin
  if pPlatID = -1 then exit;
  if pX > -1 then
  begin
    if pX > 224 then
      Levels[Levels.CurrentLevel].FloatingPlatforms[pPlatID].X := 224
    else
      Levels[Levels.CurrentLevel].FloatingPlatforms[pPlatID].X := pX;
  end;
  if pY > -1 then
  begin
    if pY > 176 then
      Levels[Levels.CurrentLevel].FloatingPlatforms[pPlatID].Y := 176
    else
      Levels[Levels.CurrentLevel].FloatingPlatforms[pPlatID].Y := pY;
  end;
  ROM.Changed := True;
end;

procedure TCVROM.GetScreenFloatingPlatform(pStringList: TStringList;
  pFloatID: Integer);
var
  TempScreen : TCVScreen;
  TempFloat : TFloatingPlatform;
  i : Integer;
begin
  TempFloat := Levels[Levels.CurrentLevel].FloatingPlatforms[pFloatID];
  for i := 0 to Levels[Levels.CurrentLevel].Screens.Count - 1 do
  begin
    TempScreen := Levels[Levels.CurrentLevel].Screens[i];
    if TempScreen.StageNumber = TempFloat.Stage then
      pStringList.Add(IntToHex(TempScreen.ID,2));
  end;

end;


destructor TCVROM.Destroy;
begin
  FreeAndNil(self._Tiles);

  FreeAndNil(Levels);
  FreeAndNil(SoundEffects);
  FreeAndNil(TitleScreen);
  FreeAndNil(CastleIntro);
  FreeAndNil(IntroExpansion);
  FreeAndNil(Statistics);
  FreeAndNil(MusicPointers);
  FreeAndNil(MusicPointersTemplate);
  FreeAndNil(Damage);
  FreeAndNil(Enemies);
  FreeAndNil(ending);
  FreeAndNil(ROM);
  inherited;
end;

procedure TCVROM.LoadNonDoors;
var
  i : Integer;
begin
  if Assigned(Levels[self._Level].NonStandardDoors) = True then
  begin

    for i := 0 to Levels[self._Level].NonStandardDoors.Count -1 do
    begin
      Levels[self._Level].NonStandardDoors[i].Y := ROM[Levels[self._Level].NonStandardDoors[i].Offset] - $20;
      Levels[self._Level].NonStandardDoors[i].X := ROM[Levels[self._Level].NonStandardDoors[i].Offset+1] - $8;
      Levels[self._Level].NonStandardDoors[i].ScreenNumber := ROM[Levels[self._Level].NonStandardDoors[i].Offset+2];
      Levels[self._level].NonStandardDoors[i].WalkToX := ROM[Levels[self._Level].NonStandardDoors[i].WalkToXOffset];
    end;

  end;
end;

procedure TCVROM.SaveNonDoors;
var
  i : Integer;
begin
  if Assigned(Levels[self._Level].NonStandardDoors) = True then
  begin

    for i := 0 to Levels[self._Level].NonStandardDoors.Count -1 do
    begin
      ROM[Levels[self._Level].NonStandardDoors[i].Offset] := Levels[self._Level].NonStandardDoors[i].Y + $20;
      ROM[Levels[self._Level].NonStandardDoors[i].Offset+1] := Levels[self._Level].NonStandardDoors[i].X + $8;
      ROM[Levels[self._Level].NonStandardDoors[i].Offset+2] := Levels[self._Level].NonStandardDoors[i].ScreenNumber;
      ROM[Levels[self._Level].NonStandardDoors[i].WalkToXOffset] := Levels[self._level].NonStandardDoors[i].WalkToX;
    end;

  end;

end;

function TCVROM.GetNonDoorUnderMouse(pX, pY: Integer): Integer;
var
  NonDoor : TNonStandardDoor;
  TempScreen : TCVScreen;
  i : Integer;
begin
  TempScreen := Levels[Levels.CurrentLevel].Screens[self._Screen];
  result := -1;

  if Assigned(Levels[_Level].NonStandardDoors) = True then
  begin
    if Levels[_Level].NonStandardDoors.Count > 0 then
    begin
      for i := 0 to Levels[_Level].NonStandardDoors.Count - 1 do
      begin
        NonDoor := Levels[_Level].NonStandardDoors[i];

        if (NonDoor.Stage = TempScreen.StageNumber) then
        begin
          if NonDoor.ScreenNumber = TempScreen.ScreenNumber then
          begin
            if (pX >= NonDoor.X) and (pX <= NonDoor.X + 16) then
            begin
              if (pY >= NonDoor.Y) and (pY <= NonDoor.Y + 16) then
              begin
                result := i;
                exit;
              end;
            end;
          end;
        end;

      end;
    end;
  end;

end;

function TCVROM.GetNonDoorXY(pXY, pDoorID: Integer): Integer;
begin
  if pXY = 0 then
    result := Levels[Levels.CurrentLevel].NonStandardDoors[pDoorID].X
  else
    result := Levels[Levels.CurrentLevel].NonStandardDoors[pDoorID].Y;
end;

procedure TCVROM.SetNonDoorXY(pDoorID, pX, pY: Integer);
begin
  if pX > -1 then
  begin
    if pX > 240 then
      Levels[Levels.CurrentLevel].NonStandardDoors[pDoorID].X := 240
    else
      Levels[Levels.CurrentLevel].NonStandardDoors[pDoorID].X := pX;
  end;
  if pY > -1 then
  begin
    if pY > 176 then
      Levels[Levels.CurrentLevel].NonStandardDoors[pDoorID].Y := 176
    else
      Levels[Levels.CurrentLevel].NonStandardDoors[pDoorID].Y := pY;
  end;
end;

function TCVROM.GetPalVal(index1, index2: Integer): Byte;
begin
  result := _palette[index1,index2];
end;

procedure TCVROM.SetPalVal(index1, index2: Integer; const Value: Byte);
begin
  _palette[index1,index2] := Value;
end;

function TCVROM.GetMapVal(index1, index2: Integer): Byte;
begin
  result := _Map[index1,index2];
end;

procedure TCVROM.SetMapVal(index1, index2: Integer; const Value: Byte);
begin
  _Map[index1,index2] := Value;
end;

function TCVROM.GetScreenData(index1, index2: Integer): Byte;
begin
  result := 0;
  if (index1 <= 7) and (index2 <= 5)  then
  begin
    result := _ScreenData[index1,index2];
  end;
end;

procedure TCVROM.SetChanged(pChanged : Boolean);
begin
  ROM.Changed := pChanged;
end;

procedure TCVROM.SetScreenData(index1, index2: Integer; const Value: Byte);
begin
  // Check if the pX/pY aren't greater than the
  // size of the array.
  // Also check that the block number that is being
  // passed is within the number of tiles limit for the level.
  if (index1 <= 7) and (index2 <= 5) and (Value <= NumberOfTiles) then
  begin
    _ScreenData[index1,index2] := Value;
  end;
  ROM.Changed := True;
end;

function TCVROM.CHRCount: Byte;
begin
  result := ROM.CHRCount;
end;

function TCVROM.FileSize: Integer;
begin
  result := ROM.ROMSize;
end;

function TCVROM.MemoryMapper: Byte;
begin
  result := ROM.MapperNumber;
end;

function TCVROM.MemoryMapperStr: String;
begin
  result := ROM.MapperName;
end;

function TCVROM.PRGCount: Byte;
begin
  result := ROM.PRGCount;
end;

procedure TCVROM.LoadHiddenItemsData;
var
  TempLevel : TLevel;
  i,x,z : Integer;
  HiddenItem : THiddenItem;
begin

  for i := 0 to _NumberOfLevels - 1 do
  begin

    TempLevel := Levels[i];
    if assigned(TempLevel.HiddenItems) = false then
      TempLevel.HiddenItems := THiddenItemList.Create(True)
    else
      exit;

    for x := 0 to TempLevel._NumberOfStages -1 do
    begin

      z := ROM.PointerToOffset(TempLevel._HiddenItemPointers[x],$18010);
      // Now we load in all the breakable blocks.
      while (ROM[z] <> $FF) do
      begin

        TempLevel.HiddenItems.Add(THiddenItem.Create);

        HiddenItem := TempLevel.HiddenItems.Last;
        HiddenItem.StageNumber := x;
        HiddenItem.Y := (ROM[z] and $F0) - $10;
        HiddenItem.MultiAreaBitRaw := ROM[z] and $8;
        HiddenItem.UnknownBit1 := ROM[z] and $7;
        // False if he needs to crouch ^_^
        HiddenItem.SimonMustCrouchRaw := ROM[z] and $1;
        HiddenItem.ScreenNumber := ROM[z +1] and $7;
        HiddenItem.X := ROM[z+1] and $F8;


        HiddenItem.ItemType := ROM[z+3];

        z := z + 4;
      end;
    end;
  end;

end;

procedure TCVROM.SaveHiddenItemsData;
begin

end;

function TCVROM.GetNumberOfHiddenItems: Integer;
var
  TempScreen : TCVScreen;
  count, i : Integer;
begin

  TempScreen := Levels[Levels.CurrentLevel].Screens[self._Screen];
  count := 0;

  if assigned(Levels[Levels.CurrentLevel].HiddenItems) = false then
  begin
    result := count;
    exit;
  end;

  if (Levels[Levels.CurrentLevel].HiddenItems.Count = 0) then
  begin
    result := count;
    exit;
  end;

  for i := 0 to Levels[Levels.CurrentLevel].HiddenItems.Count - 1 do
    if Levels[Levels.CurrentLevel].HiddenItems[i].StageNumber = TempScreen._StageNumber then
      inc(count);

  result := count;

end;

{ TLevel }

destructor TLevel.Destroy;
begin
  FreeAndNil(self.SpikeCrushers);
  FreeAndNil(self.Stairs);
  FreeAndNil(self.Entrances);
  FreeAndNil(self.Doors);
  FreeAndNil(self.BreakableBlocks);
  FreeAndNil(self.Screens);
  FreeAndNil(self.FloatingPlatforms);
  FreeAndNil(self.NonStandardDoors);
  FreeAndNil(HiddenItems);
  inherited;

end;

function TLevel.GetBossVal(Index: Integer): Byte;
begin
  result := ROM[self._BossOffsets[Index]];
end;

function TLevel.GetEnemyDataOffset(pScreenID : Integer): Integer;
begin
  result := ROM.PointerToOffset(self._EnemyOffsets[self.Screens[pScreenID].EnemyList].PointerOffset,0,$C000);
end;

function TLevel.GetEnemyDataPointer(pScreenID : Integer): String;
var
  TempStr : String;
begin
  TempStr := IntToHex(ROM[self._EnemyOffsets[self.Screens[pScreenID].EnemyList].PointerOffset+1],2);
  TempStr := TempStr + IntToHex(ROM[self._EnemyOffsets[self.Screens[pScreenID].EnemyList].PointerOffset],2);
  result := TempStr;
end;

function TLevel.GetEnemyDataPointerOffset(pScreenID : Integer): Integer;
begin
  result := self._EnemyOffsets[self.Screens[pScreenID].EnemyList].PointerOffset;
end;

function TLevel.GetTimeVal(Index: Integer): Byte;
begin
  result := ROM[self._TimeOffsets[Index]];
end;


procedure TLevel.SetBossVal(Index: Integer; const Value: Byte);
begin
  ROM[self._BossOffsets[Index]] := Value;
end;

procedure TLevel.SetTimeVal(Index: Integer; const Value: Byte);
begin
  ROM[self._TimeOffsets[Index]] := Value;
end;

{ TEnemy }

constructor TEnemy.Create(pPointerOffset: Integer);
begin
  self._Offset := ROM.PointerToOffset(pPointerOffset,0,$C000);
  // Now we work out where the pointer leads to.

  if ROM[self._Offset] = 0 then
    self.EnemyType := etNone
  else
  begin
    if ROM[self._Offset] = $FF then
    begin
      _Type := ROM[self._Offset+1];
      if ROM[self._Offset+2] = $FE then
      begin
        self.EnemyType := etCandleStand;
        self.X := ROM[self._Offset+3];
        self.Y := ROM[self._Offset+4];
      end
      else
      begin
        self.EnemyType := etCandle;
        self.X := ROM[self._Offset+2];
        self.Y := ROM[self._Offset+3];
      end;
    end
    else if ROM[self._Offset] = $FE then
    begin
      self.EnemyType := etCandleStand;
      self.X := ROM[self._Offset+1];
      self.Y := ROM[self._Offset+2];
    end
    else if ROM[self._Offset] and $20 = $20 then
    begin
      self.EnemyType := etCandleNoXEditing;
      self.X := ROM[self._Offset];
      self.Y := ROM[self._Offset+1];
    end
    else
    begin
      self._EnemyType := etEnemy;
      self.EnemyItem := ROM[self._Offset];
      self.X := ROM[self._Offset+1];
      self.Y := ROM[self._Offset+2];
    end;
  end;
end;

{ TEnemyList }

function TEnemyList.Add(AObject: TEnemy): Integer;
begin
  Result := inherited Add(AObject);
end;

function TEnemyList.GetEnemyItem(Index: Integer): TEnemy;
begin
  Result := TEnemy(inherited Items[Index]);
end;

function TEnemyList.Last: TEnemy;
begin
  Result := TEnemy(inherited Last);
end;

function TEnemyList.NumberOfCandles: Integer;
var
  i : Integer;
  countvar : Integer;
begin
  countvar := 0;
  for i := 0 to self.Count - 1 do
  begin
    if (self.Items[i]._EnemyType = etCandle) or (self.Items[i]._EnemyType = etCandleNoXEditing) then
    begin
      inc(countvar);
    end;
  end;
  result := countvar;
end;

function TEnemyList.NumberOfCandlesFilter(pIndex: Integer): Integer;
var
  i : Integer;
  countvar : Integer;
begin
  countvar := 0;
  for i := 0 to self.Count - 1 do
  begin
    if (self.Items[i]._EnemyType = etCandle) or (self.Items[i]._EnemyType = etCandleNoXEditing) then
    begin
      if self.Items[i].EnemyItem = pIndex then
        inc(countvar);
    end;
  end;
  result := countvar;

end;

function TEnemyList.NumberOfCandleStands: Integer;
var
  i : Integer;
  countvar : Integer;
begin
  countvar := 0;
  for i := 0 to self.Count - 1 do
  begin
    if (self.Items[i]._EnemyType = etCandlestand) then
    begin
      inc(countvar);
    end;
  end;
  result := countvar;

end;

function TEnemyList.NumberOfCandleStandsFilter(pIndex: Integer): Integer;
var
  i : Integer;
  countvar : Integer;
begin
  countvar := 0;
  for i := 0 to self.Count - 1 do
  begin
    if (self.Items[i]._EnemyType = etCandlestand) then
    begin
      if self.Items[i].EnemyItem = pIndex then
        inc(countvar);
    end;
  end;
  result := countvar;

end;

function TEnemyList.NumberOfEnemies: integer;
var
  i : Integer;
  countvar : Integer;
begin
  countvar := 0;
  for i := 0 to self.Count - 1 do
  begin
    if (self.Items[i]._EnemyType = etEnemy) then
    begin
      inc(countvar);
    end;
  end;
  result := countvar;

end;

function TEnemyList.NumberOfEnemiesFilter(pIndex: Integer): integer;
var
  i : Integer;
  countvar : Integer;
begin
  countvar := 0;
  for i := 0 to self.Count - 1 do
  begin
    if (self.Items[i]._EnemyType = etEnemy) then
    begin
      if self.Items[i].EnemyItem = pIndex then
        inc(countvar);
    end;
  end;
  result := countvar;

end;

procedure TEnemyList.SetEnemyItem(Index: Integer; const Value: TEnemy);
begin
  inherited Items[Index] := Value;
end;

{ TLevelList }

function TLevelList.Add(AObject: TLevel): Integer;
begin
  Result := inherited Add(AObject);
end;

function TLevelList.GetCurrentLevel: Integer;
begin
  result := self._CurrentLevel;
end;

function TLevelList.GetLevelItem(Index: Integer): TLevel;
begin
  Result := TLevel(inherited Items[Index]);
end;

procedure TLevelList.SetCurrentLevel(const Value: Integer);
begin
  self._CurrentLevel := Value;
end;

procedure TLevelList.SetLevelItem(Index: Integer; const Value: TLevel);
begin
  inherited Items[Index] := Value;
end;

{ TScreenList }

function TScreenList.Add(AObject: TCVScreen): Integer;
begin
  Result := inherited Add(AObject);
end;

function TScreenList.GetScreenItem(Index: Integer): TCVScreen;
begin
  Result := TCVScreen(inherited Items[Index]);
end;

function TScreenList.Last: TCVScreen;
begin
  Result := TCVScreen(inherited Last);
end;

procedure TScreenList.SetScreenItem(Index: Integer; const Value: TCVScreen);
begin
  inherited Items[Index] := Value;
end;



end.

