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

unit fStake;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32,GR32_Layers,GR32_Image, ImgList,
  ActnList, ShellAPI, FileCtrl,
  Menus, ComCtrls, ToolWin, Buttons, AbBase, AbBrowse,
  AbZBrows, AbZipper, uEnemyType, MemINIHexFile, iNESImage,
  XPMan, JvComponent, JvDragDrop, JvComponentBase;

type
  TfrmStake = class(TForm)
    ImageList: TImageList;
    Bitmap32List: TBitmap32List;
    imgLevel: TImage32;
    imgCurTile: TImage32;
    TileScrollBar: TScrollBar;
    ActionList: TActionList;
    actOpenROM: TAction;
    actCreatePaletteEditor: TAction;
    actCreateTSAEditor: TAction;
    actCreateAbout: TAction;
    actSaveROM: TAction;
    actCloseROM: TAction;
    actCreatePreferences: TAction;
    actCreateJumpTo: TAction;
    actCreateROMProperties: TAction;
    actCreateEnemyEditor: TAction;
    Toolbar: TToolBar;
    tlbOpenROM: TToolButton;
    tlbSaveROM: TToolButton;
    tlbCloseROM: TToolButton;
    ToolButton4: TToolButton;
    tlbJumpTo: TToolButton;
    tlbSep1: TToolButton;
    tlbTSAEditor: TToolButton;
    tlbPaletteEditor: TToolButton;
    tlbROMProperties: TToolButton;
    tlbSep2: TToolButton;
    tlbEnableGridlines: TToolButton;
    tlbSep3: TToolButton;
    tlbMapEditingMode: TToolButton;
    tlbObjectEditingMode: TToolButton;
    mnuFile: TMenuItem;
    mnuOpenROM: TMenuItem;
    mnuSaveROM: TMenuItem;
    mnuCloseROM: TMenuItem;
    N1: TMenuItem;
    mnuOptions: TMenuItem;
    mnuExit: TMenuItem;
    mnuEdit: TMenuItem;
    mnuMapEditingMode: TMenuItem;
    mnuObjectEditingMode: TMenuItem;
    mnuTools: TMenuItem;
    mnuPaletteEditor: TMenuItem;
    mnuTSAEditor: TMenuItem;
    mnuROMProperties: TMenuItem;
    mnuEnemyEditor: TMenuItem;
    mnuHelp: TMenuItem;
    mnuAbout: TMenuItem;
    cmdLeft: TBitBtn;
    cmdUp: TBitBtn;
    cmdDown: TBitBtn;
    StatusBar: TStatusBar;
    cmdRight: TBitBtn;
    tlbAddStair: TToolButton;
    actAddStair: TAction;
    lblScreenID: TLabel;
    MainMenu: TMainMenu;
    tlbSoundEffectToggler: TToolButton;
    actCreateSoundEffectToggler: TAction;
    tlbMusicPointerEditor: TToolButton;
    actCreateMusicPointerEditor: TAction;
    mnuSoundEffectsToggler: TMenuItem;
    mnuMusicPointerEditor: TMenuItem;
    actSetObjectEditingMode: TAction;
    tlbSep4: TToolButton;
    N3: TMenuItem;
    mnuLaunchEMU: TMenuItem;
    mnuOpenLastROM: TMenuItem;
    actCreateTitleScreenEditor: TAction;
    mnuTitleScreenEditor: TMenuItem;
    actSetMapEditingMode: TAction;
    tlbShowBlackBar: TToolButton;
    actShowBlackBar: TAction;
    actCreateROMPatches: TAction;
    tlbCreateROMPatch: TToolButton;
    mnuROMPatches: TMenuItem;
    mnuViewBlackBar: TMenuItem;
    AbZipper: TAbZipper;
    actCreateDamage: TAction;
    mnuDamageEditor: TMenuItem;
    actEnableGridlines: TAction;
    actCreateStageProperties: TAction;
    mnuStageProperties: TMenuItem;
    actCreateMapSelector: TAction;
    mnuSelectMap: TMenuItem;
    actCreateGlobalEnemyDataEditor: TAction;
    mnuGlobalEnemyDataEditor: TMenuItem;
    actAddNewBreakableBlock: TAction;
    tlbAddNewBreakableBlock: TToolButton;
    tlbGlobalEnemyDataEditor: TToolButton;
    tlbStageProperties: TToolButton;
    tlbCharacterDamageEditor: TToolButton;
    tlbSelectMap: TToolButton;
    tlbEnemyEditingMode: TToolButton;
    actSetEnemyEditingMode: TAction;
    mnuEnemyEditingMode: TMenuItem;
    mnuJumpTo: TMenuItem;
    actCreateExportLevel: TAction;
    actCreateImportLevel: TAction;
    N5: TMenuItem;
    mnuImportLevel: TMenuItem;
    mnuExportLevel: TMenuItem;
    mnuView: TMenuItem;
    mnuViewStairs: TMenuItem;
    mnuViewEntrances: TMenuItem;
    mnuViewDoors: TMenuItem;
    mnuViewBreakableBlocks: TMenuItem;
    mnuViewSpikeCrushers: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    mnuAddNewStair: TMenuItem;
    mnuAddNewBreakableBlock: TMenuItem;
    actExit: TAction;
    mnuViewFloatingPlatforms: TMenuItem;
    mnuEndingEditor: TMenuItem;
    mnuCastleIntroductionEditor: TMenuItem;
    actCreateCastleIntroEditor: TAction;
    actCreateEndingEditor: TAction;
    mnuRecent: TMenuItem;
    mnuRecentItem1: TMenuItem;
    mnuRecentItem2: TMenuItem;
    mnuRecentItem3: TMenuItem;
    mnuRecentItem4: TMenuItem;
    mnuRecentItem5: TMenuItem;
    mnuTurnAllViewingOptionsOn: TMenuItem;
    mnuTurnAllViewingOptionsOff: TMenuItem;
    tlbTitleScreenEditor: TToolButton;
    PopupMenu: TPopupMenu;
    mnuTitleScreenEditorPop: TMenuItem;
    mnuCastleIntroEditorPop: TMenuItem;
    mnuEndingEditorPop: TMenuItem;
    mnuEnableGridlines: TMenuItem;
    actCreateFileProperties: TAction;
    mnuProperties: TMenuItem;
    mnuSaveAsIPSFile: TMenuItem;
    actSaveAsIPS: TAction;
    actKeyboardLayouts: TAction;
    mnuKeyboardLayouts: TMenuItem;
    txtTileJumpTo: TEdit;
    DropTarget: TJvDropTarget;
    procedure actOpenROMExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdRightClick(Sender: TObject);
    procedure cmdLeftClick(Sender: TObject);
    procedure cmdUpClick(Sender: TObject);
    procedure cmdDownClick(Sender: TObject);
    procedure TileScrollBarChange(Sender: TObject);
    procedure imgLevelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure TileScrollBarScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure imgCurTileMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure actSaveROMExecute(Sender: TObject);
    procedure actCreateTSAEditorExecute(Sender: TObject);
    procedure imgLevelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure actAddStairExecute(Sender: TObject);
    procedure actCreatePaletteEditorExecute(Sender: TObject);
    procedure actCreateROMPropertiesExecute(Sender: TObject);
    procedure actCreateAboutExecute(Sender: TObject);
    procedure actCreatePreferencesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCloseROMExecute(Sender: TObject);
    procedure actCreateSoundEffectTogglerExecute(Sender: TObject);
    procedure actCreateEnemyEditorExecute(Sender: TObject);
    procedure actCreateMusicPointerEditorExecute(Sender: TObject);
    procedure actSetObjectEditingModeExecute(Sender: TObject);
    procedure actSetMapEditingModeExecute(Sender: TObject);
    procedure mnuOpenLastROMClick(Sender: TObject);
    procedure mnuLaunchEMUClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure actCreateTitleScreenEditorExecute(Sender: TObject);
    procedure actCreateJumpToExecute(Sender: TObject);
    procedure actShowBlackBarExecute(Sender: TObject);
    procedure actCreateROMPatchesExecute(Sender: TObject);
    procedure actCreateDamageExecute(Sender: TObject);
    procedure actEnableGridlinesExecute(Sender: TObject);
    procedure actCreateStagePropertiesExecute(Sender: TObject);
    procedure actCreateMapSelectorExecute(Sender: TObject);
    procedure actCreateGlobalEnemyDataEditorExecute(Sender: TObject);
    procedure actAddNewBreakableBlockExecute(Sender: TObject);
    procedure actSetEnemyEditingModeExecute(Sender: TObject);
    procedure actCreateExportLevelExecute(Sender: TObject);
    procedure actCreateImportLevelExecute(Sender: TObject);
    procedure mnuViewStairsClick(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actCreateCastleIntroEditorExecute(Sender: TObject);
    procedure mnuRecentItem1Click(Sender: TObject);
    procedure actCreateEndingEditorExecute(Sender: TObject);
    procedure mnuTurnAllViewingOptionsOnClick(Sender: TObject);
    procedure mnuTurnAllViewingOptionsOffClick(Sender: TObject);
    procedure actCreateFilePropertiesExecute(Sender: TObject);
    procedure actSaveAsIPSExecute(Sender: TObject);
    procedure actKeyboardLayoutsExecute(Sender: TObject);
    procedure txtTileJumpToKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DropTargetDragDrop(Sender: TJvDropTarget;
      var Effect: TJvDropEffect; Shift: TShiftState; X, Y: Integer);
  private
    TSA, EnemyFilter : TForm;
    EditingMode : Byte;
    CurTileLeft, CurTileMid,CurTilePos : Byte;
    CurrentObject,CurrentObjType : Integer;
    XPos,YPos : Integer;
    procedure SetVisibleStatus(pVisible : Boolean);
    procedure SetButtonsEnable;
    procedure DrawTileSelector;
    procedure SetScreenIDLabel;
    procedure LoadROM(pFilename,pDataFile: String;pAutoCheck : Boolean);
    procedure ExecuteEmulator;
    procedure SetIconTransparency;
    procedure BackupFile;
    procedure SetEmuMenuText;
    procedure CreateRecentMenu;
    function AutoCheckROMType(pFilename : String): String;
    procedure ClearMenuIcons();
    function CloseROM: boolean;


    { Private declarations }
  public
    CurTSABlock : Integer;
    procedure RedrawScreen;
    procedure DrawLevelData();
    procedure SetMapEditingModeOn;
    procedure UpdateTitleCaption;    
    { Public declarations }
  end;

var
  frmStake: TfrmStake;

const
  // Constants for the various editing modes.
  MAPEDITINGMODE : Byte = 0;
  OBJEDITINGMODE : Byte = 1;
  ENEMYEDITINGMODE : Byte = 2;
  // Constants for the object types.
  NONETYPE : Byte = 0;
  STAIRTYPE : Byte = 1;
  DOORTYPE : Byte =2;
  ENTRANCETYPE : Byte = 3;
  BREAKABLEBLOCKTYPE : Byte = 4;
  SPIKECRUSHERTYPE : Byte = 5;
  FLOATINGPLATFORMTYPE : Byte = 6;
  NONSTANDARDDOORTYPE : Byte = 7;
  // A constant used in the setting of object X/Y properties.
  NOTSET : Integer = -1;

implementation

uses fOpenDialog, fTSA, fTileEditor, fPalette, fJumpTo, fBreakableBlockScrChan,
  fScreenChanger, fROMProperties, fAbout,
  fPreferences, fSoundEffects,fStageProperties,
  fMusicPointers,fEnemyEd, fTitleScreenEditor, fPatch,
  fDamageSettings, fSelectMap,fFloatingPlatProp
  , fGlobalEnemyDataEditor, fEnemyFilter, fExportLevel,
  fImportLevel,fSpikeCrusherScrChan,
  fCastleIntro, fNonDoors, fending,fFileProperties,
  ulunarcompress, cCVROM, cconfig, uglobal, fKeyboardLayouts;

{$R *.dfm}

procedure TfrmStake.actOpenROMExecute(Sender: TObject);
var
  OpDlg : TfrmOpenDialog;
  Filename,DataFile : String;
  AutoCheck : Boolean;
begin
  OpDlg := TfrmOpenDialog.Create(self);
  try
    if (StakeOptions.LastROMLoaded = '') or (DirectoryExists(ExtractFileDir(StakeOptions.LastROMLoaded)) = false) then
      OpDlg.OpenDir := ExtractFileDir(Application.ExeName)
    else
      OpDlg.OpenDir := ExtractFileDir(StakeOptions.LastROMLoaded);

    // Disable the drag and drop from Windows Explorer onto the
    // main form.
    DropTarget.AcceptDrag := False;
    OpDlg.ShowModal;
    DropTarget.AcceptDrag := True;


    if OpDlg.ModalResult = mrOK then
    begin
      Filename := OpDlg.Filename;
      DataFile := OpDlg.DataFile;
      AutoCheck := OpDlg.AutoCheck;
    end
    else
      exit;
  finally
    FreeAndNil(OpDlg);
  end;
  LoadROM(Filename, DataFile,AutoCheck);
end;

procedure TfrmStake.LoadROM(pFilename,pDataFile : String;pAutoCheck : Boolean);
var
  TempFilename : String;
begin
  if FileExists(pFilename) then
  begin
    // If the ROM is already loaded, free its objects.
    if Assigned(CVROM) then
    begin
      FreeAndNil(CVROM);
    end;

    TempFilename := pDataFile;
    if pAutoCheck = True then
    begin
      TempFilename := AutoCheckROMType(pFilename);
      if TempFilename = '' then
      begin
        TempFilename := pDataFile;
      end
      else
      begin
        TempFilename := ExtractFileDir(Application.ExeName) + '\Data\' + TempFilename;
      end;
    end;


    // Create a new CVROM object.
    CVROM := TCVROM.Create(pFilename,TempFilename);
    // Mapper, PRG and CHR check
    // Requires changing.
    if (CVROM.IsCVROM = False) then
    begin
      if StakeOptions.MapperWarnings = 0 then
      begin
        Messagebox(handle,'This is not a Castlevania ROM.',PChar(Application.Title),0);
        FreeAndNil(CVROM);
        exit;
      end
      else if StakeOptions.MapperWarnings = 1 then
      begin
        if MessageBox(Handle,'The memory mapper of this ROM does not match the specifications of'
          + chr (13) + chr(10) + 'the Castlevania ROMs. Do you wish to continue?',
            PChar(Application),MB_YESNO) = IDNO	then
        begin
          FreeAndNil(CVROM);
          exit;
        end;
      end;

    end;
    
    StatusBar.Panels[1].Text := ExtractFileName(TempFilename);
    StakeOptions.LastROMLoaded := pFilename;
    StakeOptions.AddRecentFile(pFilename);
    CreateRecentMenu();

    // If the palette file exists, load in the palette.
    // If it doesn't exist, then load in the default palette.
    if FileExists(StakeOptions.FullPaletteName) then
      CVROM.LoadPaletteFile(StakeOptions.FullPaletteName)
    else
      CVROM.LoadDefaultPalette;
    if CVROM.DisableTitleScreen = False then
      if CVROM.IntroExpansion.IsIntroExpanded = False then
        CVROM.IntroExpansion.ExpandIntro;
    // Set the enabled and visible states of the controls
    // to true.
    SetVisibleStatus(True);
    // Load the default enemy/candle names.
    StakeOptions.LoadDefaultEnemyNames;
    StakeOptions.LoadDefaultCandleNames;
    // If the user has created an enemy name renaming file
    // then load the new enemy names into memory.
    if FileExists(ChangeFileExt(pFilename,'.ene')) = True then
      StakeOptions.LoadEnemyNames(ChangeFileExt(pFilename,'.ene'));
    // If the user has created an candle name renaming file
    // then load the new candle names into memory.
    if FileExists(ChangeFileExt(pFilename,'.can')) = True then
      StakeOptions.LoadCandleNames(ChangeFileExt(pFilename,'.can'));
    // If the datafile does not support editing of the title
    // screen, then disable the title screen editor.
    if CVROM.DisableTitleScreen = True then
      actCreateTitleScreenEditor.Enabled := False;
    // Change the caption of the window to display the application's
    // name and the currently loaded filename, sans drive/directory info.
    UpdateTitleCaption;
    // Call the Map Editing Mode action handler, to set the editor
    // into map editing mode correctly.
    actSetMapEditingMode.Execute;
    actShowBlackBar.Checked := StakeOptions.BlackBar;
    tlbShowBlackBar.Down := StakeOptions.BlackBar;
    // Set the gridlines action's checked property
    // to whether the gridlines are actually on.
    actEnableGridlines.Checked := StakeOptions.GridlinesOn;
    // Reset the level.
    CVROM.Level := 0;
    XPos := CVROM.LevelStartX;
    YPos := CVROM.LevelStartY;
    // If the icon transparency mode is enabled, then
    // set all bitmaps to the transparent draw mode.
    // If not, set them to solid draw mode.
    SetIconTransparency();
    // Draw the level data. :P
    DrawLevelData();
    // Set the navigation buttons enabled state depending
    // on the screens around the current screen.
    SetButtonsEnable();
    // Display the current screen in the label below the level.
    SetScreenIDLabel();
    // Draw the tiles in the tile selector.
    DrawTileSelector();
    // Reset the CurTSABlock variable.
    CurTSABlock := -1;
//    CVROM.ExportLevel('C:\test.spf',0);
//    TileScrollbar.Max := CVROM.NumberOfTiles - 5;
  end
  else
    showmessage('Please supply a valid filename.');
end;

procedure TfrmStake.DrawTileSelector();
var
  TileSelector : TBitmap32;
  tlFont : TFont;
  i : integer;
begin
  TileSelector := TBitmap32.Create;
  try
    TileSelector.Height := 192;
    TileSelector.Width := 32;
    CVROM.DrawTileSelector(TileScrollbar.Position,TileSelector);
    tlFont := TFont.Create;
    tlFont.Name := 'Tahoma';
    tlFont.Size := 7;

    tlFont.Color := wincolor(StakeOptions.LeftTextColour);
    TileSelector.Font := tlFont;

    for i := 1 to 5 do
      TileSelector.Line(0,i*32,32,i*32,clwhite32);

    if (CurTileLeft >= TileScrollbar.Position) and (CurTileLeft <= TileScrollbar.Position + 5) then
    begin
      if CurTileLeft = CurTileMid then
      begin
        TileSelector.Line(0,(CurTileLeft - TileScrollBar.Position)*32,0,(CurTileLeft-TileScrollBar.Position)* 32 + 32,StakeOptions.LeftTextColour);
        TileSelector.Line(0,(CurTileLeft - TileScrollBar.Position)*32,32,(CurTileLeft-TileScrollBar.Position)* 32,StakeOptions.LeftTextColour);
      end
      else
        TileSelector.FrameRectS(0,(CurTileLeft - TileScrollBar.Position)*32,32,(CurTileLeft-TileScrollBar.Position)* 32 + 32,StakeOptions.LeftTextColour);
      if StakeOptions.DispLeftMidText = true then
        TileSelector.Textout(1,(CurTileLeft - TileScrollBar.Position)*32,'Left');
    end;
    TileSelector.Font.Color := wincolor(StakeOptions.MiddleTextColour);
    if (CurTileMid >= TileScrollbar.Position) and (CurTileMid <= TileScrollbar.Position + 5) then
    begin
      if CurTileLeft = CurTileMid then
      begin
        TileSelector.Line(31,(CurTileMid - TileScrollBar.Position)*32,31,(CurTileMid-TileScrollBar.Position)* 32 + 32,StakeOptions.MiddleTextColour);
        TileSelector.Line(0,(CurTileMid - TileScrollBar.Position)*32+31,32,(CurTileMid-TileScrollBar.Position)* 32+31,StakeOptions.MiddleTextColour);
      end
      else
        TileSelector.FrameRectS(0,(CurTileMid - TileScrollBar.Position)*32,32,(CurTileMid-TileScrollBar.Position)* 32 + 32,StakeOptions.MiddleTextColour);
      if StakeOptions.DispLeftMidText = true then
        TileSelector.Textout(1,(CurTileMid - TileScrollBar.Position)*32+16,'Middle');
    end;

    imgCurTile.Bitmap := TileSelector;
  finally
    FreeAndNil(tlFont);
    FreeAndNil(TileSelector);
  end;
  TileScrollbar.Max := CVROM.NumberOfTiles - 5;
end;

procedure TfrmStake.SetVisibleStatus(pVisible: Boolean);
begin
  imgLevel.Visible := pVisible;
  cmdLeft.Visible := pVisible;
  cmdRight.Visible := pVisible;
  cmdUp.Visible := pVisible;
  cmdDown.Visible := pVisible;
  imgCurTile.Visible := pVisible;
  TileScrollBar.Visible := pVisible;
  actSaveROM.Enabled := pVisible;
  actCloseROM.Enabled := pVisible;
  actCreateJumpTo.Enabled := pVisible;
  actCreateTSAEditor.Enabled := pVisible;
  actCreatePaletteEditor.Enabled := pVisible;
  actCreateROMProperties.Enabled := pVisible;
  actCreateEnemyEditor.Enabled := pVisible;
  actEnableGridlines.Enabled := pVisible;
  actSetMapEditingMode.Enabled := pVisible;
  actSetObjectEditingMode.Enabled := pVisible;
  actAddStair.Enabled := pVisible;
  lblScreenID.Visible := pVisible;
  actCreateSoundEffectToggler.Enabled := pVisible;
  actCreateMusicPointerEditor.Enabled := pVisible;
  mnuLaunchEMU.Enabled := pVisible;
  actCreateTitleScreenEditor.Enabled := pVisible;
  actShowBlackBar.Enabled := pVisible;
  actCreateROMPatches.Enabled := pVisible;
  actCreateDamage.Enabled := pVisible;
  actCreateStageProperties.Enabled := pVisible;
  actCreateMapSelector.Enabled := pVisible;
  actCreateGlobalEnemyDataEditor.Enabled := pVisible;
  actAddNewBreakableBlock.Enabled := pVisible;
  actSetEnemyEditingMode.Enabled := pVisible;
  actCreateExportLevel.Enabled := pVisible;
  actCreateImportLevel.Enabled := pVisible;
  mnuViewSpikeCrushers.Enabled := pVisible;
  mnuViewBreakableBlocks.Enabled := pVisible;
  mnuViewStairs.Enabled := pVisible;
  mnuViewDoors.Enabled := pVisible;
  mnuViewEntrances.Enabled := pVisible;
  mnuViewFloatingPlatforms.Enabled := pVisible;
  actCreateCastleIntroEditor.Enabled := pVisible;
  actCreateEndingEditor.Enabled := pVisible;
  mnuTurnAllViewingOptionsOn.Enabled := pVisible;
  mnuTurnAllViewingOptionsOff.Enabled := pVisible;
  actCreateFileProperties.Enabled := pVisible;
  actSaveAsIPS.Enabled := pVisible;
  txtTileJumpTo.Visible := pVisible;
end;

procedure TfrmStake.FormShow(Sender: TObject);
begin
  UpdateTitleCaption;
  CurTSABlock := -1;
  CurrentObject := -1;
  SetVisibleStatus(False);
  SetEmuMenuText;
end;

procedure TfrmStake.SetEmuMenuText();
begin
  if (StakeOptions.EmulatorPath <> '') and (FileExists(StakeOptions.EmulatorPath) = True) then
  begin
    mnuLaunchEMU.Caption := 'Launch ' + ExtractFileName(StakeOptions.EmulatorPath);
  end
  else
  begin
    mnuLaunchEMU.Caption := 'No Emulator Associated';
  end;
end;

procedure TfrmStake.DrawLevelData();
var
  LevelBMP : TBitmap32;
  i : Integer;
  DrawOpt : Byte;
begin
  LevelBMP := TBitmap32.Create;
  try
    LevelBMP.Height := 192;
    LevelBMP.Width := 256;
    // Initialise the DrawOpt variable as Delphi may end up
    // complaining.
    DrawOpt := 0;
    if EditingMode = ENEMYEDITINGMODE then
    begin
      // In enemy editing mode, we do not draw stairs,
      // doors, entrances, etc, so we only need to
      // check if the black bar is toggled on.
      if StakeOptions.BlackBar = true then
        DrawOpt := DrawOpt + 128;

      CVROM.DrawCurrentScreen(LevelBMP,Bitmap32List,DrawOpt);

      if (TfrmEnemyFilter(EnemyFilter).EnemyType = etCandle) or (TfrmEnemyFilter(EnemyFilter).EnemyType = etCandleNoXEditing) then
        cvrom.Drawcandles(  LevelBMP,TfrmEnemyFilter(EnemyFilter).ItemDropped,TfrmEnemyFilter(EnemyFilter).Index)
      else if (TfrmEnemyFilter(EnemyFilter).EnemyType = etCandleStand) then
        cvrom.Drawcandlestand(  LevelBMP,TfrmEnemyFilter(EnemyFilter).ItemDropped,TfrmEnemyFilter(EnemyFilter).Index)
      else if (TfrmEnemyFilter(EnemyFilter).EnemyType = etEnemy) then
        cvrom.Drawenemies(  LevelBMP,TfrmEnemyFilter(EnemyFilter).ItemDropped,TfrmEnemyFilter(EnemyFilter).Index);
    end
    else
    begin
      if mnuViewStairs.Checked = True then
        DrawOpt := DrawOpt + 1;
      if mnuViewEntrances.Checked = True then
        DrawOpt := DrawOpt + 2;
      if mnuViewDoors.Checked = True then
        DrawOpt := DrawOpt + 4;
      if mnuViewFloatingPlatforms.Checked = True then
        DrawOpt := DrawOpt + 8;
      if mnuViewBreakableBlocks.Checked = True then
        DrawOpt := DrawOpt + 16;
      if mnuViewSpikeCrushers.Checked = True then
        DrawOpt := DrawOpt + 32;
      if StakeOptions.BlackBar = true then
        DrawOpt := DrawOpt + 128;

      CVROM.DrawCurrentScreen(LevelBMP,Bitmap32List,DrawOpt);
    end;
    // If the user has selected to draw gridlines on-screen,
    // draw them.
    if StakeOptions.GridlinesOn = True then
    begin
      for i := 1 to 7 do
        LevelBMP.Line(i*32,0,i*32,LevelBMP.Height,StakeOptions.GridlineColour);
      for i := 1 to 5 do
        LevelBMP.Line(0,i*32,LevelBMP.Width,i*32,StakeOptions.GridlineColour);
    end;
    // Set the bitmap of the image32 control to
    // the bitmap that was being drawn to in this function.
    imgLevel.Bitmap := LevelBMP;
  finally
    // Free the memory that the bitmap is using.
    FreeAndNil(LevelBMP);
  end;
end;

procedure TfrmStake.SetButtonsEnable();
begin
  cmdLeft.Enabled := True;
  cmdRight.Enabled := True;
  cmdUp.Enabled := True;
  cmdDown.Enabled := True;

  if XPos = 0 then cmdLeft.Enabled := False;
  If YPos = 0 then cmdUp.Enabled := False;
  If XPos = CVROM.MapWidth -1 then cmdRight.Enabled := False;
  If YPos = CVROM.MapHeight -1 then cmdDown.Enabled := False;

  // Now we check if the data around the current screen is set.
  if YPos + 1 <= CVROM.MapHeight - 1 then
    if CVROM.Map[XPos,Ypos+1] = $FF then cmdDown.Enabled := false;

  if YPos -1 >= 0 then
    if CVROM.Map[XPos,Ypos-1] = $FF then cmdUp.Enabled := false;

  if XPos + 1 <= CVROM.MapWidth - 1 then
    if CVROM.Map[XPos+1,Ypos] = $FF then cmdRight.Enabled := false;

  if XPos - 1 >= 0 then
    if CVROM.Map[XPos-1,Ypos] = $FF then cmdLeft.Enabled := false;

end;

procedure TfrmStake.cmdRightClick(Sender: TObject);
begin
  If CVROM.MapWidth - 1 > XPos then
  begin
    inc(XPos);
    CVROM.ScreenID := CVROM.Map[XPos,YPos];
    DrawLevelData();
    SetButtonsEnable();
    SetScreenIDLabel();
    UpdateTitleCaption;
  end;
end;

procedure TfrmStake.cmdLeftClick(Sender: TObject);
begin
  If XPos > 0 then
  begin
    dec(XPos);
    CVROM.ScreenID := CVROM.Map[XPos,YPos];
    DrawLevelData();
    SetButtonsEnable();
    SetScreenIDLabel();
    UpdateTitleCaption;
  end;
end;

procedure TfrmStake.cmdUpClick(Sender: TObject);
begin
  If YPos > 0 then
  begin
    dec(YPos);
    CVROM.ScreenID := CVROM.Map[XPos,YPos];
    DrawLevelData();
    SetButtonsEnable();
    SetScreenIDLabel();
    UpdateTitleCaption;
  end;
end;

procedure TfrmStake.cmdDownClick(Sender: TObject);
begin
  If CVROM.MapHeight - 1 > YPos then
  begin
    inc(YPos);
    CVROM.ScreenID := CVROM.Map[XPos,YPos];
    DrawLevelData();
    SetButtonsEnable();
    SetScreenIDLabel();
    UpdateTitleCaption;
  end;
end;

procedure TfrmStake.TileScrollBarChange(Sender: TObject);
begin
  DrawTileSelector();
end;

procedure TfrmStake.imgLevelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if imgLevel.Visible = true then
  begin
    if EditingMode = OBJEDITINGMODE then
    begin
      CurrentObject := -1;
      CurrentObjType := -1;
    end;
  end;
  UpdateTitleCaption;
end;

procedure TfrmStake.TileScrollBarScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  DrawTileSelector();
end;

procedure TfrmStake.imgCurTileMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if CurTSABlock = -1 then
  begin
    if (Button = mbMiddle) or ((ssShift in Shift) and (Button = mbLeft)) then
      CurTileMid := TileScrollBar.Position + (Y div 64)
    else if Button = mbLeft then
      CurTileLeft := TileScrollBar.Position + (Y div 64);

    DrawTileSelector();
  end
  else
  begin
    if Button = mbLeft then
    begin
      CVROM.EditTSA(TileScrollBar.Position + (Y div 64),(y mod 64) div 16,x div 16,CurTSABlock);

    end
    else if Button = mbRight then
    begin
      CVROM.IncrementBlockAttributes(TileScrollBar.Position + (Y div 64),(y mod 64) div 32, x div 32);
    end;
    DrawLevelData();
    DrawTileSelector();
  end;
  UpdateTitleCaption;
end;

procedure TfrmStake.actSaveROMExecute(Sender: TObject);
begin
  if StakeOptions.BackupFilesWhenSaving = True then
    BackupFile();
  if Assigned(CVROM) then
  begin
    if CVROM.Save = True then
      messagebox(Handle,'Changes saved.',PChar(APPLICATIONNAME),0)
    else
      messagebox(Handle,'Save failed. Another program probably has the ROM opened.',PChar(APPLICATIONNAME),0);
  end;
  UpdateTitleCaption;
end;

procedure TfrmStake.actCreateTSAEditorExecute(Sender: TObject);
begin
  if CurTSABlock = -1 then
    TSA := TfrmTSAEditor.Create(self);

  TSA.Show;

end;

procedure TfrmStake.imgLevelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
var
  i, total, count : Integer;
  tempx,tempy, EnemyLookup : Integer;
  StairScreenChanger : TfrmScreenChanger;
  BreakableBlockChanger : TfrmBreakableChanger;
  GlobalEnemy : TfrmGlobalEnemyDataEditor;
  SpikeCrusherChanger : TfrmSpikeCrusherScreenChanger;
  FloatPlatProp : TfrmFloatingPlatChange;
  NonDoorProp : TfrmNonDoorOpt;
begin

  if imgLevel.Visible = true then
  begin
    // If the editor is in Map Editing Mode..
    if EditingMode = MAPEDITINGMODE then
    begin
      if (Button = mbMiddle) or ((ssShift in Shift) and (Button = mbLeft)) then
      begin
        CVROM.ScreenData[x div 64, y div 64] := CurTileMid;
        DrawLevelData();
      end
      else if button = mbLeft then
      begin
        CVROM.ScreenData[x div 64, y div 64] :=CurTileLeft;
        DrawLevelData();
      end
      else if Button = mbRight then
      begin

        CurTilePos := CVROM.ScreenData[x div 64,y div 64];
        if ssShift in Shift then
          CurTileMid := CurTilePos
        else
          CurTileLeft := CurTilePos;
        if CurTilePos > TileScrollBar.Max then CurTilePos := TileScrollBar.Max;
        if (CurTilePos <= TileScrollBar.Position) or (CurTilePos >= TileScrollBar.Position + 5) then
          TileScrollBar.Position := CurTilePos;
        DrawTileSelector();
      end
    end
    else if EditingMode = OBJEDITINGMODE then
    begin
      CurrentObjType := NONETYPE;

      CurrentObject := CVROM.GetStairUnderMouse((X div 2),((y div 2)));
      if CurrentObject > -1 then
        CurrentObjType := STAIRTYPE;
      if CurrentObject = -1 then
      begin
        CurrentObject := CVROM.GetDoorUnderMouse((X div 2),(y div 2));
        if CurrentObject > -1 then
          CurrentObjType := DOORTYPE;
        if CurrentObject = -1 then
        begin
          CurrentObject := CVROM.GetEntranceUnderMouse((X div 2),(y div 2));
          if CurrentObject > -1 then
            CurrentObjType := ENTRANCETYPE;
          if CurrentObject = -1 then
          begin
            CurrentObject := CVROM.GetBreakableBlockUnderMouse(x div 2, y div 2);
            if CurrentObject >-1 then
              CurrentObjType := BREAKABLEBLOCKTYPE;
            if CurrentObject = -1 then
            begin
              CurrentObject := CVROM.GetSpikeCrusherUnderMouse(x div 2, y div 2);
              if CurrentObject > -1 then
                CurrentObjType := SPIKECRUSHERTYPE;
              if CurrentObject = -1 then
              begin
                CurrentObject := CVROM.GetFloatingPlatformUnderMouse(x div 2, y div 2);
                if CurrentObject > -1 then
                  CurrentObjType := FLOATINGPLATFORMTYPE;
                if CurrentObject = -1 then
                begin
                  CurrentObject := CVROM.GetNonDoorUnderMouse(x div 2, y div 2);
                  if CurrentObject > -1 then
                    CurrentObjType := NONSTANDARDDOORTYPE;
                end;
              end;
            end;
          end;
        end;
      end;
    end
    else if editingmode = ENEMYEDITINGMODE then
    begin
      // first, we need to figure out whether there is
      // an enemy in the quadrant.
      if (TfrmEnemyFilter(EnemyFilter).EnemyType = etCandle) or (TfrmEnemyFilter(EnemyFilter).EnemyType = etCandleNoXEditing) then
      begin
        if CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1] <> 0 then
        begin
          if (CVROM.Enemies[CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1]].EnemyType = etCandle) or  (CVROM.Enemies[CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1]].EnemyType = etCandleNoXEditing) then
          begin
            if button = mbLeft then
              CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1] := 0
            else
            begin
              GlobalEnemy := TfrmGlobalEnemyDataEditor.Create(Self);
              try
                GlobalEnemy.ID := CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1];
                DropTarget.AcceptDrag := False;
                if GlobalEnemy.ShowModal = mrOk then
                begin
                  if EditingMode = ENEMYEDITINGMODE then
                    DrawLevelData();
                end;
                DropTarget.AcceptDrag := True;

              finally
                FreeAndNil(GlobalEnemy);
              end;
            end;
          end;
        end
        else
        begin
          total := TfrmEnemyFilter(EnemyFilter).Index * 16;
          count := 0;
          tempx := ((x mod 128) div 2) + $8;
          tempy := (y div 2) + $20;
          enemylookup := TfrmEnemyFilter(EnemyFilter).ItemDropped;
          // Loop through all the enemies
          // trying to find an enemy of the current type then
          for i := 0 to CVROM.Enemies.count - 1 do
          begin
            if ((CVROM.Enemies[i].EnemyType = etCandle) or (CVROM.Enemies[i].EnemyType = etCandleNoXEditing))  and (CVROM.Enemies[i].EnemyItem = enemylookup) then
            begin

              if count >= total - 16 then
              begin
                if (CVROM.Enemies[i].Y > $D8) then
                begin
                  // edit me
                  if ((tempx >= CVROM.Enemies[i].X) and (tempx <= CVROM.Enemies[i].X + 16)) and ((tempY >= $D0) and (tempy <= $D0 + 8)) then
                  begin
                    CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))+1] := i;
                  end;
                end
                else
                begin
                  if ((tempx >= CVROM.Enemies[i].X) and (tempx <= CVROM.Enemies[i].X + 16)) and ((tempY >= CVROM.Enemies[i].Y) and (tempy <= CVROM.Enemies[i].Y + 8)) then
                  begin
                    CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))+1] := i;
                  end;
                end;
              end;
              if count = total then break;
              inc(count);
            end;
          end;
        end;
        DrawLevelData();
      end
      else if (TfrmEnemyFilter(EnemyFilter).EnemyType = etCandlestand) then
      begin
        if CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1] <> 0 then
        begin
          if CVROM.Enemies[CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1]].EnemyType = etCandlestand then
          begin
            if button = mbLeft then
              CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1] := 0
            else
            begin
              GlobalEnemy := TfrmGlobalEnemyDataEditor.Create(Self);
              try
                GlobalEnemy.ID := CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1];
                DropTarget.AcceptDrag := False;
                if GlobalEnemy.ShowModal = mrOk then
                begin
                  if EditingMode = ENEMYEDITINGMODE then
                    DrawLevelData();
                end;
                DropTarget.AcceptDrag := True;

              finally
                FreeAndNil(GlobalEnemy);
              end;
            end;
          end;
        end
        else
        begin
          total := TfrmEnemyFilter(EnemyFilter).Index * 16;
          count := 0;
          tempx := ((x mod 128) div 2) + $8;
          tempy := (y div 2) + $20;
          enemylookup := TfrmEnemyFilter(EnemyFilter).ItemDropped;
          // Loop through all the enemies
          // trying to find an enemy of the current type then
{          for i := 0 to CVROM.Enemies.count - 1 do
          begin
            if (CVROM.Enemies[i].EnemyType = etCandlestand) and (CVROM.Enemies[i].EnemyItem = enemylookup)  and ((tempx >= CVROM.Enemies[i].X) and (tempx <= CVROM.Enemies[i].X + 16)) and ((tempY >= CVROM.Enemies[i].Y) and (tempy <= CVROM.Enemies[i].Y + 8)) then
            begin
              CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))+1] := i;
              break;
