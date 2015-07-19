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

unit fOpenDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, JCLShell,Buttons,shlobj, FileCtrl, JvExStdCtrls, JvListBox,
  JvDriveCtrls, JvCombobox;

type
  TfrmOpenDialog = class(TForm)
    lblFilter: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    cmdMyDocuments: TBitBtn;
    cmdDesktop: TBitBtn;
    cmdApplicationDirectory: TBitBtn;
    lblOpenAs: TLabel;
    cbDataFile: TComboBox;
    chkAutoCheckROMType: TCheckBox;
    DriveCombo: TJvDriveCombo;
    FileListBox: TJvFileListBox;
    DirectoryListBox: TJvDirectoryListBox;
    cbFilter: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FileListBoxDblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdMyDocumentsClick(Sender: TObject);
    procedure cmdMyComputerClick(Sender: TObject);
    procedure cmdDesktopClick(Sender: TObject);
    procedure cmdApplicationDirectoryClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbFilterChange(Sender: TObject);
  private
    procedure LoadDataFiles;
    { Private declarations }
  public
    Filename,OpenDir,DataFile : String;
    AutoCheck : Boolean;
    { Public declarations }
  end;

var
  frmOpenDialog: TfrmOpenDialog;

implementation

{$R *.dfm}

uses uglobal;

procedure TfrmOpenDialog.FormShow(Sender: TObject);
begin
  LoadDataFiles();
  chkAutoCheckROMType.Checked := StakeOptions.AutoCheck;
  cbDataFile.ItemIndex := cbDataFile.Items.IndexOf(StakeOptions.DataFileName);
  DirectoryListBox.Directory := OpenDir;
//  sdpOpen.InitialDir := OpenDir;
end;

procedure TfrmOpenDialog.FileListBoxDblClick(Sender: TObject);
begin
//  Filename := FileListBox.FileName;
//  modalresult := mrOk;
end;

procedure TfrmOpenDialog.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    close;
end;

procedure TfrmOpenDialog.cmdOKClick(Sender: TObject);
begin
  if FileExists(FileListBox.Filename) = true then
  begin
    Filename := FileListBox.Filename;
    DataFile := ExtractFileDir(Application.ExeName) + '\Data\' + cbDataFile.Items[cbDataFile.ItemIndex];
    AutoCheck := chkAutoCheckROMType.Checked;
    modalresult := mrOK;
  end
  else
    messagebox(handle,'Please select a valid file.',PChar(Application.Title),0);
end;

procedure TfrmOpenDialog.cmdMyDocumentsClick(Sender: TObject);
begin
  DirectoryListBox.Directory := GetSpecialFolderLocation(CSIDL_PERSONAL);

end;

procedure TfrmOpenDialog.cmdMyComputerClick(Sender: TObject);
begin
  DirectoryListBox.Directory := GetSpecialFolderLocation(CSIDL_DRIVES);
end;

procedure TfrmOpenDialog.cmdDesktopClick(Sender: TObject);
begin
  DirectoryListBox.Directory := GetSpecialFolderLocation(CSIDL_DESKTOP);
end;

procedure TfrmOpenDialog.cmdApplicationDirectoryClick(Sender: TObject);
begin
  DirectoryListBox.Directory := ExtractFileDir(Application.ExeName);
end;

procedure TfrmOpenDialog.LoadDataFiles();
begin
  cbDataFile.Items.Clear;
  cbDataFile.Items.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\data.dat');
end;

procedure TfrmOpenDialog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    DriveCombo.Refresh;
    directorylistbox.Refresh;
    FileListBox.Refresh;
  end;
end;

procedure TfrmOpenDialog.cbFilterChange(Sender: TObject);
begin
  if cbFilter.ItemIndex = 0 then
    FileListBox.Mask := '*.nes'
  else
    FileListBox.Mask := '*.*';
end;

end.
