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

// This unit contains the definitions of the
// Stake configuration class. It also
// contains several "global" declared classes, variables
// and constants to be used in Stake.
// If you wish to add functionality to Stake, add this
// unit to your Uses clause.
unit cConfig;

interface

uses classes,INIFiles, Forms,SysUtils, cCVROM, gr32, dialogs;

type
  // This is a record used to return values from the explodeenecan function.
  TExplodeRes = record
    ID : String;
    Name : String;
  end;

  // This class contains all the options settings for
  // Stake. The internal variables are exposed as properties.
  // When the properties are written to, they usually set the
  // _changed variable to True.
  TStakeConfiguration = class (TObject)
  private
    _OptionsFilename : String;
    _LastROMLoaded : String;
    _Palette : String;
    _LeftTextColour : TColor32;
    _MidTextColour : TColor32;
    _GridlineColour : TColor32;
    
    _GridlinesEnabled,_GridlinesOnDef : Boolean;
    _DisplayLeftMiddleText : Boolean;

    _DataFile : String;
    _Changed : Boolean;
    _BackupFiles : Boolean;
    _EmulatorPath : String;
    _EmulatorFilenameSettings : Byte;
    _EmulatorDisplaySaveWarning : Boolean;
    _LastPaletteTSA : Byte;
    _LastPaletteTileEditor : Byte;
    _LastPaletteTitleScreenEd : Byte;
    _LastPaletteCastleIntro : Byte;
    _LastPaletteEnding : Byte;
    _DrawIconsTransparent : Boolean;
    _IconTransparency : Byte;
    _ShowBlackBar : Boolean;
    _SetObjModeWhenAddingNewStair : Boolean;
    _MapperWarnings : Byte;
    _RecentlyOpenedFiles : TStringlist;
    _AutoCheck : Boolean;
    _OriginalROMFile : String;
    _IPSOutput : String;

    function GetFullPalette: String;
    procedure SetFullPalette(const Value: String);
    function GetFullDataFilename: String;
    procedure SetFullDataFileName(const Value: String);
    procedure SetDataFile(const Value: String);
    procedure SetDisplayLeftMiddleText(const Value: Boolean);
    procedure SetGridlinesEnabled(const Value: Boolean);
    procedure SetOptionsFileName(const Value: String);
    procedure SetPalette(const Value: String);
    procedure SetLastROMLoad(const Value: String);
    procedure SetGridlinesOnDef(const Value: Boolean);
    procedure SetBackupFiles(const Value: Boolean);
    procedure SetEmu83Filename(const Value: Byte);
    procedure SetEmulatorDisplaySaveWarning(const Value: Boolean);
    procedure SetEmuPath(const Value: String);
    procedure SetLastPaletteTileEditor(const Value: Byte);
    procedure SetLastPaletteTitleScreen(const Value: Byte);
    procedure SetLastPaletteTSA(const Value: Byte);
    procedure SetDrawIconsTransparent(const Value: Boolean);
    procedure SetIconTransparency(const Value: Byte);
    procedure SetBlackBar(const Value: Boolean);
    procedure SetSetObjModeWhenAddingNewStair(const Value: Boolean);
    function  ExplodeCanEne(pString : String): TExplodeRes;
    procedure SetMapperWarnings(const Value: Byte);
    function GetNumberOfRecentlyOpenedFiles: Integer;
    function GetRecentFile(index: Integer): String;
    procedure SetRecentFile(index: Integer; const Value: String);
    procedure SetupMRU;
    procedure SetLastPaletteCastleIntro(const Value: Byte);
    procedure SetLastPaletteEnding(const Value: Byte);
    procedure SetAutoCheck(const Value: Boolean);
    procedure SetOriginalROMFile(const Value : String);
    procedure SetIPSOutput(const Value : String);
    procedure SetLeftTextColour(pLeftTextColour : TColor32);
    procedure SetMiddleTextColour(pMiddleTextColour : TColor32);
    procedure SetGridlineColour(pGridlineColour : TColor32);    
  public
    procedure Save;
    procedure Load;
    procedure LoadDefaultSettings();
    destructor Destroy;override;
    property LeftTextColour : TColor32 read _LeftTextColour write SetLeftTextColour;
    property MiddleTextColour : TColor32 read _MidTextColour write SetMiddleTextColour;
    property GridlineColour : TColor32 read _GridlineColour write SetGridlineColour;
    property Changed : Boolean read _Changed;
    property LastROMLoaded : String read _LastROMLoaded write SetLastROMLoad;
    property NumberOfRecentlyOpenedFiles : Integer read GetNumberOfRecentlyOpenedFiles;
    property RecentFile [index : Integer] : String read GetRecentFile write SetRecentFile;
    procedure AddRecentFile(pNewFile : String);
    property Filename : String read _OptionsFilename write SetOptionsFileName;
    property Palette : String read _Palette write SetPalette;
    property FullPaletteName : String read GetFullPalette write SetFullPalette;
    property GridlinesOn : Boolean read _GridlinesEnabled write SetGridlinesEnabled;
    property GridlinesOnByDefault : Boolean read _GridlinesOnDef write SetGridlinesOnDef;
    property DispLeftMidText : Boolean read _DisplayLeftMiddleText write SetDisplayLeftMiddleText;
    property DataFileName : String read _DataFile write SetDataFile;
    property FullDataFileName : String read GetFullDataFilename write SetFullDataFileName;

    property BackupFilesWhenSaving : Boolean read _BackupFiles write SetBackupFiles;
    property EmulatorPath : String read _EmulatorPath write SetEmuPath;
    property EmulatorFilenameSettings : Byte read _EmulatorFilenameSettings write SetEmu83Filename;
    property EmulatorDisplaySaveWarning : Boolean read _EmulatorDisplaySaveWarning write SetEmulatorDisplaySaveWarning;
    property LastPaletteTSA : Byte read _LastPaletteTSA write SetLastPaletteTSA;
    property LastPaletteTileEditor : Byte read _LastPaletteTileEditor write SetLastPaletteTileEditor;
    property LastPaletteTitleScreenEd : Byte read _LastPaletteTitleScreenEd write SetLastPaletteTitleScreen;
    property LastPaletteEnding : Byte read _LastPaletteEnding write SetLastPaletteEnding;
    property LastPaletteCastleIntro : Byte read _LastPaletteCastleIntro write SetLastPaletteCastleIntro;
    property DrawTransparentIcons : Boolean read _DrawIconsTransparent write SetDrawIconsTransparent;
    property IconTransparency : Byte read _IconTransparency write SetIconTransparency;
    property BlackBar : Boolean read _ShowBlackBar write SetBlackBar;
    property SetObjectEditingOnWhenAddingNewStair : Boolean read _SetObjModeWhenAddingNewStair write SetSetObjModeWhenAddingNewStair;
    property MapperWarnings : Byte read _MapperWarnings write SetMapperWarnings;
    property AutoCheck : Boolean read _AutoCheck write SetAutoCheck;
    property OriginalROMFile : String read _OriginalROMFile write SetOriginalROMFile;
    property IPSOutput : String read _IPSOutput write SetIPSOutput;
    constructor Create(pOptionsFilename : String);
    procedure LoadDefaultEnemyNames;
    procedure LoadDefaultCandleNames;
    procedure LoadEnemyNames(pFilename : String);
    procedure LoadCandleNames(pFilename : String);

  end;



