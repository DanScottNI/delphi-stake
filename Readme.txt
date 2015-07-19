Stake v1.1
Written by: Dan
01/02/2004
Homepage: http://dan.panicus.org

______________________________________________________________________________________

Contents 
______________________________________________________________________________________

1.  Introduction
2.  What's New
3.  Using Stake
4.  Bugs/Suggestions
5.  Whats to come...

______________________________________________________________________________________

1.  Introduction 
______________________________________________________________________________________

Stake is a Windows-based level editor for the NES ROM, Castlevania. It was developed 
using Delphi 6, on the Windows XP operating system. It supports the many versions of 
Castlevania, such as the european ROM, the american ROM, and even Akumajou Dracula - 
the special rerelease of the Japanese CV. It doesn't however, support the Famicom Disk 
System original of CV. (Yet :)) Here's what features Stake has:

- Graphics are read from the ROM.
- Full level editing of all levels in the ROM.
- TSA editing
- Level palette editing
- Stairs editing
- Doors editing
- Entrances editing
- Basic enemy editing
- Global Enemy Data editing
- Basic 8x8 Tile Editor.
- Hidden items editing
- Title Screen Editor
- Stage properties editor
- Sound effect enabler/disabler
- Some basic ROM patches to change Castlevania in minor ways
- Some minor statistics can be altered
- Character Damage Editor
- Music Pointer Editor
- Castle Intro Editor
- Ending Editor + Ending Text Editor
- Floating Platforms Editing
- Spike Crusher Editing
- Non-standard door editing 

______________________________________________________________________________________

2.  What's New 
______________________________________________________________________________________

v1.1.2 ~ A few minor changes ;)

- Changed to JvDragDrop
- Added a fix to stop the stage properties dialog attempting to save the boss
  stage value, when it isn't enabled. (Thanks to Everdred for reporting this)
- Altered the graphics drawing routine slightly.
- Removed TjvMainMenu. Main difference that this has made is the menu now highlights
  when you mouse over it. Wow. Also some of the menu icons have been removed, as 
  Delphi doesn't seem to support having the checked state and a picture in the same 
  control. (VCL bug maybe?)
- Removed the setup screen. Not needed at all anymore.
- Renamed the 'Jump To' menu text to 'Go to Level'. I suppose Jump To was really
  vague.
- A minor update to speed up the Global Enemy Data refresh. Seems faster to me.
- Changed the gridlines, left text, and middle text colours to allow you to pick a 
  custom colour.
- Fixed an incorrect offset in level 5's door. Thanks to DragonsBrethern for 
  reporting this.
- Renamed several source code files.
- Added IPS patch generation. There's a new dependency on Lunar Compress though.
- Removed the annoying messagebox that appears when you haven't made any changes, yet
  prompts you to save when you are closing the program. -_- Whether you have made
  any changes is reflected in the Stake's title bar. If there is an asterisk on the end
  then changes have been made. Please note, ROMs which have never been opened in Stake
  will automatically have changes as some changes will be made to the ROM to allow
  more space for the title screen/castle intro screens.
- Dumped some stupid crap from the configuration class.
- Compiled help file is no longer included in the main Stake distribution. Download it
  separately. :P
- Added a menu item, keyboard layout, which details the keyboard layouts
- Added a textbox which allows you to jump to a certain tile in the tile selector.
- Fixed the boss screen editing to allow editing of bosses on screens that use multi-area
  bits.

v1.1.1

- Fixed a minor bug in the title screen, castle intro editors.
- Added the ability to move objects by 1 pixel. Added to fix any problems with level 
  2's doors. Please note, some objects do not really support 1 pixel movement, so you
  really should be careful here. Hold Ctrl when dragging the object, to move them by 1
  pixel.
- Fixed a bug where the floating platform data and non-standard door data isn't saved, 
  unless you change the level.
- Fixed a bug in the zip file routine that saved unnecessary path information.
- Fixed a datafile bug in level 3.
- Fixed the name of the cross item.

v1.1

- Converted enemy names to those contained in the PAL manual of Castlevania.
- Removed dependency on pal.dat and data.dat for the palette files and data files 
  respectively. Stake now scans the Palettes and Data directories for files with the 
  extensions *.pal for palettes and *.ini for data files. Should make things easier for 
  people to add custom palettes and what not. This has temporarily broken the CRC 
  checking...
- Begun commenting of Stake's source code.
- Removed automatic scanning of data files. However, it now scans for SPF files.
- Created a View menu that allows you to toggle viewing certain objects on and off. 
  Also moved some items from the Edit menu, into View, and added menu items for 
  Add New Stair and Add New Breakable Blocks.
