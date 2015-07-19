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

unit fAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi;

type
  TfrmAbout = class(TForm)
    cmdOK: TButton;
    lblDansSpace: TLabel;
    grpStake: TGroupBox;
    lblDescription: TLabel;
    lblSpecialThanks1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lblDansSpaceClick(Sender: TObject);
    procedure lblDansSpaceMouseLeave(Sender: TObject);
    procedure lblDansSpaceMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

uses uglobal;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  Caption := 'About ' + APPLICATIONNAME;
  grpStake.Caption := APPLICATIONNAME;
end;

procedure TfrmAbout.lblDansSpaceClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', PChar('http://dan.panicus.org'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmAbout.lblDansSpaceMouseLeave(Sender: TObject);
begin
  lblDansSpace.Font.Style := [];
end;

procedure TfrmAbout.lblDansSpaceMouseEnter(Sender: TObject);
begin
  lblDansSpace.Font.Style := [fsUnderline];
end;

end.