//              showmessage('hello ' + IntToStr(i));
//              break;
            end;
          end;}
          for i := 0 to CVROM.Enemies.count - 1 do
          begin
            if ((CVROM.Enemies[i].EnemyType = etCandleStand))  and (CVROM.Enemies[i].EnemyItem = enemylookup) then
            begin
              if count >= total - 16 then
              begin
                if (CVROM.Enemies[i].Y > $D8) then
                begin
                  // edit me
                  if ((tempx >= CVROM.Enemies[i].X) and (tempx <= CVROM.Enemies[i].X + 16)) and ((tempY >= $D0) and (tempy <= $D0 + 8)) then
                  begin
                  CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))+1] := i;
                  end;
                end
                else
                begin
                  if ((tempx >= CVROM.Enemies[i].X) and (tempx <= CVROM.Enemies[i].X + 16)) and ((tempY >= CVROM.Enemies[i].Y) and (tempy <= CVROM.Enemies[i].Y + 8)) then
                  begin
                    CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))+1] := i;
                  end;
                end;
              end;
              if count = total then break;
              inc(count);
            end;
          end;
        end;
        DrawLevelData();
      end
      else if (TfrmEnemyFilter(EnemyFilter).EnemyType = etEnemy) then
      begin
        if CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) ] <> 0 then
        begin
          if CVROM.Enemies[CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))]].EnemyType = etEnemy then
          begin
            if button = mbLeft then
              CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) ] := 0
            else
            begin
              GlobalEnemy := TfrmGlobalEnemyDataEditor.Create(Self);
              try
                GlobalEnemy.ID := CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) ];
                DropTarget.AcceptDrag := False;
                if GlobalEnemy.ShowModal = mrOk then
                begin
                  if EditingMode = ENEMYEDITINGMODE then
                    DrawLevelData();
                end;
                DropTarget.AcceptDrag := True;

              finally
                FreeAndNil(GlobalEnemy);
              end;

            end;
          end;

        end
        else
        begin
          total := TfrmEnemyFilter(EnemyFilter).Index * 16;
          count := 0;
          tempx := ((x mod 128) div 2) + $8;
          tempy := (y div 2) + $20;
          enemylookup := TfrmEnemyFilter(EnemyFilter).ItemDropped;
          // Loop through all the enemies
          // trying to find an enemy of the current type then
{          for i := 0 to CVROM.Enemies.count - 1 do
          begin
            if (CVROM.Enemies[i].EnemyType = etEnemy) and (CVROM.Enemies[i].EnemyItem = enemylookup)  and ((tempx >= CVROM.Enemies[i].X) and (tempx <= CVROM.Enemies[i].X + 16)) and ((tempY >= CVROM.Enemies[i].Y) and (tempy <= CVROM.Enemies[i].Y + 8)) then
            begin
              CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))] := i;
              break;
