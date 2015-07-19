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

unit fMusicPointers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmMusicPointer = class(TForm)
    lblTrackName: TLabel;
    cbTrackName: TComboBox;
    lblMusic: TLabel;
    chkAdvancedEditing: TCheckBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    chkgrpAdvEditing: TGroupBox;
    lblSquare1: TLabel;
    lblSquare2: TLabel;
    lblTriangle: TLabel;
    txtSquare1: TEdit;
    txtSquare2: TEdit;
    txtTriangle: TEdit;
    cbMusic: TComboBox;
    cmdSet: TButton;
    procedure FormShow(Sender: TObject);
    procedure cbMusicChange(Sender: TObject);
    procedure cmdSetClick(Sender: TObject);
  private
    CurPointer : Byte;
    procedure LoadPointerNames;
    procedure LoadPointerValues;
    procedure SavePointerValues;
    procedure FindMusicTemplate;
    procedure LoadTemplateNames;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMusicPointer: TfrmMusicPointer;

implementation

{$R *.dfm}

uses uglobal;

procedure TfrmMusicPointer.LoadTemplateNames;
var
  i : Integer;
begin
  cbTrackName.Items.Clear;
  for i := 0 to CVROM.MusicPointersTemplate.Count - 1 do
    cbTrackName.Items.Add(CVROM.MusicPointersTemplate[i].Name);
  cbTrackName.ItemIndex := 0;

end;

procedure TfrmMusicPointer.LoadPointerNames;
var
  i : Integer;
begin
  cbMusic.Items.Clear;
  for i := 0 to CVROM.MusicPointers.Count - 1 do
    cbMusic.Items.Add(CVROM.MusicPointers[i].Name);
  cbMusic.ItemIndex := 0;
  CurPointer := 0;
end;

procedure TfrmMusicPointer.LoadPointerValues;
begin
  txtSquare1.Text := IntToHex(CVROM.MusicPointers[CurPointer].Square1,4);
  txtSquare2.Text := IntToHex(CVROM.MusicPointers[CurPointer].Square2,4);
  txtTriangle.Text := IntToHex(CVROM.MusicPointers[CurPointer].Triangle,4);
end;

procedure TfrmMusicPointer.FormShow(Sender: TObject);
begin
  LoadTemplateNames;
  LoadPointerNames;
  LoadPointerValues;
  FindMusicTemplate;
end;

procedure TfrmMusicPointer.cbMusicChange(Sender: TObject);
begin
  SavePointerValues;
  CurPointer := cbMusic.ItemIndex;
  LoadPointerValues;
  FindMusicTemplate;
end;

procedure TfrmMusicPointer.FindMusicTemplate;
var
  i : Integer;
begin
  cbTrackName.ItemIndex := -1;
  for i := 0 to cvrom.MusicPointersTemplate.Count - 1 do
  begin
    if IntToHex(CVROM.MusicPointersTemplate[i].Square1,4) = txtSquare1.Text then
    begin
      if IntToHex(CVROM.MusicPointersTemplate[i].Square1,4) = txtSquare1.Text then
      begin
        if IntToHex(CVROM.MusicPointersTemplate[i].Square1,4) = txtSquare1.Text then
        begin
          cbTrackName.ItemIndex := i;
          break;
        end;
      end;
    end;
  end;
end;

procedure TfrmMusicPointer.SavePointerValues;
begin
  CVROM.MusicPointers[CurPointer].Square1 := StrToInt('$' + txtSquare1.Text);
  CVROM.MusicPointers[CurPointer].Square2 := StrToInt('$' + txtSquare2.Text);
  CVROM.MusicPointers[CurPointer].Triangle := StrToInt('$' + txtTriangle.Text);
end;

procedure TfrmMusicPointer.cmdSetClick(Sender: TObject);
begin
  CVROM.MusicPointers[CurPointer].Square1 := CVROM.MusicPointersTemplate[cbTrackName.ItemIndex].Square1;
  CVROM.MusicPointers[CurPointer].Square2 := CVROM.MusicPointersTemplate[cbTrackName.ItemIndex].Square2;
  CVROM.MusicPointers[CurPointer].Triangle := CVROM.MusicPointersTemplate[cbTrackName.ItemIndex].Triangle;
  LoadPointerValues;
  FindMusicTemplate;  
end;

end.
