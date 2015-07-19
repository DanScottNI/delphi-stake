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

unit fSelectMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, GR32, GR32_Layers, ComCtrls;

type
  TfrmSelectScreen = class(TForm)
    imgMap: TImage32;
    StatusBar: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure imgMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgMapMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
  private
    procedure DrawMap;
    { Private declarations }
  public
    NewScreen : Integer;
    { Public declarations }
  end;

var
  frmSelectScreen: TfrmSelectScreen;

implementation

{$R *.dfm}

uses uglobal;

procedure TfrmSelectScreen.DrawMap();
var
  MapBitmap : TBitmap32;
begin
  MapBitmap := TBitmap32.Create;
  try
//    MapBitmap.Width := 64 + CVROM.MapWidth * 32;
//    MapBitmap.Height := 64 + CVROM.MapHeight * 32;
    MapBitmap.Width := CVROM.MapWidth * 32;
    MapBitmap.Height := CVROM.MapHeight * 32;
    ClientHeight := MapBitmap.Height + 19;
    ClientWidth := MapBitmap.Width;
    CVROM.DrawMap(MapBitmap);
    imgMap.Bitmap := MapBitmap;

  finally
    FreeAndNil(MapBitmap);
  end;
end;

procedure TfrmSelectScreen.FormShow(Sender: TObject);
begin
  DrawMap;
end;

procedure TfrmSelectScreen.imgMapMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  NewScreen := CVROM.Map[X div 32,Y div 32];
  if NewScreen < $FF then
    ModalResult := mrOk
  else
    beep;
end;

procedure TfrmSelectScreen.imgMapMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if CVROM.Map[X div 32,Y div 32] < $FF then
    Statusbar.Panels[0].Text := 'Screen Number: ' + IntToHex(CVROM.Map[X div 32,Y div 32],2)
  else
    Statusbar.Panels[0].Text := 'No Screen.';
end;

end.