//              showmessage('hello ' + IntToStr(i));
//              break;
            end;
          end;}
          for i := 0 to CVROM.Enemies.count - 1 do
          begin
            if ((CVROM.Enemies[i].EnemyType = etEnemy))  and (CVROM.Enemies[i].EnemyItem = enemylookup) then
            begin
              if count >= total - 16 then
              begin
                if (CVROM.Enemies[i].Y > $D8) then
                begin
                  // edit me
                  if ((tempx >= CVROM.Enemies[i].X) and (tempx <= CVROM.Enemies[i].X + 16)) and ((tempY >= $D0) and (tempy <= $D0 + 8)) then
                  begin
                    CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))] := i;
                  end;
                end
                else
                begin
                  if ((tempx >= CVROM.Enemies[i].X) and (tempx <= CVROM.Enemies[i].X + 16)) and ((tempY >= CVROM.Enemies[i].Y) and (tempy <= CVROM.Enemies[i].Y + 8)) then
                  begin
                    CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))] := i;
                  end;
                end;
              end;
              if count = total then break;
              inc(count);
            end;
          end;
        end;
        DrawLevelData();
      end;
    end;
  end;

  // If there is an object there, then figure out whether
  // the right mouse button has been clicked on it.
  // If it has do the appropriate stuff.
  if CurrentObjType > NONETYPE then
  begin
    if CurrentObjType = STAIRTYPE then
    begin
      if Button = mbRight then
      begin
        if CurrentObject > -1 then
        begin
          if ssCtrl in Shift then
          begin
            CVROM.DeleteStair(CurrentObject);
            CurrentObject := -1;
          end
          else if ssShift in Shift then
          begin
            StairScreenChanger := TfrmScreenChanger.Create(self);
            try
              StairScreenChanger.StairID := CurrentObject;
              DropTarget.AcceptDrag := False;
              StairScreenChanger.ShowModal;
              DropTarget.AcceptDrag := True;
            finally
              FreeAndNil(StairScreenChanger);
            end;
          end
          else
          begin
            CVROM.IncrementStairDirection(CurrentObject);
          end;
          DrawLevelData();
          CurrentObject := -1;
        end;
      end;
    end
    else if CurrentObjType = BREAKABLEBLOCKTYPE then
    begin
      if Button = mbRight then
      begin
        if CurrentObject > -1 then
        begin
          if ssCtrl in Shift then
          begin
            CVROM.DeleteBreakableBlock(CurrentObject);
            CurrentObject := -1;
          end
          else if ssShift in Shift then
          begin
            BreakableBlockChanger := TfrmBreakableChanger.Create(self);
            try
              BreakableBlockChanger.BlockID := CurrentObject;
              DropTarget.AcceptDrag := False;
              BreakableBlockChanger.ShowModal;
              DropTarget.AcceptDrag := True;

            finally
              FreeAndNil(BreakableBlockChanger);
            end;
          end
          else
          begin
            CVROM.IncrementBrBlockItem(CurrentObject);
          end;
          DrawLevelData();
          CurrentObject := -1;
        end;
      end;
    end
    else if CurrentObjType = SPIKECRUSHERTYPE then
    begin
      if (Button = mbRight) and (CurrentObject >-1) and (ssShift in Shift) then
      begin
        SpikeCrusherChanger := TfrmSpikeCrusherScreenChanger.Create(self);
        try
          SpikeCrusherChanger.BlockID := CurrentObject;
          DropTarget.AcceptDrag := False;
          SpikeCrusherChanger.ShowModal;
          DropTarget.AcceptDrag := True;

          finally
            FreeAndNil(SpikeCrusherChanger);
          end;

        DrawLevelData();
        CurrentObject := -1;
      end;
    end
    else if CurrentObjType = FLOATINGPLATFORMTYPE then
    begin
      if (Button = mbRight) and (ssShift in Shift) and (CurrentObject > -1) then
      begin
        FloatPlatProp := TfrmFloatingPlatChange.Create(self);
        try
          FloatPlatProp.FloatingPlatformID := CurrentObject;
          DropTarget.AcceptDrag := False;
          FloatPlatProp.ShowModal;
          DropTarget.AcceptDrag := True;
        finally
          FreeAndNil(FloatPlatProp);
        end;
        DrawLevelData();
        CurrentObject := -1;
      end;
    end
    else if CurrentObjType = NONSTANDARDDOORTYPE then
    begin
      if (Button = mbRight) and (ssShift in Shift) and (CurrentObject > -1) then
      begin
        NonDoorProp := TfrmNonDoorOpt.Create(self);
        try
          NonDoorProp.DoorID := CurrentObject;
          DropTarget.AcceptDrag := False;
          NonDoorProp.ShowModal;
          DropTarget.AcceptDrag := True;
        finally
          FreeAndNil(NonDoorProp);
        end;
        DrawLevelData();
        CurrentObject := -1;
      end;
    end;
  end;

