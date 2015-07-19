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

unit fFloatingPlatProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmFloatingPlatChange = class(TForm)
    lblScreenNumber: TLabel;
    lblPixels: TLabel;
    lblSpeed: TLabel;
    cmdOk: TButton;
    cmdCancel: TButton;
    txtPixels: TEdit;
    txtSpeed: TEdit;
    cbScreens: TComboBox;
    lblUnknownByte1: TLabel;
    txtUnknownByte1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure cmdOkClick(Sender: TObject);
  private
    _FloatPlatID : Integer;
    { Private declarations }
  public
    property FloatingPlatformID : Integer read _FloatPlatID write _FloatPlatID;
    { Public declarations }
  end;

var
  frmFloatingPlatChange: TfrmFloatingPlatChange;

implementation

uses uglobal, cCVObjects;

{$R *.dfm}

procedure TfrmFloatingPlatChange.FormShow(Sender: TObject);
var
  TempStrList : TStringList;
begin
  TempStrList := TStringList.Create;
  try
    CVROM.GetScreenFloatingPlatform(TempStrList,_FloatPlatID);
    cbScreens.Items := TempStrList;
    cbScreens.ItemIndex := cbScreens.Items.IndexOf(IntToHex(CVROM.ScreenID,2));
  finally
    FreeAndNil(TempStrList);
  end;
//  txtDistanceSpeed.Text := IntToHex(CVROM.Levels[CVROM.Level].FloatingPlatforms[_FloatPlatID].DistanceSpeed ,2);
  txtPixels.Text := IntToHex(CVROM.Levels[CVROM.Level].FloatingPlatforms[_FloatPlatID].NumPixels,2);
  txtSpeed.Text := IntToHex(CVROM.Levels[CVROM.Level].FloatingPlatforms[_FloatPlatID].Speed,2);
  txtUnknownByte1.Text := IntToHex(CVROM.Levels[CVROM.Level].FloatingPlatforms[_FloatPlatID].UnknownByte1,2);
//  txtUnknownByte2.Text := IntToHex(CVROM.Levels[CVROM.Level].FloatingPlatforms[_FloatPlatID].UnknownByte2,2);
end;

procedure TfrmFloatingPlatChange.cmdOkClick(Sender: TObject);
var
  TempFloat : TFloatingPlatform;
begin
  TempFloat := CVROM.Levels[CVROM.Level].FloatingPlatforms[_FloatPlatID];
  TempFloat.Screen := CVROM.Levels[CVROM.Level].Screens[StrToInt('$' + cbScreens.Items[cbScreens.ItemIndex])].ScreenNumber;
//  TempFloat.DistanceSpeed := StrToInt('$' + txtDistanceSpeed.Text);
  TempFloat.NumPixels  := StrToInt('$' + txtPixels.Text);
  TempFloat.Speed := StrToInt('$' + txtSpeed.Text);
  TempFloat.UnknownByte1 := StrToInt('$' + txtUnknownByte1.Text);
//  TempFloat.UnknownByte2 := StrToInt('$' + txtUnknownByte2.Text);
end;

end.
