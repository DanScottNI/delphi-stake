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

program StakePro;



uses
  Forms,
  fStake in 'fStake.pas' {frmStake},
  cCVROM in 'cCVROM.pas',
  cConfig in 'cConfig.pas',
  fOpenDialog in 'fOpenDialog.pas' {frmOpenDialog},
  fTSA in 'fTSA.pas' {frmTSAEditor},
  fTileEditor in 'fTileEditor.pas' {frm8x8TileEditor},
  fScreenChanger in 'fScreenChanger.pas' {frmScreenChanger},
  fPalette in 'fPalette.pas' {frmPaletteEditor},
  fROMProperties in 'fROMProperties.pas' {frmROMProperties},
  fAbout in 'fAbout.pas' {frmAbout},
  fPreferences in 'fPreferences.pas' {frmPreferences},
  fSoundEffects in 'fSoundEffects.pas' {frmSoundEffects},
  fMusicPointers in 'fMusicPointers.pas' {frmMusicPointer},
  fEnemyEd in 'fEnemyEd.pas' {frmEnemyEditor},
  fTitleScreenEditor in 'fTitleScreenEditor.pas' {frmTitleScreenEditor},
  fJumpTo in 'fJumpTo.pas' {frmJumpTo},
  fPatch in 'fPatch.pas' {frmPatches},
  fBreakableBlockScrChan in 'fBreakableBlockScrChan.pas' {frmBreakableChanger},
  fStageProperties in 'fStageProperties.pas' {frmStageProperties},
  fDamageSettings in 'fDamageSettings.pas' {frmDamageSettings},
  fSelectMap in 'fSelectMap.pas' {frmSelectScreen},
  uEnemyType in 'uEnemyType.pas',
  fGlobalEnemyDataEditor in 'fGlobalEnemyDataEditor.pas' {frmGlobalEnemyDataEditor},
  fEnemyPreview in 'fEnemyPreview.pas' {frmEnemyPreview},
  fEnemyFilter in 'fEnemyFilter.pas' {frmEnemyFilter},
  fExportLevel in 'fExportLevel.pas' {frmExportLevel},
  fImportLevel in 'fImportLevel.pas' {frmImportLevel},
  fSpikeCrusherScrChan in 'fSpikeCrusherScrChan.pas' {frmSpikeCrusherScreenChanger},
  fFloatingPlatProp in 'fFloatingPlatProp.pas' {frmFloatingPlatChange},
  fErasePatRange in 'fErasePatRange.pas' {frmErasePatRange},
  fcastleintro in 'fcastleintro.pas' {frmCastleIntroEditor},
  fending in 'fending.pas' {frmEndingEditor},
  fNonDoors in 'fNonDoors.pas' {frmNonDoorOpt},
  fEndingText in 'fEndingText.pas' {frmEndingTextEditor},
  fFileProperties in 'fFileProperties.pas' {frmFileProperties},
  cROM in 'cROM.pas',
  cMusic in 'cMusic.pas',
  ctitlescreen in 'ctitlescreen.pas',
  cMisc in 'cMisc.pas',
  cCVObjects in 'cCVObjects.pas',
  ulunarcompress in 'ulunarcompress.pas',
  uglobal in 'uglobal.pas',
  fKeyboardLayouts in 'fKeyboardLayouts.pas' {frmKeyboardLayouts};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Stake v1.1 ~ The Castlevania Editor';
  Application.CreateForm(TfrmStake, frmStake);
  Application.Run;
end.
