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

unit fROMProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,Spin;

type
  TfrmROMProperties = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    lblStartingHearts: TLabel;
    lblStartingLives: TLabel;
    lblSmallHeartValue: TLabel;
    lblBigHeartValue: TLabel;
    txtStartingHearts: TSpinEdit;
    txtStartingLives: TSpinEdit;
    txtSmallHeartVal: TSpinEdit;
    txtBigHeartVal: TSpinEdit;
    lblClockCost: TLabel;
    txtClockValue: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private


    procedure LoadStatistics;
    procedure SaveStatistics;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmROMProperties: TfrmROMProperties;

implementation

uses uglobal;

{$R *.dfm}

procedure TfrmROMProperties.LoadStatistics;
begin
  txtStartingHearts.Value := CVROM.Statistics.StartingHearts;
  txtStartingLives.Value := CVROM.Statistics.StartingLives;
  txtSmallHeartVal.Value := CVROM.Statistics.SmallHearts;
  txtBigHeartVal.Value := CVROM.Statistics.BigHearts;
  txtClockValue.Value := CVROM.Statistics.ClockCost;
end;

procedure TfrmROMProperties.SaveStatistics;
begin
  CVROM.Statistics.StartingHearts := txtStartingHearts.Value;
  CVROM.Statistics.StartingLives := txtStartingLives.Value;
  CVROM.Statistics.SmallHearts := txtSmallHeartVal.Value;
  CVROM.Statistics.BigHearts := txtBigHeartVal.Value;
  CVROM.Statistics.ClockCost := txtClockValue.Value;
end;

procedure TfrmROMProperties.FormShow(Sender: TObject);
begin
  LoadStatistics;
end;

procedure TfrmROMProperties.cmdOKClick(Sender: TObject);
begin
  SaveStatistics;
end;



end.