implementation

uses uglobal;

{ TStakeConfiguration }

// Called when the object is created.
// Basically loads all the default settings,
// loads, and then re-saves them. The loading of
// default settings is a bit unneeded, but it
// probably doesn't add too much overhead, so
// it's not a major priority.
constructor TStakeConfiguration.Create(pOptionsFilename : String);
begin
//  LoadDefSettings;
  _OptionsFilename := pOptionsFilename;
  Load;
  Save;
end;

// Loads in the settings from the INI file.
procedure TStakeConfiguration.Load;
var
  INI : TMemINIFile;
begin
  if FileExists(_OptionsFilename) then
  begin
    INI := TMemINIFile.Create(_OptionsFilename);
    try
      _Palette := ini.ReadString('General','Palette','fx3nespal.pal');
      _LastROMLoaded := INI.ReadString('General','LastROMLoaded','');
      _LeftTextColour := (INI.ReadInteger('LeftText','A',$FF) shl 24) + (INI.ReadInteger('LeftText','R',$FF) shl 16)
      + (INI.ReadInteger('LeftText','G',$00) shl 8) + (INI.ReadInteger('LeftText','B',$00));
      _MidTextColour := (INI.ReadInteger('MidText','A',$FF) shl 24) + (INI.ReadInteger('MidText','R',$00) shl 16)
      + (INI.ReadInteger('MidText','G',$FF) shl 8) + (INI.ReadInteger('MidText','B',$00));
      _GridlineColour := (INI.ReadInteger('Gridline','A',$FF) shl 24) + (INI.ReadInteger('Gridline','R',$FF) shl 16)
      + (INI.ReadInteger('Gridline','G',$FF) shl 8) + (INI.ReadInteger('Gridline','B',$FF));
      _GridlinesOnDef := INI.ReadBool('General','Gridlines',True);
      _GridlinesEnabled := _GridlinesOnDef;
      _DisplayLeftMiddleText := INI.ReadBool('General','DispMidLeftText', True);
      _DataFile := INI.ReadString('General','DataFile','Castlevania (U) (PRG 1).ini');
      _BackupFiles := INI.ReadBool('General','Backup',True);
      _EmulatorFilenameSettings := INI.ReadInteger('General','EmuFileSettings',0);
      _EmulatorPath := INI.ReadString('General','EmulatorPath','');
      _EmulatorDisplaySaveWarning := INI.ReadBool('General','EmuDisplaySaveWarning',True);
      _LastPaletteTSA := INI.ReadInteger('General','LastPalTilEd',0);
      _LastPaletteTileEditor := INI.ReadInteger('General','LastPalTSA',0);
      _LastPaletteTitleScreenEd := INI.ReadInteger('General','LastPalTitle',0);
      _LastPaletteEnding := INI.ReadInteger('General','LastPalEnding',0);
      _LastPaletteCastleIntro := INI.ReadInteger('General','LastPalIntro',0);
      _IconTransparency := INI.ReadInteger('General','IconTransparency',200);
      _DrawIconsTransparent := INI.ReadBool('General','UseIconTransparency',False);
      _ShowBlackBar := INI.ReadBool('General','ShowBlackBar',False);
      _SetObjModeWhenAddingNewStair := INI.ReadBool('General','SetObjModeWhenAddingNewStair',True);
      _OriginalROMFile := INI.ReadString('IPS','Original','');
      _IPSOutput := INI.ReadString('IPS','Output','');
      _MapperWarnings := INI.ReadInteger('General','MapperWarnings',0);
      _AutoCheck := INI.ReadBool('General','AutoCheck',True);
      SetupMRU();

      _RecentlyOpenedFiles[0] := (INI.ReadString('Recent','RecentFile0',''));
      _RecentlyOpenedFiles[1] := (INI.ReadString('Recent','RecentFile1',''));
      _RecentlyOpenedFiles[2] := (INI.ReadString('Recent','RecentFile2',''));
      _RecentlyOpenedFiles[3] := (INI.ReadString('Recent','RecentFile3',''));
      _RecentlyOpenedFiles[4] := (INI.ReadString('Recent','RecentFile4',''));
      _Changed := False;
    finally
      FreeAndNil(INI);
    end;
  end
  else
    Save;
