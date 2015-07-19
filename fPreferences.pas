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

unit fPreferences;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, GR32_Image, GR32, ComCtrls;

type
  TfrmPreferences = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    OpenDialog: TOpenDialog;
    cmdRestoreDefaults: TButton;
    ColorDialog: TColorDialog;
    pgcSettings: TPageControl;
    tshGeneral: TTabSheet;
    tshDisplay: TTabSheet;
    tshEmulatorSettings: TTabSheet;
    tshIPS: TTabSheet;
    cbDataFile: TComboBox;
    lblDatafile: TLabel;
    lblPalette: TLabel;
    cbPaletteFile: TComboBox;
    chkBackupFiles: TCheckBox;
    chkAutoCheck: TCheckBox;
    rdgWhenIncorrectMapper: TRadioGroup;
    chkSetObjMode: TCheckBox;
    chkShowLeftMidText: TCheckBox;
    lblLeftTextColour: TLabel;
    lblMiddleTextColour: TLabel;
    imgRightText: TImage32;
    imgLeftText: TImage32;
    cmdBrowseLeft: TButton;
    cmdBrowseRight: TButton;
    chkShowGridlinesByDefault: TCheckBox;
    lblGridlineColour: TLabel;
    imgGridlineColour: TImage32;
    cmdBrowseGridlines: TButton;
    txtEmulatorPath: TEdit;
    lblEmulatorPath: TLabel;
    cmdBrowse: TButton;
    chkDisplayEmulatorSaveWarning: TCheckBox;
    txtIconTransparency: TSpinEdit;
    lblIconTransparency: TLabel;
    chkDrawTransparentIcons: TCheckBox;
    lblOriginalFile: TLabel;
    lblSaveAsIPS: TLabel;
    txtOriginalROMFilename: TEdit;
    txtSaveAsIPS: TEdit;
    lblIPSNoteSaveAs: TLabel;
    cmdBrowseIPSSaveAs: TButton;
    cmdIPSBrowse: TButton;
    grpPatching: TGroupBox;
    imgLunarIPS: TImage;
    lblLunarCompress: TLabel;
    lblFuSoYa: TLabel;
    rdgEmuFileSettings: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdBrowseClick(Sender: TObject);
    procedure cmdRestoreDefaultsClick(Sender: TObject);
    procedure cmdBrowseLeftClick(Sender: TObject);
    procedure cmdBrowseRightClick(Sender: TObject);
    procedure cmdBrowseGridlinesClick(Sender: TObject);
  private
    procedure LoadSettings;
    procedure LoadDataFiles;
    procedure LoadPaletteFiles;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreferences: TfrmPreferences;

implementation

uses uglobal, ulunarcompress;

{$R *.dfm}

procedure TfrmPreferences.FormShow(Sender: TObject);
begin
  if CVROM = nil then
  begin
    cbDataFile.Enabled := True;
    lblDataFile.Enabled := True;
  end
  else
  begin
    cbDataFile.Enabled := False;
    lblDataFile.Enabled := False;
  end;

  LoadPaletteFiles();
  LoadDataFiles();

  lblLunarCompress.Caption := 'Lunar Compress.dll v'+ FloatToStr(LunarVersion / 100);
  LoadSettings;
end;

procedure TfrmPreferences.LoadDataFiles();
{var
  sr: TSearchRec;}
begin

  cbDataFile.Items.Clear;

  {if FindFirst(ExtractFileDir(Application.ExeName)+ '\Data\*.ini', faAnyFile, sr) = 0 then
  begin
    repeat
      cbDataFile.Items.Add(sr.Name);

    until FindNext(sr) <> 0;
    FindClose(sr);
  end;}

  cbDataFile.Items.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\data.dat');
end;

procedure TfrmPreferences.LoadPaletteFiles();
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

