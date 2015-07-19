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

unit fExportLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmExportLevel = class(TForm)
    lblExportFilename: TLabel;
    lblLevelToExport: TLabel;
    txtFilename: TEdit;
    cbLevels: TComboBox;
    SaveDialog: TSaveDialog;
    cmdBrowse: TButton;
    cmdExport: TButton;
    cmdCancel: TButton;
    grpExportFollowing: TGroupBox;
    chkEnemyData: TCheckBox;
    chkLevelData: TCheckBox;
    chkTSA: TCheckBox;
    chkPalette: TCheckBox;
    chkGraphics: TCheckBox;
    procedure cmdBrowseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdExportClick(Sender: TObject);
  private
    procedure LevelNames;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportLevel: TfrmExportLevel;

implementation

{$R *.dfm}

uses uglobal;

procedure TfrmExportLevel.cmdBrowseClick(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    if SaveDialog.FileName <> '' then
    begin
      txtFilename.Text := SaveDialog.FileName;
      txtFilename.SelStart := Length(txtFilename.Text);
    end;
  end;
end;

procedure TfrmExportLevel.LevelNames();
var
  StrList : TStringList;
begin
  cbLevels.Items.Clear;
  StrList := TStringList.Create;
  try
    CVROM.LevelName(StrList);
    cbLevels.Items := StrList;
  finally
    FreeAndNil(StrList);
  end;
  cbLevels.ItemIndex := 0;
end;

procedure TfrmExportLevel.FormShow(Sender: TObject);
begin
  LevelNames();
end;

procedure TfrmExportLevel.cmdExportClick(Sender: TObject);
var
  TempAllow : Byte;
begin
  TempAllow := 0;
  if txtFilename.Text <> '' then
  begin
    if chkLevelData.Checked = True then
      TempAllow := TempAllow + 1;
    if chkTSA.Checked = True then
      TempAllow := TempAllow + 2;
    if chkGraphics.Checked = True then
      TempAllow := TempAllow + 4;
    if chkPalette.Checked = True then
      TempAllow := TempAllow + 8;
    if chkEnemyData.Checked = True then
      TempAllow := TempAllow + 16;

    CVROM.ExportLevel(txtFilename.Text,cbLevels.ItemIndex, TempAllow);
    messagebox(handle,'Level exported.',PChar(Application.Title),0);
  end
  else
  begin
    ModalResult := mrNone;
    showmessage('Please enter a filename.');
  end;
end;

end.