end;

// Loads the default settings. A public procedure.
// Used in the preferences dialog with the button
// for setting the default settings.
procedure TStakeConfiguration.LoadDefaultSettings;
begin
  SetupMRU();
  _Palette := 'fx3nespal.pal';
  _LeftTextColour := $FFFF0000;
  _MidTextColour := $FF00FF00;
  _GridlineColour := $FFFFFFFF;
  _OriginalROMFile := '';
  _IPSOutput := '';
  _GridlinesOnDef := True;
  _DisplayLeftMiddleText := True;
  _EmulatorFilenameSettings := 0;
  _BackupFiles := True;
  _EmulatorDisplaySaveWarning := True;
  _LastPaletteTSA := 0;
  _LastPaletteTileEditor := 0;
  _LastPaletteTitleScreenEd := 0;
  _LastPaletteCastleIntro := 0;
  _LastPaletteEnding := 0;
  _IconTransparency := 200;
  _DrawIconsTransparent := False;
  _ShowBlackBar := False;
  _SetObjModeWhenAddingNewStair := True;

  _MapperWarnings := 0;
  _AutoCheck := True;
end;

procedure TStakeConfiguration.SetupMRU;
var
  i, initcount : Integer;
begin
  if Assigned(_RecentlyOpenedFiles) = false then
    _RecentlyOpenedFiles := TStringList.Create;

  if _RecentlyOpenedFiles.Count < 5 then
  begin
    initcount := _RecentlyOpenedFiles.Count;
    for i := initcount to 4 do
      _RecentlyOpenedFiles.Add('');
  end;