procedure TfrmPreferences.LoadSettings();
begin
  cbDataFile.ItemIndex := cbDataFile.Items.IndexOf(StakeOptions.DataFileName);
  cbPaletteFile.ItemIndex := cbPaletteFile.Items.IndexOf(StakeOptions.Palette);
  if cbPaletteFile.ItemIndex = -1 then
    cbPaletteFile.ItemIndex := 0;
  imgLeftText.Color := WinColor(StakeOptions.LeftTextColour);
  imgRightText.Color := WinColor(StakeOptions.MiddleTextColour);
  imgGridlineColour.Color := WinColor(StakeOptions.GridlineColour);
  chkShowLeftMidText.Checked := StakeOptions.DispLeftMidText;
  chkShowGridlinesByDefault.Checked := StakeOptions.GridlinesOnByDefault;
  chkBackupFiles.Checked := StakeOptions.BackupFilesWhenSaving;
  chkDisplayEmulatorSaveWarning.Checked := StakeOptions.EmulatorDisplaySaveWarning;
  rdgEmuFileSettings.ItemIndex := StakeOptions.EmulatorFilenameSettings;
  txtEmulatorPath.Text := StakeOptions.EmulatorPath;
  chkDrawTransparentIcons.Checked := StakeOptions.DrawTransparentIcons;
  txtIconTransparency.Value := StakeOptions.IconTransparency;
  chkSetObjMode.Checked := StakeOptions.SetObjectEditingOnWhenAddingNewStair;

  rdgWhenIncorrectMapper.ItemIndex := StakeOptions.MapperWarnings;
  chkAutoCheck.Checked := StakeOptions.AutoCheck;
end;

procedure TfrmPreferences.cmdOKClick(Sender: TObject);
begin
  StakeOptions.DataFileName := cbDataFile.Items[cbDataFile.ItemIndex];
  StakeOptions.Palette := cbPaletteFile.Items[cbPaletteFile.ItemIndex];
  StakeOptions.LeftTextColour := Color32(imgLeftText.Color);
  StakeOptions.MiddleTextColour := Color32(imgRightText.Color);
  StakeOptions.GridlineColour := Color32(imgGridlineColour.Color);
  StakeOptions.DispLeftMidText := chkShowLeftMidText.Checked;
  StakeOptions.GridlinesOnByDefault := chkShowGridlinesByDefault.Checked;
  StakeOptions.BackupFilesWhenSaving := chkBackupFiles.Checked;
  StakeOptions.EmulatorDisplaySaveWarning := chkDisplayEmulatorSaveWarning.Checked;
  StakeOptions.EmulatorFilenameSettings := rdgEmuFileSettings.ItemIndex;
  StakeOptions.EmulatorPath := txtEmulatorPath.Text;
  StakeOptions.DrawTransparentIcons := chkDrawTransparentIcons.Checked;
  StakeOptions.IconTransparency := txtIconTransparency.Value;
  StakeOptions.SetObjectEditingOnWhenAddingNewStair := chkSetObjMode.Checked;

  StakeOptions.MapperWarnings :=rdgWhenIncorrectMapper.ItemIndex;
  StakeOptions.AutoCheck := chkAutoCheck.Checked;
end;

procedure TfrmPreferences.cmdBrowseClick(Sender: TObject);
begin
  if (txtEmulatorPath.Text <> '') and (DirectoryExists(ExtractFileDir(txtEmulatorPath.Text))) then
    OpenDialog.InitialDir := ExtractFileDir(txtEmulatorPath.Text);

  if OpenDialog.Execute then
  begin
    if (OpenDialog.FileName <> '') and (FileExists(OpenDialog.Filename)) then
      txtEmulatorPath.Text := OpenDialog.FileName;
  end;
end;

procedure TfrmPreferences.cmdRestoreDefaultsClick(Sender: TObject);
begin
  StakeOptions.LoadDefaultSettings;
  StakeOptions.Save;
  LoadSettings;
end;

procedure TfrmPreferences.cmdBrowseLeftClick(Sender: TObject);
begin
  ColorDialog.Color := imgLeftText.Color;
  if ColorDialog.Execute then
  begin
    imgLeftText.Color := ColorDialog.Color;
  end;
end;

procedure TfrmPreferences.cmdBrowseRightClick(Sender: TObject);
begin
  ColorDialog.Color := imgRightText.Color;
  if ColorDialog.Execute then
  begin
    imgRightText.Color := ColorDialog.Color;
  end;
end;

procedure TfrmPreferences.cmdBrowseGridlinesClick(Sender: TObject);
begin
  ColorDialog.Color := imgGridlineColour.Color;
  if ColorDialog.Execute then
  begin
    imgGridlineColour.Color := ColorDialog.Color;
  end;
end;

end.
