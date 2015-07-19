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

unit fEnemyPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, GR32, GR32_Layers;

type
  TfrmEnemyPreview = class(TForm)
    Bitmap32List: TBitmap32List;
    imgLevel: TImage32;
    procedure FormShow(Sender: TObject);
    procedure imgLevelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
  private
    procedure DrawEnemyPreview;
    { Private declarations }
  public
    EnemyID : Byte;
    { Public declarations }
  end;

var
  frmEnemyPreview: TfrmEnemyPreview;

implementation

{$R *.dfm}

uses uglobal;

procedure TfrmEnemyPreview.DrawEnemyPreview;
var
  LevelBMP : TBitmap32;
  NumbersBMP : TBitmap32;
begin
  LevelBMP := TBitmap32.Create;
  try

    LevelBMP.Height := 192;
    LevelBMP.Width := 256;

    CVROM.DrawCurrentScreen(LevelBMP,Bitmap32List,0);

    // Draw the enemy
    if FileExists(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp') =  true then
    begin
      NumbersBMP := TBitmap32.Create;
      try
        NumbersBMP.Width := 136;
        NumbersBMP.Height := 8;
        NumbersBMP.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp');
        LevelBMP.Draw(bounds(128,CVROM.Enemies[EnemyID].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(EnemyID,2)[1])*8,0,8,8),NumbersBMP);
        LevelBMP.Draw(bounds(136,CVROM.Enemies[EnemyID].Y-$20,8,8),Bounds(StrToInt('$' + IntToHex(EnemyID,2)[2])*8,0,8,8),NumbersBMP);
      finally
        FreeAndNil(NumbersBMP);
      end;
    end;

    imgLevel.Bitmap := LevelBMP;

  finally
    FreeAndNil(LevelBMP);
  end;


end;

procedure TfrmEnemyPreview.FormShow(Sender: TObject);
begin
  DrawEnemyPreview;
end;

procedure TfrmEnemyPreview.imgLevelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  ModalResult := mrOK;
end;

end.