end;

// Saves the options settings to INI file.
procedure TStakeConfiguration.Save;
var
  INI : TMemINIFile;
begin
  INI := TMemINIFile.Create(_OptionsFilename);
  try

    // Write the left text settings.
    INI.WriteInteger('LeftText','R',(_LeftTextColour and $00FF0000) shr 16);
    INI.WriteInteger('LeftText','G',(_LeftTextColour and $0000FF00) shr 8);
    INI.WriteInteger('LeftText','B',_LeftTextColour and $0000FF);
    INI.WriteInteger('LeftText','A',_LeftTextColour shr 24);
    // Write the middle text settings
    INI.WriteInteger('MidText','R',(_MidTextColour and $00FF0000) shr 16);
    INI.WriteInteger('MidText','G',(_MidTextColour and $0000FF00) shr 8);
    INI.WriteInteger('MidText','B',_MidTextColour and $0000FF);
    INI.WriteInteger('MidText','A',_MidTextColour shr 24);
    // Write the gridline settings
    INI.WriteInteger('Gridline','R',(_GridlineColour and $00FF0000) shr 16);
    INI.WriteInteger('Gridline','G',(_GridlineColour and $0000FF00) shr 8);
    INI.WriteInteger('Gridline','B',_GridlineColour and $0000FF);
    INI.WriteInteger('Gridline','A',_GridlineColour shr 24);

    ini.WriteString('General','Palette',_Palette);
    INI.WriteString('General','LastROMLoaded',_LastROMLoaded);

    INI.WriteBool('General','Gridlines',_GridlinesOnDef);
    INI.WriteBool('General','DispMidLeftText',_DisplayLeftMiddleText);

    INI.WriteString('General','DataFile',_DataFile);
    INI.WriteString('General','EmulatorPath',_EmulatorPath);
    INI.WriteInteger('General','EmuFileSettings',_EmulatorFilenameSettings);
    INI.WriteBool('General','Backup',_BackupFiles);
    INI.WriteBool('General','EmuDisplaySaveWarning',_EmulatorDisplaySaveWarning);
    INI.WriteInteger('General','LastPalTilEd',_LastPaletteTSA);
    INI.WriteInteger('General','LastPalTSA',_LastPaletteTileEditor);
    INI.WriteInteger('General','LastPalTitle',_LastPaletteTitleScreenEd);
    INI.WriteInteger('General','LastPalIntro',_LastPaletteCastleIntro);
    INI.WriteInteger('General','LastPalEnding',_LastPaletteEnding);
    INI.WriteInteger('General','IconTransparency',_IconTransparency);
    INI.WriteBool('General','UseIconTransparency',_DrawIconsTransparent);
    INI.WriteBool('General','ShowBlackBar',_ShowBlackBar);
    INI.WriteBool('General','SetObjModeWhenAddingNewStair',_SetObjModeWhenAddingNewStair);
    INI.WriteString('IPS','Original',_OriginalROMFile);
    INI.WriteString('IPS','Output',_IPSOutput);
    INI.WriteInteger('General','MapperWarnings',_MapperWarnings);
    INI.WriteBool('General','AutoCheck',_AutoCheck);
    SetupMRU();
    INI.WriteString('Recent','RecentFile0',_RecentlyOpenedFiles[0]);
    INI.WriteString('Recent','RecentFile1',_RecentlyOpenedFiles[1]);
    INI.WriteString('Recent','RecentFile2',_RecentlyOpenedFiles[2]);
    INI.WriteString('Recent','RecentFile3',_RecentlyOpenedFiles[3]);
    INI.WriteString('Recent','RecentFile4',_RecentlyOpenedFiles[4]);

    INI.UpdateFile;
    _Changed := False;
  finally
    FreeAndNil(INI);
  end;