- Enabled dragging and dropping of ROMs from Windows Explorer to Stake.
- Altered the behaviour of the Left/Middle Text Colour to also set the colour of the 
  box that is drawn around the currently selected tile for each of those buttons 
  respectively.
- Added spike crusher editing support. However, the support for spike crushers is very 
  limited, as the actual code in the game for the spikes seems to have been written 
  rather sloppily by Konami. :P
- Fixed a minor bug in the tile scrollbar where the max value of the scrollbar was 
  always set to that of the first level.
- Fixed a minor bug that allowed you to duplicate the enemy filter dialog box.
- Added basic floating platform editing.
- Added an option to ignore mapper warnings.
- Added the ability to delete ranges of the current pattern table.
- Enemy data is now loaded from the pointers. These are displayed on the raw enemy editor 
  dialog.
- Stake now displays the filename of the emulator which you have associated with it.
- You can now edit the amount of health the pork chop gives you.
- Removed the dependency on JDURLLabel.
- Added a castle introduction editor.
- Added a "most recently used files" menu. Replaces the 'Open Last ROM' menu item. It's 
  probably glitchy, as I am always sceptical about algorithms I have written. :P
- Added icons to the view menu.
- Added an option to over-ride the default datafile setting when you are opening a ROM 
  through the open dialog. Thanks to John for suggesting this.
- Implemented a hack where Stake moves the graphics from the intro to a different bank, 
  and gives you that space for both the title screen editor and castle intro editor. It 
  gives you at least 1000 free bytes for both editors. :D
- Fixed a small update bug in the title screen editor.
- Removed a few useless procedures that were necessary to call before freeing objects.
- To highlight the importance of datafiles in Stake, the currently in use datafile is 
  displayed in the bottom right in the statusbar. Thanks to John for suggesting this.
- Level 4's first stage now has a door. Previously, I believed that this wasn't a door, 
  but apparently it's a special hacked door. (lazy Konami again :P)
- Level 6's exit has a door too. Apparently, this is a door too.
- Changed the way entrances are handled. Means no difference to the editing of them, but 
  seems better to me.
- Added non-standard doors editing. Simply put, this is those doors that appear in the 
  first area, and in the first area of the clock tower.
- Added editing of ending's palette to palette editor. Tidied up the palette editor also.
- Added ending editing.
- Made a few internal code changes, removing stupid procedures/functions and replacing 
  them with properties.
- Added ending text editing. Kind of limited, but meh.
- Added a file properties box, to tell you mapper info, filename, etc.
- Added an option to toggle certain things off when you are exporting data.
- Removed the ability to move objects slightly off the screen.
- Rejigged the source code to be more manageable.
- Fixed a small glitch in the restore defaults button in the preferences dialog.
- Fixed the messages that pop up when you attempt to save and the file is locked.
- Added the ability to erase ranges of tiles in the TSA editor.
- Backups are turned on by default.
- Fixed a bug where the stairs overlapped the breakable blocks data, if you used every 
  available stair.
- Added the ability to have Stake attempt to figure out what ROM is currently being 
  opened. Should work 99% of the time. If it cannot figure out what ROM is being opened, 
  it will just use the default data file.
- Fixed Akumajou Dracula's enemy section of the datafile. 

v1.0.1 

- Importing and exporting of levels has been implemented. This is to help recover from 
  hacks that get mangled due to bugs or something. Not that there are many bugs.
- Fixed a bug in the Save Pattern Table routine, which meant corrupted graphics and 
  stuff. 
 
v1.0 - The rewrite.

- Code of the program completely rewritten. Legacy code ported over to class based 
  system.
- Stake will now check the ROM that you load and see if it's PRG, CHR and mapper 
  number are correct for a Castlevania ROM. If it is not correct, it will refuse to 
  load the ROM.
- Stairs now utilise the pointers to the stairs data, in preparation for the stairs 
  adding system.
- User interface tweak to the Up, Down, Left, Right button. Now, they are BitBtn's, 
  with relevant bitmaps, and they are moved to the position where scrollbars would be.
- Upgraded to GR32 1.5.1.
- Uses Sire's stair, door, and entrance icons.
- Middle button of the mouse is now used for an extra currently selected tile. If you 
  don't have a middle button, Shift + Left Click is also provided.
- Stairs adding function coded. Hardcored to allow you to have only 30 stairs per 
  stage. Changeable via a constant, but a smart hacker may want to repoint something 
  else in that bank, so I may as well leave the space for them to do so.