{    else if EditingMode = STAIRSEDITINGMODE then
    begin

      CurrentObject := CVROM.GetStairUnderMouse((X div 2),(y div 2));

      if Button = mbRight then
      begin
        if CurrentObject > -1 then
        begin
          if ssCtrl in Shift then
          begin
            CVROM.DeleteStair(CurrentObject);
            CurrentObject := -1;
          end
          else if ssShift in Shift then
          begin
            StairScreenChanger := TfrmScreenChanger.Create(self);
            try
              StairScreenChanger.StairID := CurrentObject;
              StairScreenChanger.ShowModal;
            finally
              FreeAndNil(StairScreenChanger);
            end;
          end
          else
          begin
            CVROM.IncrementStairDirection(CurrentObject);
          end;
          DrawLevelData();
          CurrentObject := -1;
        end;

      end;

    end
    else if EditingMode = ENTRANCESEDITINGMODE then
    begin
      CurrentObject := CVROM.GetEntranceUnderMouse((X div 2),(y div 2));
    end
    else if EditingMode = DOORSEDITINGMODE then
    begin
      CurrentObject := CVROM.GetDoorUnderMouse((X div 2),(y div 2));
    end;
  end;}
end;

procedure TfrmStake.imgLevelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer; Layer: TCustomLayer);
var
  Draw : Boolean;
  TempX, TempY : Integer;