end;

// The following functions are used for the properties.

// Returns the full path of the datafile, including the
// base directories that is contained in, e.g.
// C:\program files\stake\Data\somedatafile.ini
function TStakeConfiguration.GetFullDataFilename: String;
begin
  result := ExtractFileDir(Application.ExeName) + '\Data\' + _DataFile;
end;

// Returns the full path of the palette file, including
// all the base directories that it is contained in,
// e.g. C:\Program Files\Stake\Palettes\somepalette.pal.
function TStakeConfiguration.GetFullPalette: String;
begin
  result := ExtractFileDir(Application.ExeName) + '\Palettes\' + _Palette;
end;

procedure TStakeConfiguration.SetBackupFiles(const Value: Boolean);
begin
  _BackupFiles := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetBlackBar(const Value: Boolean);
begin
  _ShowBlackBar := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetDataFile(const Value: String);
begin
  _DataFile := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetDisplayLeftMiddleText(
  const Value: Boolean);
begin
  _DisplayLeftMiddleText := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetDrawIconsTransparent(
  const Value: Boolean);
begin
  _DrawIconsTransparent := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetEmu83Filename(const Value: Byte);
begin
  _EmulatorFilenameSettings := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetEmulatorDisplaySaveWarning(
  const Value: Boolean);
begin
  _EmulatorDisplaySaveWarning := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetEmuPath(const Value: String);
begin
  _EmulatorPath := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetFullDataFileName(const Value: String);
begin
  _DataFile := ExtractFileName(Value);
  _Changed := True;
end;

procedure TStakeConfiguration.SetFullPalette(const Value: String);
begin
  _Palette := ExtractFileName(Value);
  _Changed := True;
end;


procedure TStakeConfiguration.SetGridlinesEnabled(const Value: Boolean);
begin
  _GridlinesEnabled := Value;
end;

procedure TStakeConfiguration.SetGridlinesOnDef(const Value: Boolean);
begin
  _GridlinesOnDef := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetIconTransparency(const Value: Byte);
begin
  _IconTransparency := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetLastPaletteTileEditor(const Value: Byte);
begin
  _LastPaletteTileEditor := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetLastPaletteTitleScreen(const Value: Byte);
begin
  _LastPaletteTitleScreenEd := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetLastPaletteTSA(const Value: Byte);
begin
  _LastPaletteTSA := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetLastROMLoad(const Value: String);
begin
  _LastROMLoaded := Value;
  _Changed := True;
end;






procedure TStakeConfiguration.SetOptionsFileName(const Value: String);
begin
  _OptionsFilename := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetPalette(const Value: String);
begin
  _Palette := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetSetObjModeWhenAddingNewStair(
  const Value: Boolean);
begin
  _SetObjModeWhenAddingNewStair := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.LoadCandleNames(pFilename: String);
var
  TempStrList : TStringList;
  TempData : TExplodeRes;
  i,x : Integer;
begin
  TempStrList := TStringList.Create;
  try
    TempStrList.LoadFromFile(pFilename);
    for i := 0 to TempStrList.Count -1 do
    begin
      TempData := self.ExplodeCanEne(TempStrList[i]);
      for x := 0 to Length(CandleArr) - 1 do
      begin
        if CandleArr[x,0] = TempData.ID then
        begin
          CandleArr[x,1] := TempData.Name;
        end;
      end;
    end;
//    showmessage(TempID.ID);
//    showmessage(TempID.Name);
  finally
    FreeAndNil(TempStrList);
  end;

end;

