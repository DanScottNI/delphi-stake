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

unit fDamageSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32_Image, GR32;

type
  TfrmDamageSettings = class(TForm)
    lblStage1to6: TLabel;
    lblStage7to11: TLabel;
    lblStage12Plus: TLabel;
    imgStage1to6: TImage32;
    imgStage7to11: TImage32;
    imgStage12Plus: TImage32;
    cmdStage1to6Down: TButton;
    cmdStage7to11Down: TButton;
    cmdStage12plusDown: TButton;
    cmdStage1to6Up: TButton;
    cmdStage7to11Up: TButton;
    cmdStage12PlusUp: TButton;
    Bitmap32List: TBitmap32List;
    cmdOk: TButton;
    cmdCancel: TButton;
    lblMeatEnergy: TLabel;
    cmdMeatDown: TButton;
    imgMeat: TImage32;
    cmdMeatUp: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOkClick(Sender: TObject);
    procedure cmdStage1to6UpClick(Sender: TObject);
    procedure cmdStage1to6DownClick(Sender: TObject);
    procedure cmdStage7to11DownClick(Sender: TObject);
    procedure cmdStage12plusDownClick(Sender: TObject);
    procedure cmdStage7to11UpClick(Sender: TObject);
    procedure cmdStage12PlusUpClick(Sender: TObject);
    procedure cmdMeatDownClick(Sender: TObject);
    procedure cmdMeatUpClick(Sender: TObject);
  private
    _Stage1to6 : Byte;
    _Stage7to11 : Byte;
    _Stage12Plus : Byte;
    _Meat : Byte;
    procedure DrawDamage;
    procedure LoadDamage;
    procedure SaveDamage;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDamageSettings: TfrmDamageSettings;

implementation

{$R *.dfm}

uses uglobal;

procedure TfrmDamageSettings.LoadDamage();
begin
  _Stage1to6 := CVROM.Damage.Stage1to6 div 4;
  _Stage7to11 := CVROM.Damage.Stage7to11 div 4;
  _Stage12Plus := CVROM.Damage.Stage12plus div 4;
  _Meat := CVROM.Damage.Meat div 4;
end;

procedure TfrmDamageSettings.SaveDamage();
begin
  CVROM.Damage.Stage1to6 := _Stage1to6 * 4;
  CVROM.Damage.Stage7to11 := _Stage7to11 * 4;
  CVROM.Damage.Stage12plus := _Stage12Plus * 4;
  CVROM.Damage.Meat := _Meat * 4;
end;

procedure TfrmDamageSettings.DrawDamage();
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Height := 12;
    TempBitmap.Width := 96;
    // Draw the stage 1 to 6 damage
    for i := 0 to 15 - _Stage1to6 do
      tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
    if _Stage1to6 > 0 then
      for i := 16 - _Stage1to6 to 15 do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

    imgStage1to6.Bitmap := TempBitmap;

    // Draw the stage 7 to 11 damage
    for i := 0 to 15 - _Stage7to11 do
      tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
    if _Stage7to11 > 0 then
      for i := 16 - _Stage7to11 to 15 do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

    imgStage7to11.Bitmap := TempBitmap;

    // Draw the stage 12 plus damage
    for i := 0 to 15 - _Stage12Plus do
      tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
    if _Stage12Plus > 0 then
      for i := 16 - _Stage12Plus to 15 do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

    imgStage12Plus.Bitmap := TempBitmap;

    // Draw the meat replenishment
    for i := 0 to 15 do
      tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);
    if _Meat > 0 then
      for i := 0 to _Meat-1 do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);


    imgMeat.Bitmap := TempBitmap;

  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmDamageSettings.FormShow(Sender: TObject);
begin
  LoadDamage;
  DrawDamage;
end;

procedure TfrmDamageSettings.cmdOkClick(Sender: TObject);
begin
  SaveDamage;
end;

procedure TfrmDamageSettings.cmdStage1to6UpClick(Sender: TObject);
begin
  if _Stage1to6 > 0 then
    dec(_Stage1to6);
  DrawDamage;
end;

procedure TfrmDamageSettings.cmdStage1to6DownClick(Sender: TObject);
begin
  if _Stage1to6 < 16 then
    inc(_Stage1to6);
  DrawDamage;
end;

procedure TfrmDamageSettings.cmdStage7to11DownClick(Sender: TObject);
begin
  if _Stage7to11 < 16 then
    inc(_Stage7to11);
  DrawDamage;
end;

procedure TfrmDamageSettings.cmdStage12plusDownClick(Sender: TObject);
begin
  if _Stage12plus < 16 then
    inc(_Stage12plus);
  DrawDamage;
end;

procedure TfrmDamageSettings.cmdStage7to11UpClick(Sender: TObject);
begin
  if _Stage7to11 > 0 then
    dec(_Stage7to11);
  DrawDamage;
end;

procedure TfrmDamageSettings.cmdStage12PlusUpClick(Sender: TObject);
begin
  if _Stage12plus > 0 then
    dec(_Stage12plus);
  DrawDamage;
end;

procedure TfrmDamageSettings.cmdMeatDownClick(Sender: TObject);
begin
  if _Meat > 0 then
    dec(_Meat);
  DrawDamage;
end;

procedure TfrmDamageSettings.cmdMeatUpClick(Sender: TObject);
begin
  if _Meat < 16 then
    inc(_Meat);
  DrawDamage;

end;

end.
