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

unit fSpikeCrusherScrChan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmSpikeCrusherScreenChanger = class(TForm)
    lblSpikeCrusherScreen: TLabel;
    cbScreens: TComboBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    lblDescVal1: TLabel;
    txtDescVal1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _BlockID : Integer;
    { Private declarations }
  public
    property BlockID : Integer read _BlockID write _BlockID;
    { Public declarations }
  end;

var
  frmSpikeCrusherScreenChanger: TfrmSpikeCrusherScreenChanger;

implementation

uses uglobal;

{$R *.dfm}

procedure TfrmSpikeCrusherScreenChanger.FormShow(Sender: TObject);
var
  TempStrList : TStringList;
begin

  TempStrList := TStringList.Create;
  try
    CVROM.GetScreenSpikeCrushers(TempStrList,BlockID);

    cbScreens.Items := TempStrList;
//    cbScreens.ItemIndex := cbScreens.Items.IndexOf(IntToHex(CVROM.GetStairScreen(StairID),2) );
    cbScreens.ItemIndex := cbScreens.Items.IndexOf(IntToHex(CVROM.ScreenID,2));
  finally
    FreeAndNil(TempStrList);
  end;
  txtDescVal1.Text :=  IntToHex(CVROM.Levels[CVROM.Levels.CurrentLevel].SpikeCrushers[BlockID].Desc1,2);
//  txtDescVal2.Text :=  IntToHex(CVROM.Levels[CVROM.Levels.CurrentLevel].SpikeCrushers[BlockID].Desc2,2);
end;

procedure TfrmSpikeCrusherScreenChanger.cmdOKClick(Sender: TObject);
begin
  CVROM.Levels[CVROM.Levels.CurrentLevel].SpikeCrushers[BlockID].Screen := CVROM.Levels[CVROM.Level].Screens[StrToInt('$' + cbScreens.Items[cbScreens.ItemIndex])].ScreenNumber;
  CVROM.Levels[CVROM.Levels.CurrentLevel].SpikeCrushers[BlockID].Desc1 := StrToInt('$' + txtDescVal1.Text);
end;

end.