begin
  if EditingMode = MAPEDITINGMODE then
  begin
    if ssLeft in Shift then
    begin
      if ssShift in Shift then
      begin
        CVROM.ScreenData[x div 64, y div 64] := CurTileMid;
        DrawLevelData();
      end
      else
      begin
        CVROM.ScreenData[x div 64, y div 64] := CurTileLeft;
        DrawLevelData();
      end;
    end
    else if ssMiddle in Shift then
    begin
      CVROM.ScreenData[x div 64, y div 64] := CurTileMid;
      DrawLevelData();
    end;

//    imgLevel.Hint := '$' + IntToHex(CVROM.ScreenData[x div 64, y div 64],2);
  end
  else if EditingMode = OBJEDITINGMODE then
  begin
    if CurrentObjType = STAIRTYPE then
    begin
      if CurrentObject >-1 then
      begin
        if ssCtrl in Shift then
        begin
          TempX := X div 2;
          TempY := Y div 2;
        end
        else
        begin
          TempX := (((X div 2) div 8) *8);
          TempY := (((Y div 2) div 16) *16);
        end;

        if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;
        Draw := False;

        if CVROM.GetStairXY(CurrentObject,0) <> TempX then
        begin
          CVROM.SetStairsXY(CurrentObject,TempX,NOTSET);
          Draw := True;
        end;

        if CVROM.GetStairXY(CurrentObject,1) <> TempY then
        begin
          CVROM.SetStairsXY(CurrentObject,NOTSET,TempY);
          Draw := True;
        end;

        if Draw = true then DrawLevelData();

      end;
    end
    else if CurrentObjType = DOORTYPE then
    begin
      if CurrentObject >-1 then
      begin
        if ssCtrl in Shift then
        begin
          TempX := X div 2;
          TempY := Y div 2;
        end
        else
        begin
          TempX := (((X div 2) div 8) * 8);
          TempY := (((Y div 2) div 16) * 16);
        end;

        if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;
        Draw := False;
        if CVROM.GetDoorXY(0,CurrentObject) <> TempX then
        begin
          CVROM.SetDoorXY(CurrentObject,TempX, NOTSET);
          Draw := True;
        end;

        if CVROM.GetDoorXY(1,CurrentObject) <> TempY then
        begin
          CVROM.SetDoorXY(CurrentObject,NOTSET, TempY);
          Draw := True;
        end;

        if Draw = true then DrawLevelData();
      end;
    end
    else if CurrentObjType = ENTRANCETYPE then
    begin
      if CurrentObject > -1 then
      begin

        if ssCtrl in Shift then
        begin
          TempX := X div 2;
          TempY := Y div 2;
        end
        else
        begin
          TempX := (((X div 2) div 8) * 8);
          TempY := (((Y div 2) div 8) * 8);
        end;

        if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;
        Draw := False;
        if CVROM.GetEntranceXY(0,CurrentObject) <> TempX then
        begin
          CVROM.SetEntranceXY(TempX, NOTSET,CurrentObject);
          Draw := True;
        end;

        if CVROM.GetEntranceXY(1,CurrentObject) <> TempY then
        begin
          CVROM.SetEntranceXY(NOTSET, TempY,CurrentObject);
          Draw := True;
        end;

        if Draw = true then DrawLevelData();
      end;
    end
    else if CurrentObjType = BREAKABLEBLOCKTYPE then
    begin
      if CurrentObject > -1 then
      begin
        if ssCtrl in Shift then
        begin
          TempX := X div 2;
          TempY := Y div 2;
        end
        else
        begin
          TempX := (((X div 2) div 16) * 16);
          TempY := (((Y div 2) div 16) * 16);
        end;


        if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;
        Draw := False;
        if CVROM.GetBreakableBlockXY(CurrentObject,0) <> TempX then
        begin
          CVROM.SetBreakableBlockXY(CurrentObject,TempX,NOTSET);
          Draw := True;
        end;

        if CVROM.GetBreakableBlockXY(CurrentObject,1) <> TempY then
        begin
          CVROM.SetBreakableBlockXY(CurrentObject,NOTSET,TempY);
          Draw := True;
        end;

        if Draw = true then DrawLevelData();
      end;
    end
    else if CurrentObjType = SPIKECRUSHERTYPE then
    begin
      if CurrentObject > -1 then
      begin
        if ssCtrl in Shift then
        begin
          TempX := X div 2;
          TempY := Y div 2;
        end
        else
        begin
          TempX := (((X div 2) div 8) * 8);
          TempY := (((Y div 2) div 8) * 8);
        end;


        if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;
        Draw := False;
        if CVROM.GetSpikeCrusherXY(CurrentObject,0) <> TempX then
        begin
          CVROM.SetSpikeCrusherXY(CurrentObject,TempX,NOTSET);
          Draw := True;
        end;

        if CVROM.GetSpikeCrusherXY(CurrentObject,1) <> TempY then
        begin
          CVROM.SetSpikeCrusherXY(CurrentObject,NOTSET,TempY);
          Draw := True;
        end;

        if Draw = true then DrawLevelData();
      end;
    end
    else if CurrentObjType = FLOATINGPLATFORMTYPE then
    begin
      if CurrentObject > -1 then
      begin
        if ssCtrl in Shift then
        begin
          TempX := X div 2;
          TempY := Y div 2;
        end
        else
        begin
          TempX := (((X div 2) div 8) * 8);
          TempY := (((Y div 2) div 8) * 8);
        end;

        if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;
        Draw := False;
        if CVROM.GetFloatingPlatformXY(CurrentObject,0) <> TempX then
        begin
          CVROM.SetFloatingPlatformXY(CurrentObject,TempX,NOTSET);
          Draw := True;
        end;

        if CVROM.GetFloatingPlatformXY(CurrentObject,1) <> TempY then
        begin
          CVROM.SetFloatingPlatformXY(CurrentObject,NOTSET,TempY);
          Draw := True;
        end;

        if Draw = true then DrawLevelData();
      end;
    end
    else if CurrentObjType = NONSTANDARDDOORTYPE then
    begin
      if CurrentObject > -1 then
      begin
        if ssCtrl in Shift then
        begin
          TempX := X div 2;
          TempY := Y div 2;
        end
        else
        begin
          TempX := (((X div 2) div 8) * 8);
          TempY := (((Y div 2) div 8) * 8);
        end;

        if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;
        Draw := False;
        if CVROM.GetNonDoorXY(0,CurrentObject) <> TempX then
        begin
          CVROM.SetNonDoorXY(CurrentObject,TempX,NOTSET);
          Draw := True;
        end;

        if CVROM.GetNonDoorXY(1,CurrentObject) <> TempY then
        begin
          CVROM.SetNonDoorXY(CurrentObject,NOTSET,TempY);
          Draw := True;
        end;

        if Draw = true then DrawLevelData();
      end;
    end;

  end
  else if EditingMode = ENEMYEDITINGMODE then
  begin
    if (TfrmEnemyFilter(EnemyFilter).EnemyType = etCandle) or (TfrmEnemyFilter(EnemyFilter).EnemyType = etCandlestand) then
    begin
      if CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1] = 0 then
        TfrmEnemyFilter(EnemyFilter).EnemyQuadrant(-1)
      else
        TfrmEnemyFilter(EnemyFilter).EnemyQuadrant(CVROM.Enemies[CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8)) +1]].EnemyItem);
    end
    else if (TfrmEnemyFilter(EnemyFilter).EnemyType = etEnemy) then
    begin
      TfrmEnemyFilter(EnemyFilter).EnemyQuadrant(CVROM.Enemies[CVROM.EnemyData[((x div 128)*2)+ (2+ (CVROM.Levels[CVROM.level].screens[CVROM.ScreenID].ScreenNumber*8))]].EnemyItem);
    end;
  end;
