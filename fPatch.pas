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

unit fPatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, cCVROM;

type
  TfrmPatches = class(TForm)
    lvwROMPatches: TListView;
    cmdApply: TButton;
    cmdOk: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdApplyClick(Sender: TObject);
  private
    _SPFPatchesDir : String;
    procedure LoadSPFFiles;
    procedure LoadPatchList(pStringList: TStringList);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPatches: TfrmPatches;

implementation

{$R *.dfm}

uses uglobal, cMisc;

procedure TfrmPatches.FormShow(Sender: TObject);
begin
  _SPFPatchesDir := ExtractFileDir(Application.ExeName) + '\Patches\' + CVROM.SPFFolder;
  LoadSPFFiles;
end;

procedure TfrmPatches.LoadSPFFiles();
var
  ROMPatches : TStringList;
  i : INteger;
  Patch : TPatch;

begin
  lvwROMPatches.Items.BeginUpdate;
  lvwROMPatches.Items.Clear;
  if DirectoryExists(_SPFPatchesDir) =  true then
  begin

    ROMPatches := TStringList.Create;

    LoadPatchList(ROMPatches);
//    ROMPatches.LoadFromFile(SPFPatchesDat);
    for i := 0 to ROMPatches.Count -1 do
    begin
      with lvwROMPatches.Items.Add do
      begin
        Patch := TPatch.Create(ExtractFileDir(Application.ExeName) + '\Patches\' + CVROM.SPFFolder + '\' + ROMPatches[i]);
        try
          Caption := Patch.PatchTitle;
          SubItems.Add(Patch.PatchDescription);
        finally
          FreeAndNil(Patch);
        end;
      end;
    end;

  end;
  lvwROMPatches.Items.EndUpdate;
end;

procedure TfrmPatches.LoadPatchList(pStringList : TStringList);
var
  sr: TSearchRec;
begin
  if FindFirst(_SPFPatchesDir + '\*.spf', faAnyFile, sr) = 0 then
  begin
    repeat
      pStringList.Add(sr.Name);

    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TfrmPatches.cmdApplyClick(Sender: TObject);
var
  ROMPatches : TStringList;
  Patch : TPatch;
begin
  ROMPatches := TStringList.Create;
  LoadPatchList(ROMPatches);
  Patch := TPatch.Create(ExtractFileDir(Application.ExeName) + '\Patches\' + CVROM.SPFFolder + '\' + ROMPatches[lvwROMPatches.ItemIndex]);
  try
    Patch.Execute;
  finally
    FreeAndNil(Patch);
    FreeAndNil(ROMPatches);
  end;
  showmessage('Patch completed.');
end;

end.
