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

unit fImportLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmImportLevel = class(TForm)
    lblExportFilename: TLabel;
    txtFilename: TEdit;
    cmdBrowse: TButton;
    cmdImport: TButton;
    cmdCancel: TButton;
    OpenDialog: TOpenDialog;
    procedure cmdBrowseClick(Sender: TObject);
    procedure cmdImportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportLevel: TfrmImportLevel;

implementation

{$R *.dfm}

uses uglobal;


procedure TfrmImportLevel.cmdBrowseClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    if OpenDialog.FileName <> '' then
    begin
      txtFilename.Text := OpenDialog.FileName;
      txtFilename.SelStart := Length(txtFilename.Text);
    end;
  end;
end;

procedure TfrmImportLevel.cmdImportClick(Sender: TObject);
begin
  if FileExists(txtFilename.text) = True then
  begin
    CVROM.ImportLevel(txtFilename.Text);
    messagebox(handle,'Level exported.',PChar(Application.Title),0);    
  end
  else
  begin
    showmessage('Please specify a file that actually exists.');
    ModalResult := mrNone;
  end;
end;

end.