end;

procedure TfrmStake.actAddStairExecute(Sender: TObject);
begin
  if CVROM.AddNewStair = -1 then
    messagebox(Handle,PChar('Sorry, but you have the maximum amount of stairs in this stage. Please delete a stair before proceeding.'),PChar(Application.Title),0);
  DrawLevelData();
  if (StakeOptions.SetObjectEditingOnWhenAddingNewStair) = True and (EDITINGMODE <> OBJEDITINGMODE) then
    actSetObjectEditingMode.Execute;
  UpdateTitleCaption;
end;

procedure TfrmStake.RedrawScreen;
begin
  CVROM.RefreshOnScreenTiles(TileScrollBar.Position);
  DrawLevelData();
  DrawTileSelector();
  if CurTSABlock > -1 then
    TfrmTSAEditor(TSA).DrawPatternTable;
end;

procedure TfrmStake.actCreatePaletteEditorExecute(Sender: TObject);
var
  Pal : TfrmPaletteEditor;
begin
  Pal := TfrmPaletteEditor.Create(self);
  try
    DropTarget.AcceptDrag := False;
    Pal.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(Pal);
  end;
end;

procedure TfrmStake.SetScreenIDLabel();
begin
  lblScreenID.Caption := CVROM.AreaName + ' - Screen ' + IntToHex(CVROM.ScreenID,2);
end;

procedure TfrmStake.actCreateROMPropertiesExecute(Sender: TObject);
var
  ROMProp : TfrmROMProperties;
begin
  ROMProp := TfrmROMProperties.Create(self);
  try

    DropTarget.AcceptDrag := False;
    ROMProp.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(ROMProp);
  end;

end;

procedure TfrmStake.actCreateAboutExecute(Sender: TObject);
var
  About : TfrmAbout;
begin
  About := TfrmAbout.Create(self);
  try
    DropTarget.AcceptDrag := False;
    About.ShowModal;
    DropTarget.AcceptDrag := True;
    
  finally
    FreeAndNil(About);
  end;

end;

procedure TfrmStake.actCreatePreferencesExecute(Sender: TObject);
var
  Pref : TfrmPreferences;
begin
  Pref := TfrmPreferences.Create(self);
  try
    DropTarget.AcceptDrag := False;
    Pref.ShowModal;
    DropTarget.AcceptDrag := True;
    if Pref.ModalResult = mrOK then
    begin
      StakeOptions.Save;
      SetEmuMenuText();
      if CVROM <> nil then
      begin
        CVROM.LoadPaletteFile(StakeOptions.FullPaletteName);
        CVROM.RefreshOnScreenTiles(TileScrollbar.Position);
        SetIconTransparency();
        DrawLevelData();
        DrawTileSelector();
        actEnableGridlines.Checked := StakeOptions.GridlinesOn; 
      end;
    end;
  finally
    FreeAndNil(Pref);
  end;

end;

procedure TfrmStake.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if CloseROM() = false then
    FreeAndNil(StakeOptions)
  else
  begin
    Action := caNone;
  end;

end;

function TfrmStake.CloseROM(): boolean;
var
  CanCancel : Boolean;
  res : Integer;
begin

  CanCancel := False;
  // First, check if the ROM has actually been opened.
  if CVROM <> nil then
  begin
    // Now, we want to check if any changes have been made to the ROM.
    // If they have, then we want to prompt the user whether or not to
    // save.
    res := messagedlg('Stake has detected that you have made some changes. Do you wish to save this ROM?' ,mtConfirmation,[mbYes,mbNo,mbCancel],0);

    if res = mrYes then
    begin
      if StakeOptions.BackupFilesWhenSaving = True then
        BackupFile();
      CVROM.Save;
    end
    else if res = mrCancel then
    begin
      CanCancel := True;
    end;

    if CanCancel = False then
    begin
      FreeAndNil(CVROM);
      if CurTSABlock > -1 then
        FreeAndNil(TSA);
      if EditingMode = ENEMYEDITINGMODE then
        FreeAndNil(EnemyFilter);
      SetVisibleStatus(False);
      UpdateTitleCaption;
      if StakeOptions.Changed = True then
        StakeOptions.Save;
    end;

  end;

  CloseROM := CanCancel;
end;

procedure TfrmStake.actCloseROMExecute(Sender: TObject);
begin
  CloseROM();
end;

procedure TfrmStake.actCreateSoundEffectTogglerExecute(Sender: TObject);
var
  SE : TfrmSoundEffects;
begin
  SE := TfrmSoundEffects.Create(self);
  try
    DropTarget.AcceptDrag := False;
    SE.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(SE);
  end;

end;

procedure TfrmStake.actCreateEnemyEditorExecute(Sender: TObject);
var
  Enemy : TfrmEnemyEditor;
begin
  Enemy := TfrmEnemyEditor.Create(self);
  try
    DropTarget.AcceptDrag := False;
    if Enemy.ShowModal = mrOk then
    begin
      if EditingMode = ENEMYEDITINGMODE then
        DrawLevelData();
    end;
    DropTarget.AcceptDrag := True;

  finally
    FreeAndNil(Enemy);
  end;

end;

procedure TfrmStake.actCreateMusicPointerEditorExecute(Sender: TObject);
var
  Music : TfrmMusicPointer;
begin
  Music := TfrmMusicPointer.Create(self);
  try
    DropTarget.AcceptDrag := False;
    Music.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(Music);
  end;


end;

procedure TfrmStake.actSetObjectEditingModeExecute(Sender: TObject);
var
  PrevEditingMode : Byte;
begin
  PrevEditingMode := 0;
  if (EditingMode = ENEMYEDITINGMODE) and (EnemyFilter <> nil) then
  begin
    FreeAndNil(EnemyFilter);
    PrevEditingMode := ENEMYEDITINGMODE;
  end;
  actSetObjectEditingMode.Checked := True;
  actSetMapEditingMode.Checked := False;
  actSetEnemyEditingMode.Checked := False;
  // Set the toolbar buttons
  tlbMapEditingMode.Down := actSetMapEditingMode.Checked;
  tlbObjectEditingMode.Down := actSetObjectEditingMode.Checked;
  tlbEnemyEditingMode.Down := actSetEnemyEditingMode.Checked;
  EditingMode := OBJEDITINGMODE;
  Statusbar.Panels[0].Text := 'Object Editing Mode';
  if PrevEditingMode= ENEMYEDITINGMODE then
    DrawLevelData();
end;

procedure TfrmStake.actSetMapEditingModeExecute(Sender: TObject);
var
  PrevEditingMode : Byte;
begin
  PrevEditingMode := 0;
  if (EditingMode = ENEMYEDITINGMODE) and (EnemyFilter <> nil) then
  begin
    FreeAndNil(EnemyFilter);
    PrevEditingMode := ENEMYEDITINGMODE;
  end;
  actSetObjectEditingMode.Checked := False;
  actSetMapEditingMode.Checked := True;
  actSetEnemyEditingMode.Checked := False;
  // Set the toolbar buttons
  tlbMapEditingMode.Down := actSetMapEditingMode.Checked;
  tlbObjectEditingMode.Down := actSetObjectEditingMode.Checked;
  tlbEnemyEditingMode.Down := actSetEnemyEditingMode.Checked;
  EditingMode := MAPEDITINGMODE;
  Statusbar.Panels[0].Text := 'Map Editing Mode';
  if PrevEditingMode= ENEMYEDITINGMODE then
    DrawLevelData();