- Stairs deleting function coded. Utilised through CTRL + Right click on a stair.
- Minor entrance and door bugs fixed.
- ROM properties statistics replaced by a value editor.
- ROM assembly hacks are replaced by SPF files.
- You now have to have the ROM closed to change the datafile.
- Stake now displays text in the tile selector which can tell you which tile is mapped 
  to which mouse button. You can turn this off, or change the colour of the text.
- Added an 8x8 Tile Editor. This is an extremely basic tile editor for what is currently 
  stored in the BG pattern table. Accessible via the middle clicking on the TSA editor 
  whilst hovering over the tile you want to edit.
- Added the title screen editor. The compression routine may not be perfect, but it 
  seems to work, and even compresses the original data better than it was before. The 
  castle intro seems to use exactly the same compression method, so I may include an 
  editor for it.
- Fixed the pattern table to correctly load in the special items for all stages.
- Rewrote the enemy editor to use a listview. Needs updating for the global enemy data 
  loading. 
- Implemented saving of the last pattern table colour for the TSA editor, and 8x8 tile editor.
- Fixed the sound effects toggler, removing the special weapons toggler.
- Added the music pointer editor. I'm not entirely sure whether the guess track 
  name thing works correctly, but it seems to.
- Added breakable block editing. You can switch which item is dropped, and whether the 
  block appears in the second quest only. I may do the same with the stairs, and add an 
  option to add breakable blocks, but this will be probably be limited to adding only 5 
  blocks per stage, as the memory location that stores whether the block has been broken 
  is only one byte.
- Merged all the editing modes into one generic Object Editing Mode. There was going to be 
  too many editing modes if they had remained separate.
- Added a backup option. Every time you save, Stake will automatically check for the backups 
  folder, and if it does not exist, it will create it. It will then compress the NES ROM that 
  is on disk, to a ZIP file in said backup folder with the date/time as part of the filename.
- Added an option to have transparent object icons. Mainly a pretty option.
- You can now associate an emulator with Stake, for quick testing of your ROM.
- There are now several ROM patches included with Stake. These patches are in my special 
  SPF file format. It's essentially a variant of IPS with 4 byte addresses, and title and 
  description fields embedded in them. There are several patches included with this version 
  which could be quite useful. Included is Thaddeus's intro remove hack, and DahrkDaiz's Red 
  Axe hack, which I fixed the sprite to use the final sprite palette, hence making it red, and 
  not the original blue.
- Added a character damage editor. You can now make your hack easy as hell, or super difficult. 
  (probably will be the latter :P)
- Added three new properties to the ROM properties. Small heart, big heart and clock cost.
- Included an option to put a black bar across the top, hence showing you how the level will 
  look in an emulator.
- Implemented a stage properties dialog. You can edit the time that appears when you die, or 
  start the level, and the screen that the boss appears on. (May be useful for mid-stage mini 
  boss or something)
- Added a metedit-style screen selector.
- You can now edit most of the palettes in the game through the palette editor.
- Implemented a check if the boss screen selector cannot find the screen that the ROM specifies. 
  (Dracula's Stage).
- Added a 8x8 Tile Editor for the title screen.
- Implemented a global enemy data editor. Includes an enemy preview window button, that previews 
  the Y-axis of the enemy. There are still a few enemies that are unknown, so if you figure out 
  what they are, let me know. :D
- Improved the enemy editor.
- TSA now has a statusbar which tells you the currently selected tile, and the tile that you are 
  moused over in the pattern table.
- Implemented breakable block adding. You can add up to 5 blocks per stage. You can also delete 
  breakable blocks, if you desire.
- Implemented an option to turn off the behaviour of going to object editing mode when you add a 
  stair or breakable block.
- Implemented a datafile option to disable the titlescreen editing. Akumajou Dracula's title screen 
  utilises an entirely different type of RLE, that I do not know how to decompress. :P
- When the middle and left tile selectors are on the same tile, it now splits the tile selector's 
  box to inform you of this.
- Coded a proper interactive enemy editor. Acts a bit quirky at the moment, but it works. I think.
- Added several more items to the candle item list. These items aren't used in any candles in the 
  game, but they can be edited in now.

v0.9 - First release.

______________________________________________________________________________________

3.  Using Stake
______________________________________________________________________________________

Consult the compiled HTML document (stake.chm) for more information on how to use 
Stake.

______________________________________________________________________________________

4.  Bugs/Suggestions 
______________________________________________________________________________________

If you find any bugs, or have any suggestions (not ones like make it faster, 
as unless you provide code which you know is faster than mine, you'll be 
getting the middle finger son) pm me. Or e-mail me.

______________________________________________________________________________________

5.  Whats to come... 
______________________________________________________________________________________

- Anything that has a bug.