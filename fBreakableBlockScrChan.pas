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

unit fBreakableBlockScrChan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmBreakableChanger = class(TForm)
    lblScreenNo: TLabel;
    cbScreens: TComboBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    chkEnabled: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    BlockID : Integer;
    { Public declarations }
  end;

var
  frmBreakableChanger: TfrmBreakableChanger;

implementation

uses uglobal, cCVROM;

{$R *.dfm}

procedure TfrmBreakableChanger.FormShow(Sender: TObject);
var
  TempStrList : TStringList;
begin
  TempStrList := TStringList.Create;
  try
    CVROM.GetScreenBrBlocks(TempStrList,BlockID);
    cbScreens.Items := TempStrList;
    cbScreens.ItemIndex := cbScreens.Items.IndexOf(IntToHex(CVROM.ScreenID,2));
  finally
    FreeAndNil(TempStrList);
  end;
  chkEnabled.Checked := CVROM.Levels[CVROM.Level].BreakableBlocks[BlockID].AppearsSecondQuestOnly;
end;

procedure TfrmBreakableChanger.cmdOKClick(Sender: TObject);
var
  CVScreen : TCVScreen;
begin

  CVScreen := CVROM.Levels[CVROM.Level].Screens[StrToInt('$' + cbScreens.Items[cbScreens.ItemIndex])];

  CVROM.Levels[CVROM.Level].BreakableBlocks[BlockID].ScreenNumber := CVScreen.ScreenNumber;
  CVROM.Levels[CVROM.Level].BreakableBlocks[BlockID].MultiAreaBit := CVScreen.MultiAreaBit;
  CVROM.Levels[CVROM.Level].BreakableBlocks[BlockID].AppearsSecondQuestOnly := chkEnabled.Checked;
end;

end.
