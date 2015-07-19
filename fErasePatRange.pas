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

unit fErasePatRange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmErasePatRange = class(TForm)
    lblStartTileID: TLabel;
    txtStartTile: TEdit;
    txtEndTile: TEdit;
    lblEndTileID: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure cmdOKClick(Sender: TObject);
  private
    _Mode : Byte;
    { Private declarations }
  public
    property Mode : Byte read _Mode write _Mode;
    { Public declarations }
  end;

var
  frmErasePatRange: TfrmErasePatRange;

implementation

{$R *.dfm}

uses uglobal;

const
  MODELEVEL = 0;
  MODETITLESCREEN = 1;
  MODEINTRO = 2;
  MODEENDING = 3;

procedure TfrmErasePatRange.cmdOKClick(Sender: TObject);
var
  i : Integer;
begin
  if StrToInt('$' + txtStartTile.Text) > StrToInt('$' + txtEndTile.Text) then
  begin
    showmessage('Please make the start tile, a lower number than the end tile.');
    modalresult := mrNone;
    exit;
  end;

  if _Mode = MODELEVEL then
  begin
    for i := StrToInt('$' + txtStartTile.Text) to StrToInt('$' + txtEndTile.Text) do
      CVROM.eraseTile(i);
  end
  else if _Mode = MODETITLESCREEN then
  begin
    for i := StrToInt('$' + txtStartTile.Text) to StrToInt('$' + txtEndTile.Text) do
      CVROM.TitleScreen.eraseTile(i);
  end
  else if _Mode = MODEINTRO then
  begin
    for i := StrToInt('$' + txtStartTile.Text) to StrToInt('$' + txtEndTile.Text) do
      CVROM.CastleIntro.eraseTile(i);
  end
  else if _Mode = MODEENDING then
  begin
    for i := StrToInt('$' + txtStartTile.Text) to StrToInt('$' + txtEndTile.Text) do
      CVROM.Ending.eraseTile(i);
  end;
end;

end.