end;

procedure TfrmStake.mnuOpenLastROMClick(Sender: TObject);
begin
  if (StakeOptions.LastROMLoaded <> '') and (FileExists(StakeOptions.LastROMLoaded) = true) then
    LoadROM(StakeOptions.LastROMLoaded,StakeOptions.FullDataFileName, StakeOptions.AutoCheck)
  else
    messagebox(handle,'You have not opened a ROM before in Stake,'+chr(13) + chr(10) + 'or the ROM you opened last cannot be found.',PChar(Application.Title),0);
end;

procedure TfrmStake.ExecuteEmulator();
begin
  if assigned(CVROM) = false then
  begin
    messagebox(handle,'Please load the ROM first.',PChar(Application.Title),0);
    exit;
  end;

  if (FileExists(StakeOptions.EmulatorPath) = false) or (StakeOptions.EmulatorPath = '') then
  begin
    messagebox(handle,'There is no emulator currently setup with Stake,' + chr(13) + chr(10)+'or the emulator cannot be found.',PChar(Application.Title),0);
    exit;
  end;
  if StakeOptions.EmulatorDisplaySaveWarning = true then
  begin
    if MessageDlg('Warning: This will save all currently made changes to the ROM. Do you wish to proceed?'+chr(13) + chr(10) + chr(13) + chr(10) + 'Please note, this warning can be disabled in the Preferences dialog.',mtWarning,[mbYes, mbNo],0) = mrNo then
      exit;
  end;

  CVROM.Save;
  if StakeOptions.EmulatorFilenameSettings = 0 then
    ShellExecute(Handle,'open',PChar(StakeOptions.EmulatorPath),PChar(' ' + CVROM.Filename),'',SW_SHOW)
  else if StakeOptions.EmulatorFilenameSettings = 1 then
    ShellExecute(Handle,'open',PChar(StakeOptions.EmulatorPath),PChar(' ' + ExtractShortPathName(CVROM.Filename)),'',SW_SHOW)
  else if StakeOptions.EmulatorFilenameSettings = 2 then
    ShellExecute(Handle,'open',PChar(StakeOptions.EmulatorPath),PChar(' "' + CVROM.Filename + '"'),'',SW_SHOW);
end;

procedure TfrmStake.mnuLaunchEMUClick(Sender: TObject);
begin
  ExecuteEmulator();
end;

procedure TfrmStake.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Assigned(CVROM) then
  begin

    if Key = VK_PRIOR	then
    begin
      if CVROM.Level = 6 then
        CVROM.Level := 0
      else
        CVROM.Level := CVROM.Level + 1;
    end
    else if Key = VK_NEXT	then
    begin
      if CVROM.Level = 0 then
        CVROM.Level := 6
      else
        CVROM.Level  := CVROM.Level - 1;
    end
    else
      exit;

    if CurTSABlock > -1 then
      TfrmTSAEditor(TSA).DrawPatternTable;

    XPos := CVROM.LevelStartX;
    YPos := CVROM.LevelStartY;
    CVROM.ScreenID := CVROM.Map[XPos,YPos];
    SetScreenIDLabel();
    DrawLevelData();
    TileScrollbar.Position := 0;
    DrawTileSelector();
    SetButtonsEnable();
    UpdateTitleCaption;
  end;

end;

procedure TfrmStake.FormCreate(Sender: TObject);
begin
  ClearMenuIcons();

  StakeOptions := TStakeConfiguration.Create(ExtractFileDir(Application.EXEName) + '\options.ini');

  CreateRecentMenu();
end;

procedure TfrmStake.actCreateTitleScreenEditorExecute(Sender: TObject);
var
  TitleScr : TfrmTitleScreenEditor;
begin
  TitleScr := TfrmTitleScreenEditor.Create(self);
  try
    DropTarget.AcceptDrag := False;
    TitleScr.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(TitleScr);
  end;

end;

procedure TfrmStake.SetIconTransparency();
var
  i : Integer;
begin
  for i := 0 to Bitmap32List.Bitmaps.Count - 1 do
  begin
    if StakeOptions.DrawTransparentIcons = True then
      Bitmap32List.Bitmap[i].DrawMode := dmBlend
    else
      Bitmap32List.Bitmap[i].DrawMode := dmOpaque;

    Bitmap32List.Bitmap[i].MasterAlpha := StakeOptions.IconTransparency;
  end;

end;

procedure TfrmStake.BackupFile();
begin

  if DirectoryExists(ExtractFileDir(ParamStr(0))+'\Backups') = false then
  begin
    CreateDir(ExtractFileDir(ParamStr(0))+'\Backups');
  end;
  ShortDateFormat := 'dd-mm-yyyy';
  TimeSeparator	:= '-';

  AbZipper.FileName := ExtractFileDir(ParamStr(0))+'\Backups\CV ' + DateTimeToStr(Now) + '.zip';
  AbZipper.AddFiles(CVROM.Filename,0);
  AbZipper.ZipfileComment := 'ZIP Created By Stake on: ' + DateTimeToStr(Now);
  AbZipper.Save;
end;

procedure TfrmStake.actCreateJumpToExecute(Sender: TObject);
var
  JumpTo : TfrmJumpTo;
begin
  JumpTo := TfrmJumpTo.Create(self);
  try
    JumpTo.Level := CVROM.Level;
    DropTarget.AcceptDrag := False;
    JumpTo.ShowModal;
    DropTarget.AcceptDrag := True;

    if JumpTo.ModalResult = mrOk then
    begin
      if JumpTo.Level <> CVROM.Level then
      begin
        CVROM.Level := JumpTo.Level;
        
        if CurTSABlock > -1 then
          TfrmTSAEditor(TSA).DrawPatternTable;

        XPos := CVROM.LevelStartX;
        YPos := CVROM.LevelStartY;
        CVROM.ScreenID := CVROM.Map[XPos,YPos];
        SetScreenIDLabel();
        DrawLevelData();
        TileScrollbar.Position := 0;
        DrawTileSelector();
        SetButtonsEnable();
      end;
    end;
  finally
    FreeAndNil(JumpTo);
  end;
end;

procedure TfrmStake.actShowBlackBarExecute(Sender: TObject);
begin
  StakeOptions.BlackBar := not(StakeOptions.BlackBar);

  DrawLevelData(); 
end;

procedure TfrmStake.actCreateROMPatchesExecute(Sender: TObject);
var
  PatchFrm : TfrmPatches;
begin
  PatchFrm := TfrmPatches.Create(self);
  try
    DropTarget.AcceptDrag := False;
    PatchFrm.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(PatchFrm);
  end;
end;

procedure TfrmStake.actCreateDamageExecute(Sender: TObject);
var
  Damage : TfrmDamageSettings;
begin
  Damage := TfrmDamageSettings.Create(self);
  try
    DropTarget.AcceptDrag := False;
    Damage.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(Damage);
  end;
end;

procedure TfrmStake.actEnableGridlinesExecute(Sender: TObject);
begin
  StakeOptions.GridlinesOn := not(StakeOptions.GridlinesOn);
  DrawLevelData();
end;

procedure TfrmStake.actCreateStagePropertiesExecute(Sender: TObject);
var
  StageProp : TfrmStageProperties;
begin
  StageProp := TfrmStageProperties.Create(self);
  try
    DropTarget.AcceptDrag := False;
    StageProp.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(StageProp);
  end;
end;

procedure TfrmStake.actCreateMapSelectorExecute(Sender: TObject);
var
  SelectScreen : TfrmSelectScreen;
begin
  SelectScreen := TfrmSelectScreen.Create(self);
  try
    DropTarget.AcceptDrag := False;
    SelectScreen.ShowModal;
    DropTarget.AcceptDrag := True;

    if SelectScreen.ModalResult = mrOk then
    begin
      if (SelectScreen.NewScreen < $FF) or (SelectScreen.NewScreen <> CVROM.ScreenID) then
      begin
        CVROM.ScreenID := SelectScreen.NewScreen;
        XPos := CVROM.Levels[CVROM.Level].Screens[CVROM.ScreenID].XPos;
        YPos := CVROM.Levels[CVROM.Level].Screens[CVROM.ScreenID].YPos;
        DrawLevelData();
        SetButtonsEnable();
        SetScreenIDLabel();
      end;
    end;
  finally
    FreeAndNil(SelectScreen);
  end;
end;

procedure TfrmStake.actCreateGlobalEnemyDataEditorExecute(Sender: TObject);
var
  GlobalEnemy : TfrmGlobalEnemyDataEditor;
begin
  GlobalEnemy := TfrmGlobalEnemyDataEditor.Create(self);
  try
    GlobalEnemy.ID := 0;
    DropTarget.AcceptDrag := False;
    GlobalEnemy.ShowModal;
    DropTarget.AcceptDrag := True;
    
    if GlobalEnemy.ModalResult = mrOk then
    begin
      if EditingMode = ENEMYEDITINGMODE then
        DrawLevelData();
    end
    else
    begin
      CVROM.LoadEnemyPosData;
      if EditingMode = ENEMYEDITINGMODE then
        DrawLevelData();      
    end;
    UpdateTitleCaption;
  finally
    FreeAndNil(GlobalEnemy)
  end;
end;

procedure TfrmStake.actAddNewBreakableBlockExecute(Sender: TObject);
begin
  if CVROM.AddNewBreakableBlock = -1 then
    messagebox(Handle,PChar('Sorry, but you have the maximum amount of breakable block in this stage. Please delete a breakable block before proceeding.'),PChar(Application.Title),0);
  DrawLevelData();
  if (StakeOptions.SetObjectEditingOnWhenAddingNewStair) = True and (EDITINGMODE <> OBJEDITINGMODE) then
    actSetObjectEditingMode.Execute;
  UpdateTitleCaption;
end;

procedure TfrmStake.actSetEnemyEditingModeExecute(Sender: TObject);
begin
  actSetObjectEditingMode.Checked := False;
  actSetMapEditingMode.Checked := False;
  actSetEnemyEditingMode.Checked := True;
  // Set the toolbar buttons
  tlbMapEditingMode.Down := actSetMapEditingMode.Checked;
  tlbObjectEditingMode.Down := actSetObjectEditingMode.Checked;
  tlbEnemyEditingMode.Down := actSetEnemyEditingMode.Checked;
  if EditingMode <> ENEMYEDITINGMODE then
  begin
    EnemyFilter := TfrmEnemyFilter.Create(self);
    EnemyFilter.Left := Left + 512;
    EnemyFilter.Top := Top + 212;

  end;
  EnemyFilter.Show;
  
  EditingMode := ENEMYEDITINGMODE;
  Statusbar.Panels[0].Text := 'Enemy Editing Mode';


  DrawLevelData();