procedure TStakeConfiguration.LoadDefaultCandleNames;
begin
  CandleArr[0,0] := '00';
  CandleArr[0,1] := 'Small Heart/Money Bag ($100)/Morning Star';
  CandleArr[1,0] := '01';
  CandleArr[1,1] := 'Money Bag ($100)';
  CandleArr[2,0] := '03';
  CandleArr[2,1] := 'Morning Star';
  CandleArr[3,0] := '04';
  CandleArr[3,1] := 'Big Heart';
  CandleArr[4,0] := '05';
  CandleArr[4,1] := 'Pork Chop';
  CandleArr[5,0] := '06';
  CandleArr[5,1] := 'Magic Crystal';
  CandleArr[6,0] := '08';
  CandleArr[6,1] := 'Dagger';
  CandleArr[7,0] := '09';
  CandleArr[7,1] := 'Boomerang';
  CandleArr[8,0] := '0A';
  CandleArr[8,1] := 'Cross';
  CandleArr[9,0] := '0B';
  CandleArr[9,1] := 'Fire Bomb';
  CandleArr[10,0] := '0C';
  CandleArr[10,1] := 'Double Shot/Triple Shot';
  CandleArr[11,0] := '0D';
  CandleArr[11,1] := 'Axe';
  CandleArr[12,0] := '0E';
  CandleArr[12,1] := 'Invisibility Potion';
  CandleArr[13,0] := '0F';
  CandleArr[13,1] := 'Clock';
  CandleArr[14,0] := '11';
  CandleArr[14,1] := 'Money Bag ($400)';
  CandleArr[15,0] := '21';
  CandleArr[15,1] := 'Money Bag ($700)';
end;

procedure TStakeConfiguration.LoadDefaultEnemyNames;
begin
  EnemyArr[0,0] := '01';
  EnemyArr[0,1] := 'Zombie';
  EnemyArr[1,0] := '02';
  EnemyArr[1,1] := 'Vampire Bat';
  EnemyArr[2,0] := '03';
  EnemyArr[2,1] := 'Fish Man';
  EnemyArr[3,0] := '04';
  EnemyArr[3,1] := 'Vampire Bat (2nd Quest)';
  EnemyArr[4,0] := '05';
  EnemyArr[4,1] := 'Medusa (2nd Quest)';
  EnemyArr[5,0] := '06';
  EnemyArr[5,1] := 'Medusa';
  EnemyArr[6,0] := '07';
  EnemyArr[6,1] := 'Vampire Bat';
  EnemyArr[7,0] := '0D';
  EnemyArr[7,1] := 'Ghost';
  EnemyArr[8,0] := '12';
  EnemyArr[8,1] := 'Eagle';
  EnemyArr[9,0] := '47';
  EnemyArr[9,1] := 'Hanging Bat';
  EnemyArr[10,0] := '48';
  EnemyArr[10,1] := 'Black Knight';
  EnemyArr[11,0] := '4A';
  EnemyArr[11,1] := 'Axe-Man';
  EnemyArr[12,0] := '4C';
  EnemyArr[12,1] := 'Hunchback';
  EnemyArr[13,0] := '4E';
  EnemyArr[13,1] := 'Dragon Skull Cannon';
  EnemyArr[14,0] := '4F';
  EnemyArr[14,1] := 'Raven';
  EnemyArr[15,0] := '50';
  EnemyArr[15,1] := 'White Skeleton';
  EnemyArr[16,0] := '51';
  EnemyArr[16,1] := 'Black Leopard';
  EnemyArr[17,0] := '53';
  EnemyArr[17,1] := 'Red Skeleton';
  EnemyArr[18,0] := '54';
  EnemyArr[18,1] := 'Skele-Dragon';
  EnemyArr[19,0] := '58';
  EnemyArr[19,1] := 'Grim Reaper';
  EnemyArr[20,0] := '59';
  EnemyArr[20,1] := 'Sleeping Phantom Bat';
  EnemyArr[21,0] := '5A';
  EnemyArr[21,1] := 'Mummy Man';
  EnemyArr[22,0] := '5B';
  EnemyArr[22,1] := 'Queen Medusa';
  EnemyArr[23,0] := '5C';
  EnemyArr[23,1] := 'Frankenstein';
  EnemyArr[24,0] := '5D';
  EnemyArr[24,1] := 'Dracula';
  EnemyArr[25,0] := '5E';
  EnemyArr[25,1] := 'Phantom Bat';
  EnemyArr[26,0] := '8D';
  EnemyArr[26,1] := 'Ghost';
  EnemyArr[27,0] := '00';
  EnemyArr[27,1] := 'Nothing';
end;

