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

unit fSoundEffects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmSoundEffects = class(TForm)
    chkHeartSoundEffect: TCheckBox;
    chkWhipPowerUpSoundEffect: TCheckBox;
    chkCashSoundEffect: TCheckBox;
    chkCastleDoorSoundEffect: TCheckBox;
    chkInvulnerabilityJarSoundEffect1: TCheckBox;
    chkInvulnerabilityJarSoundEffect2: TCheckBox;
    chkDoorOpeningSoundEffect: TCheckBox;
    chkHiddenItemAppearingSoundEffect: TCheckBox;
    chkClearScreenItemSoundEffect: TCheckBox;
    chk1UPSoundEffect: TCheckBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    procedure SetCheckBoxes;
    procedure SetValues;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSoundEffects: TfrmSoundEffects;

implementation

uses uglobal;

{$R *.dfm}

procedure TfrmSoundEffects.SetCheckBoxes();
begin
  chkHeartSoundEffect.Checked := CVROM.SoundEffects.SoundHeart;
  chkDoorOpeningSoundEffect.Checked := CVROM.SoundEffects.SoundDoorOpening;
  chkCashSoundEffect.Checked := CVROM.SoundEffects.SoundMoney;
  chkHiddenItemAppearingSoundEffect.Checked := CVROM.SoundEffects.SoundHiddenItem;
  chk1UPSoundEffect.Checked := CVROM.SoundEffects.SoundExtraLife;
  chkClearScreenItemSoundEffect.Checked := CVROM.SoundEffects.SoundClearScreen;
  chkInvulnerabilityJarSoundEffect1.Checked := CVROM.SoundEffects.SoundJar1;
  chkInvulnerabilityJarSoundEffect2.Checked := CVROM.SoundEffects.SoundJar2;
  chkWhipPowerUpSoundEffect.Checked := CVROM.SoundEffects.SoundWhip;
  chkCastleDoorSoundEffect.Checked := CVROM.SoundEffects.SoundCastleDoor;
end;

procedure TfrmSoundEffects.FormShow(Sender: TObject);
begin
  SetCheckBoxes();
end;

procedure TfrmSoundEffects.cmdOKClick(Sender: TObject);
begin
  SetValues;
end;

procedure TfrmSoundEffects.SetValues();
begin
  CVROM.SoundEffects.SoundHeart := chkHeartSoundEffect.Checked;
  CVROM.SoundEffects.SoundDoorOpening := chkDoorOpeningSoundEffect.Checked;
  CVROM.SoundEffects.SoundMoney := chkCashSoundEffect.Checked;
  CVROM.SoundEffects.SoundHiddenItem := chkHiddenItemAppearingSoundEffect.Checked;
  CVROM.SoundEffects.SoundExtraLife := chk1UPSoundEffect.Checked;
  CVROM.SoundEffects.SoundClearScreen := chkClearScreenItemSoundEffect.Checked;
  CVROM.SoundEffects.SoundJar1 := chkInvulnerabilityJarSoundEffect1.Checked;
  CVROM.SoundEffects.SoundJar2 := chkInvulnerabilityJarSoundEffect2.Checked;
  CVROM.SoundEffects.SoundWhip := chkWhipPowerUpSoundEffect.Checked;
  CVROM.SoundEffects.SoundCastleDoor := chkCastleDoorSoundEffect.Checked;
end;

end.
