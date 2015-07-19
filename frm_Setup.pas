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

unit frm_Setup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,iNESImage, clipbrd;

type
  TfrmSetupStake = class(TForm)
    lblPalette: TLabel;
    cbPaletteFile: TComboBox;
    cbDataFile: TComboBox;
    lblDatafile: TLabel;
    cmdOK: TButton;
    cmdGuessROM: TButton;
    OpenDialog: TOpenDialog;
    lblWelcome: TLabel;
    lblWelText: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdGuessROMClick(Sender: TObject);
  private
    _Palette : String;
    _DataFilename : String;
    procedure LoadDataFiles;
    procedure LoadPaletteFiles;
    { Private declarations }
  public
    property Palette : String read _Palette write _Palette;
    property DataFilename : String read _DataFilename write _DataFilename;
    { Public declarations }
  end;

var
  frmSetupStake: TfrmSetupStake;

implementation

{$R *.dfm}

procedure TfrmSetupStake.FormShow(Sender: TObject);
begin
//  cbDataFile.Items.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\data.dat');

//  cbPaletteFile.Items.LoadFromFile(ExtractFileDir(Application.Exename) + '\Palettes\pal.dat');
  LoadDataFiles();
  LoadPaletteFiles();
  cbDataFile.ItemIndex := 0;
  cbPaletteFile.ItemIndex := 0;
end;

  // Set
procedure TfrmSetupStake.cmdOKClick(Sender: TObject);
begin
  _Palette := cbPaletteFile.Items[cbPaletteFile.ItemIndex];
  _DataFilename := cbDataFile.Items[cbDataFile.ItemIndex];
end;

procedure TfrmSetupStake.LoadDataFiles();
{var
  sr: TSearchRec;}
begin

{  cbDataFile.Items.Clear;

  if FindFirst(ExtractFileDir(Application.ExeName)+ '\Data\*.ini', faAnyFile, sr) = 0 then
  begin
    repeat
      cbDataFile.Items.Add(sr.Name);

    until FindNext(sr) <> 0;
    FindClose(sr);
  end;}

  cbDataFile.Items.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\data.dat');
end;

procedure TfrmSetupStake.LoadPaletteFiles();
var
  sr: TSearchRec;
begin

  cbPaletteFile.Items.Clear;

  if FindFirst(ExtractFileDir(Application.ExeName)+ '\Palettes\*.pal', faAnyFile, sr) = 0 then
  begin
    repeat
      cbPaletteFile.Items.Add(sr.Name);

    until FindNext(sr) <> 0;
    FindClose(sr);
  end;

//  cbPaletteFile.Items.LoadFromFile(ExtractFileDir(Application.Exename) + '\Palettes\pal.dat');
end;


procedure TfrmSetupStake.cmdGuessROMClick(Sender: TObject);
var
  ROM : TiNESImage;
  CRC32 : LongWord;
  CRCs : TStringList;
begin
  if OpenDialog.Execute then
  begin
    if FileExists(OpenDialog.FileName) =  true then
    begin
      ROM := TiNESImage.Create(OpenDialog.FileName);
      try
        CRC32 := ROM.CRC32;
        CRCs := TStringList.Create;
        CRCs.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\crc32.dat');
        cbDataFile.ItemIndex := CRCs.IndexOf(IntToHex(CRC32,8));
        if cbDataFile.ItemIndex = -1 then
        begin
          messagebox(handle,'Stake does not know what type of ROM your ROM is.',PChar(Application.Title),0);
          cbDataFile.ItemIndex := 0;
        end;
      finally
        FreeAndNil(ROM);
        FreeAndNil(CRCs);
      end;
    end;
  end;
end;

end.
