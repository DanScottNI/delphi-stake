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

unit fStageProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmStageProperties = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    lblTime: TLabel;
    txtTime: TEdit;
    cbBossScreenNumber: TComboBox;
    lblBossScreen: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    procedure LoadStageProperties;
    procedure SaveStageProperties;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStageProperties: TfrmStageProperties;

implementation

uses uglobal;

{$R *.dfm}
const
  NOTSET : String = 'Not Set';

procedure TfrmStageProperties.FormShow(Sender: TObject);
begin
  LoadStageProperties;
end;

procedure TfrmStageProperties.LoadStageProperties;
var
  TempStrList : TStringList;
  i : Integer;
  Found : Boolean;
begin

  TempStrList := TStringList.Create;
  try
    CVROM.GetStageScreenNumbers(TempStrList);
    TempStrList.Add(NOTSET);
    cbBossScreenNumber.Items := TempStrList;
//    cbScreens.ItemIndex := cbScreens.Items.IndexOf(IntToHex(CVROM.GetStairScreen(StairID),2) );
    if CVROM.Levels[CVROM.Level].BossVal[CVROM.GetStageID] <> $FF then
    begin
      Found := False;
      for i := 0 to CVROM.Levels[CVROM.Level].Screens.Count - 1 do
      begin
        if CVROM.Levels[CVROM.Level].Screens[i].StageNumber = CVROM.GetStageID then
        begin
          if (CVROM.CurrLevel.BossVal[CVROM.GetStageID] and $F0) shl 4 = $1 then
          begin
            if (CVROM.CurrLevel.Screens[i].MultiAreaBit = True) and (CVROM.CurrLevel.Screens[i].ScreenNumber = CVROM.CurrLevel.BossVal[CVROM.GetStageID] and $0F) then
            begin
              cbBossScreenNumber.Itemindex := cbBossScreenNumber.Items.IndexOf(IntToHex(i,2));
              Found := True;
              break;
            end;
          end
          else
          begin
            if CVROM.CurrLevel.Screens[i].ScreenNumber = CVROM.CurrLevel.BossVal[CVROM.GetStageID] and $0F then
            begin
              cbBossScreenNumber.Itemindex := cbBossScreenNumber.Items.IndexOf(IntToHex(i,2));
              Found := True;
              break;
            end;
          end;
        end;
      end;
      if found = false then
        cbBossScreenNumber.Enabled := False
      else
        cbBossScreenNumber.Enabled := True;
    end
    else
      cbBossScreenNumber.Itemindex := cbBossScreenNumber.Items.IndexOf(NOTSET);
  finally
    FreeAndNil(TempStrList);
  end;
  txtTime.Text := IntToStr(CVROM.Levels[CVROM.Level].TimeVal[CVROM.GetStageID] * 100);
end;

procedure TfrmStageProperties.SaveStageProperties;
begin
  if cbBossScreenNumber.Items[cbBossScreenNumber.ItemIndex] = NOTSET then
    CVROM.Levels[CVROM.Level].BossVal[CVROM.GetStageID] := $FF
  else
  begin
    if cbBossScreenNumber.Enabled = True then
      CVROM.Levels[CVROM.Level].BossVal[CVROM.GetStageID] := CVROM.Levels[CVROM.Level].Screens[StrToInt('$' + cbBossScreenNumber.Items[cbBossScreenNumber.ItemIndex])].ScreenNumber;
  end;

  CVROM.Levels[CVROM.Level].TimeVal[CVROM.GetStageID] := StrToInt(txtTime.Text) div 100;

end;

procedure TfrmStageProperties.cmdOKClick(Sender: TObject);
begin
  SaveStageProperties;
end;

end.
