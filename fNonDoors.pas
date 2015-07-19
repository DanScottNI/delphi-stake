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

unit fNonDoors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmNonDoorOpt = class(TForm)
    lblWalkToX: TLabel;
    lblXPosDoor: TLabel;
    txtWalkToX: TEdit;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _DoorID : Integer;
    procedure LoadDoorProperties;
    procedure SaveDoorProperties;
    { Private declarations }
  public
    property DoorID : Integer read _DoorID write _DoorID;
    { Public declarations }
  end;

var
  frmNonDoorOpt: TfrmNonDoorOpt;

implementation
uses uglobal;

{$R *.dfm}

procedure TfrmNonDoorOpt.LoadDoorProperties;
begin
  lblXPosDoor.Caption := 'Current X Position of Door: ' + IntToHex(CVROM.Levels[CVROM.Level].NonStandardDoors[_DoorID].X + 8,2);
  txtWalkToX.Text := IntToHex(CVROM.Levels[CVROM.Level].NonStandardDoors[_DoorID].WalkToX,2);
end;

procedure TfrmNonDoorOpt.SaveDoorProperties;
begin
  CVROM.Levels[CVROM.Level].NonStandardDoors[_DoorID].WalkToX := StrToInt('$' + txtWalkToX.Text)
end;

procedure TfrmNonDoorOpt.FormShow(Sender: TObject);
begin
  LoadDoorProperties;
end;

procedure TfrmNonDoorOpt.cmdOKClick(Sender: TObject);
begin
  SaveDoorProperties;

end;

end.