end;

procedure TfrmStake.SetMapEditingModeOn;
begin
  actSetObjectEditingMode.Checked := False;
  actSetMapEditingMode.Checked := True;
  actSetEnemyEditingMode.Checked := False;
  // Set the toolbar buttons
  tlbMapEditingMode.Down := actSetMapEditingMode.Checked;
  tlbObjectEditingMode.Down := actSetObjectEditingMode.Checked;
  tlbEnemyEditingMode.Down := actSetEnemyEditingMode.Checked;
  EditingMode := MAPEDITINGMODE;
  Statusbar.Panels[0].Text := 'Map Editing Mode';
  DrawLevelData();
end;

procedure TfrmStake.actCreateExportLevelExecute(Sender: TObject);
var
  ExportLev : TfrmExportLevel;
begin
  ExportLev := TfrmExportLevel.Create(self);
  try
    DropTarget.AcceptDrag := False;
    ExportLev.ShowModal;
    DropTarget.AcceptDrag := True;
    
  finally
    FreeAndNil(ExportLev);
  end;
end;

procedure TfrmStake.actCreateImportLevelExecute(Sender: TObject);
var
  ImportLev : TfrmImportLevel;
begin
  ImportLev := TfrmImportLevel.Create(self);
  try
    DropTarget.AcceptDrag := False;
    if ImportLev.ShowModal = mrOK then
    begin
      RedrawScreen;
    end;
    DropTarget.AcceptDrag := True;

  finally
    FreeAndNil(ImportLev);
  end;

end;

procedure TfrmStake.mnuViewStairsClick(Sender: TObject);
begin
  DrawLevelData();
end;

procedure TfrmStake.actExitExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmStake.actCreateCastleIntroEditorExecute(Sender: TObject);
var
  CasIntro : TfrmCastleIntroEditor;
begin
  CasIntro := TfrmCastleIntroEditor.Create(self);
  try
    DropTarget.AcceptDrag := False;
    CasIntro.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(CasIntro);
  end;
end;

procedure TfrmStake.CreateRecentMenu();
var
  Bitmap : TBitmap;
begin
  if StakeOptions.NumberOfRecentlyOpenedFiles = 0 then
    mnuRecent.Visible := False
  else
    mnuRecent.Visible := True;
    
  if StakeOptions.RecentFile[0] = '' then
    mnuRecentItem1.Visible := False
  else
    mnuRecentItem1.Visible := True;

  if StakeOptions.RecentFile[1] = '' then
    mnuRecentItem2.Visible := False
  else
    mnuRecentItem2.Visible := True;

  if StakeOptions.RecentFile[2] = '' then
    mnuRecentItem3.Visible := False
  else
    mnuRecentItem3.Visible := True;
  if StakeOptions.RecentFile[3] = '' then
    mnuRecentItem4.Visible := False
  else
    mnuRecentItem4.Visible := True;
  if StakeOptions.RecentFile[4] = '' then
    mnuRecentItem5.Visible := False
  else
    mnuRecentItem5.Visible := True;

  Bitmap := TBitmap.Create;
  try
    Bitmap.Width := 500;
    Bitmap.Height :=  40;
    mnuRecentItem1.Caption := MinimizeName(StakeOptions.RecentFile[0],Bitmap.Canvas,500);
    mnuRecentItem2.Caption := MinimizeName(StakeOptions.RecentFile[1],Bitmap.Canvas,500);
    mnuRecentItem3.Caption := MinimizeName(StakeOptions.RecentFile[2],Bitmap.Canvas,500);
    mnuRecentItem4.Caption := MinimizeName(StakeOptions.RecentFile[3],Bitmap.Canvas,500);
    mnuRecentItem5.Caption := MinimizeName(StakeOptions.RecentFile[4],Bitmap.Canvas,500);
  finally
    FreeAndNil(Bitmap);
  end;

end;

procedure TfrmStake.mnuRecentItem1Click(Sender: TObject);
begin
  LoadROM(StakeOptions.RecentFile[TMenuItem(sender).MenuIndex],StakeOptions.FullDataFileName, StakeOptions.AutoCheck);
end;

procedure TfrmStake.actCreateEndingEditorExecute(Sender: TObject);
var
  ending : TfrmEndingEditor;
begin
  ending := TfrmEndingEditor.Create(self);
  try
    DropTarget.AcceptDrag := False;
    ending.ShowModal;
    DropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    freeandnil(ending);
  end;
end;

procedure TfrmStake.mnuTurnAllViewingOptionsOnClick(Sender: TObject);
begin
  mnuViewStairs.Checked := True;
  mnuViewDoors.Checked := True;
  mnuViewSpikeCrushers.Checked := True;
  mnuViewEntrances.Checked := True;
  mnuViewBreakableBlocks.Checked := True;
  mnuViewFloatingPlatforms.Checked := True;
  StakeOptions.BlackBar := True;
  actShowBlackBar.Checked := StakeOptions.BlackBar;
  DrawLevelData();
end;

procedure TfrmStake.mnuTurnAllViewingOptionsOffClick(Sender: TObject);
begin
  mnuViewStairs.Checked := False;
  mnuViewDoors.Checked := False;
  mnuViewSpikeCrushers.Checked := False;
  mnuViewEntrances.Checked := False;
  mnuViewBreakableBlocks.Checked := False;
  mnuViewFloatingPlatforms.Checked := False;
  StakeOptions.BlackBar := False;
  actShowBlackBar.Checked := StakeOptions.BlackBar;
  DrawLevelData();
end;

procedure TfrmStake.actCreateFilePropertiesExecute(Sender: TObject);
var
  Prop : TfrmFileProperties;
begin
  Prop := TfrmFileProperties.Create(self);
  try
    Prop.ShowModal;
  finally
    FreeAndNil(Prop);
  end;
end;

function TfrmStake.AutoCheckROMType(pFilename : String) : String;
var
  DataFiles : TStringList;
  INI : TMemINIHexFile;
  i : Integer;
  Loc : Integer;
  Auto1,Auto2,Auto3,Auto4 : Byte;
  TempROM : TiNESImage;
begin
  result := '';
  DataFiles := TStringList.Create;
  try
    DataFiles.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\data.dat');

    for i := 0 to DataFiles.Count -1 do
    begin
      INI := TMemINIHexFile.Create(ExtractFileDir(Application.ExeName) + '\Data\' + DataFiles[i]);
      try
        Loc := INI.ReadHexValue('AutoCheck','Location');
        Auto1 := INI.ReadHexValue('AutoCheck','Auto1');
        Auto2 := INI.ReadHexValue('AutoCheck','Auto2');
        Auto3 := INI.ReadHexValue('AutoCheck','Auto3');
        Auto4 := INI.ReadHexValue('AutoCheck','Auto4');
        TempROM := TiNESImage.Create(pFilename);
        if TempROM.ROM[Loc] = Auto1 then
          if TempROM.ROM[Loc+1] = Auto2 then
            if TempROM.ROM[Loc+2] = Auto3 then
              if TempROM.ROM[Loc+3] = Auto4 then
              begin
                result := DataFiles[i];
                break;
              end;
      finally
        FreeAndNil(TempROM);
        FreeAndNil(INI);
      end;
    end;
  finally
    FreeAndNil(DataFiles);
  end;
end;

procedure TfrmStake.ClearMenuIcons();
begin
  mnuMapEditingMode.ImageIndex := -1;
  mnuObjectEditingMode.ImageIndex := -1;
  mnuEnemyEditingMode.ImageIndex := -1;
  mnuViewStairs.ImageIndex := -1;
  mnuViewEntrances.ImageIndex := -1;
  mnuViewDoors.ImageIndex := -1;
  mnuViewSpikeCrushers.ImageIndex := -1;
  mnuViewFloatingPlatforms.ImageIndex := -1;
  mnuViewBlackBar.ImageIndex := -1;
  mnuEnableGridlines.ImageIndex := -1;
  mnuViewBreakableBlocks.ImageIndex := -1;
end;

procedure TfrmStake.UpdateTitleCaption;
begin
  if Assigned(CVROM) = True then
  begin
    Caption := APPLICATIONNAME + ' - [' +ExtractFileName(CVROM.Filename) + ']';
    if CVROM.Changed = True then
      Caption := Caption + ' *';
  end
  else
  begin
    Caption := APPLICATIONNAME;
  end;
end;

procedure TfrmStake.actSaveAsIPSExecute(Sender: TObject);
var
  output : String;
begin
  if Assigned(CVROM) then
  begin
    if (FileExists(StakeOptions.OriginalROMFile) = true) then
    begin
      if StakeOptions.OriginalROMFile = CVROM.Filename then
      begin
        showmessage('The original ROM file cannot be same as the ROM that you are hacking.');
        exit;
      end;

      if StakeOptions.IPSOutput = '' then
        Output := ChangeFileExt(CVROM.Filename,'.ips')
      else
        Output := StakeOptions.IPSOutput;
      // Save the ROM, so you have the most updated version
      CVROM.Save;
      LunarIPSCreate(handle,PChar(Output),PChar(StakeOptions.OriginalROMFile),PChar(CVROM.Filename),0);
      UpdateTitleCaption;
    end
    else
      showmessage('Sorry, but you need to specify an original ROM file that exists.');
  end;

end;

procedure TfrmStake.actKeyboardLayoutsExecute(Sender: TObject);
var
  frmKey : TfrmKeyboardLayouts;
begin
  frmKey := TfrmKeyboardLayouts.Create(self);
  try
    frmKey.ShowModal;
  finally
    FreeAndNil(frmKey);
  end;
end;

procedure TfrmStake.txtTileJumpToKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
  begin
    if StrToInt('$' + txtTileJumpTo.Text) > TileScrollbar.Max then
      TileScrollbar.Position := TileScrollBar.Max
    else
      TileScrollbar.Position := StrToInt('$' + txtTileJumpTo.Text);
  end;
end;

procedure TfrmStake.DropTargetDragDrop(Sender: TJvDropTarget;
  var Effect: TJvDropEffect; Shift: TShiftState; X, Y: Integer);
var
  Files : TStringList;
begin
  Files := TStringList.Create;
  try
    sender.GetFilenames(Files);
    LoadROM(Files[0],StakeOptions.FullDataFileName,StakeOptions.AutoCheck);
  finally
    FreeAndNil(Files);
  end;
end;

end.