procedure TStakeConfiguration.LoadEnemyNames(pFilename: String);
var
  TempStrList : TStringList;
  TempData : TExplodeRes;
  i,x : Integer;
begin
  TempStrList := TStringList.Create;
  try
    TempStrList.LoadFromFile(pFilename);
    for i := 0 to TempStrList.Count -1 do
    begin
      TempData := self.ExplodeCanEne(TempStrList[i]);
      for x := 0 to Length(EnemyArr) - 1 do
      begin
        if EnemyArr[x,0] = TempData.ID then
        begin
          EnemyArr[x,1] := TempData.Name;
        end;
      end;
    end;
//    showmessage(TempID.ID);
//    showmessage(TempID.Name);
  finally
    FreeAndNil(TempStrList);
  end;
end;

function TStakeConfiguration.ExplodeCanEne(pString : String): TExplodeRes;
var
  count : Integer;
  Temp : TExplodeRes;
begin
  count := 1;
  while (pString[count] <> ':') do
  begin
    Temp.ID := Temp.ID + pString[count];
    inc(Count);
  end;
  inc(Count);
  Temp.Name := copy(pString,Count,Length(pString) - count +1);
  result := Temp;
//  showmessage(Temp.Name);
end;

procedure TStakeConfiguration.SetMapperWarnings(const Value: Byte);
begin
  _MapperWarnings := Value;
  _Changed := True;
end;

function TStakeConfiguration.GetNumberOfRecentlyOpenedFiles: Integer;
var
  i : Integer;
  count : Integer;
begin
  if Assigned(_RecentlyOpenedFiles) = True then
  begin
    count := 0;
    for i := 0 to _RecentlyOpenedFiles.Count - 1 do
    begin
      if _RecentlyOpenedFiles[i] <> '' then
        inc(Count);
    end;
    result := count;
  end
  else
    result := -1;
end;

function TStakeConfiguration.GetRecentFile(index: Integer): String;
begin
  result := _RecentlyOpenedFiles[index];
end;

procedure TStakeConfiguration.SetRecentFile(index: Integer;
  const Value: String);
begin
  _RecentlyOpenedFiles[index] := Value;
end;


destructor TStakeConfiguration.Destroy;
begin
  if Assigned(_RecentlyOpenedFiles) = true then
    FreeAndNil(_RecentlyOpenedFiles);

  inherited;
end;

procedure TStakeConfiguration.AddRecentFile(pNewFile: String);
var
  i,index : Integer;
  TempString : String;
begin
  index := _RecentlyOpenedFiles.IndexOf(pNewFile);
  if index = -1 then
  begin
    for i := 3 downto 0 do
    begin
      _RecentlyOpenedFiles[i+1] := _RecentlyOpenedFiles[i];
    end;
    _RecentlyOpenedFiles[0] := pNewFile;
  end
  else
  begin
    if index > 0 then
    begin
      TempString := _RecentlyOpenedFiles[index];
      for i := index downto 1  do
      begin
        _RecentlyOpenedFiles[i] := _RecentlyOpenedFiles[i - 1];
      end;
      _RecentlyOpenedFiles[0] := TempString;
    end;
  end;
  _Changed := True;
end;

procedure TStakeConfiguration.SetLastPaletteCastleIntro(const Value: Byte);
begin
  _LastPaletteCastleIntro := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetLastPaletteEnding(const Value: Byte);
begin
  _LastPaletteEnding := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetAutoCheck(const Value: Boolean);
begin
  _AutoCheck := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetOriginalROMFile(const Value : String);
begin
  _OriginalROMFile := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetIPSOutput(const Value : String);
begin
  _IPSOutput := Value;
  _Changed := True;
end;

procedure TStakeConfiguration.SetLeftTextColour(pLeftTextColour : TColor32);
begin
  _LeftTextColour := pLeftTextColour;
  _Changed := True;
end;

procedure TStakeConfiguration.SetMiddleTextColour(pMiddleTextColour : TColor32);
begin
  _MidTextColour := pMiddleTextColour;
  _Changed := True;
end;

procedure TStakeConfiguration.SetGridlineColour(pGridlineColour : TColor32);
begin
  _GridlineColour := pGridlineColour;
  _Changed := True;
end;


end.
