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

unit fGlobalEnemyDataEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmGlobalEnemyDataEditor = class(TForm)
    lvwGlobalEnemyData: TListView;
    lblEnemyItemDropped: TLabel;
    lblX: TLabel;
    cbEnemyItemDropped: TComboBox;
    txtX: TEdit;
    lblY: TLabel;
    txtY: TEdit;
    cmdOK: TButton;
    cmdPreview: TButton;
    cmdSet: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure lvwGlobalEnemyDataClick(Sender: TObject);
    procedure cmdPreviewClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdSetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure PopulateListview;
    { Private declarations }
  public
    ID : Integer;
    { Public declarations }
  end;

var
  frmGlobalEnemyDataEditor: TfrmGlobalEnemyDataEditor;

implementation

uses uglobal,uEnemyType, fEnemyPreview;

{$R *.dfm}

procedure TfrmGlobalEnemyDataEditor.PopulateListview();
var
  i,x : Integer;
begin

  lvwGlobalEnemyData.Items.BeginUpdate;
  lvwGlobalEnemyData.Items.Clear;
  for i := 0 to CVROM.NumberOfEnemies - 1 do
  begin

    with lvwGlobalEnemyData.Items.Add do
    begin
      Caption := IntToHex(i,2);
      SubItems.Add(IntToHex(CVROM.Enemies[i].Offset,5));
      if CVROM.Enemies[i].EnemyType = etNone then
        SubItems.Add('None')
      else if CVROM.Enemies[i].EnemyType = etEnemy then
      begin
        if i > $45 then
          SubItems.Add('X - Enemy')
        else
          SubItems.Add('Enemy');
      end
      else if CVROM.Enemies[i].EnemyType = etCandle then
        SubItems.Add('Candle')
      else if CVROM.Enemies[i].EnemyType = etCandleNoXEditing then
        SubItems.Add('Candle')
      else if CVROM.Enemies[i].EnemyType = etCandleStand then
        SubItems.Add('Candlestand');
      if CVROM.Enemies[i].EnemyType = etEnemy then
      begin
        for x :=0 to high(EnemyArr) do
        begin
          if EnemyArr[x,0] = IntToHex(CVROM.Enemies[i].EnemyItem,2) then
          begin
            SubItems.Add(EnemyArr[x,1]);
            break;
          end;
        end;

        if SubItems.Count =2 then
          SubItems.Add(IntToHex(CVROM.Enemies[i].EnemyItem,2) + ' ~ Unknown');
      end
      else if (CVROM.Enemies[i].EnemyType = etCandle) or (CVROM.Enemies[i].EnemyType = etCandleNoXEditing) or (CVROM.Enemies[i].EnemyType = etCandleStand) then
      begin
        for x :=0 to high(CandleArr) do
        begin
          if CandleArr[x,0] = IntToHex(CVROM.Enemies[i].EnemyItem,2) then
          begin
            SubItems.Add(CandleArr[x,1]);
            break;
          end;
        end;

        if SubItems.Count =2 then
          SubItems.Add(IntToHex(CVROM.Enemies[i].EnemyItem,2) + ' ~ Unknown');
      end
      else
        SubItems.Add(IntToHex(CVROM.Enemies[i].EnemyItem,2));

      SubItems.Add(IntToHex(CVROM.Enemies[i].X,2));
      SubItems.Add(IntToHex(CVROM.Enemies[i].Y,2));

    end;

  end;
  lvwGlobalEnemyData.Items.EndUpdate;
end;

procedure TfrmGlobalEnemyDataEditor.FormShow(Sender: TObject);
begin
  PopulateListview();
  lvwGlobalEnemyData.ItemIndex := ID;
  lvwGlobalEnemyData.Items[ID].MakeVisible(True);
  lvwGlobalEnemyDataClick(application);
end;

procedure TfrmGlobalEnemyDataEditor.lvwGlobalEnemyDataClick(
  Sender: TObject);
var
  Enemy : Byte;
  i : Integer;
begin
  Enemy :=  StrToInt('$' + lvwGlobalEnemyData.Items[lvwGlobalEnemyData.ItemIndex].Caption);
  cbEnemyItemDropped.Items.clear;

  if CVROM.Enemies[Enemy].EnemyType = etEnemy then
  begin

    for i :=0 to high(EnemyArr) do
    begin
      if EnemyArr[i,0] <> '00' then
        cbEnemyItemDropped.Items.Add(EnemyArr[i,1]);
      if CVROM.Enemies[Enemy].EnemyItem = StrToInt('$' + EnemyArr[i,0]) then
        cbEnemyItemDropped.ItemIndex := i;
    end;

  end
  else if (CVROM.Enemies[Enemy].EnemyType = etCandle) or (CVROM.Enemies[Enemy].EnemyType = etCandleNoXEditing) or (CVROM.Enemies[Enemy].EnemyType = etCandleStand) then
  begin
    for i :=0 to high(CandleArr) do
    begin
      cbEnemyItemDropped.Items.Add(CandleArr[i,1]);
      if CVROM.Enemies[Enemy].EnemyItem = StrToInt('$' + CandleArr[i,0]) then
        cbEnemyItemDropped.ItemIndex := i;
    end;
  end;

  txtX.Text := IntToHex(CVROM.Enemies[Enemy].X,2);
  txtY.Text := IntToHex(CVROM.Enemies[Enemy].Y,2);

  if CVROM.Enemies[Enemy].EnemyType = etNone then
  begin
    cbEnemyItemDropped.Enabled := False;
    txtX.Enabled := False;
    txtY.Enabled := False;
    cmdSet.Enabled := False;
    cmdPreview.Enabled := False;
  end
  else if CVROM.Enemies[Enemy].EnemyType = etCandle then
  begin
    if CVROM.Enemies[Enemy].EnemyItem = 0 then
      cbEnemyItemDropped.Enabled := False
    else
      cbEnemyItemDropped.Enabled := True;
    txtX.Enabled := True;
    txtY.Enabled := True;
    cmdSet.Enabled := True;
    cmdPreview.Enabled := True;
  end
  else if CVROM.Enemies[Enemy].EnemyType = etCandleStand then
  begin
    if CVROM.Enemies[Enemy].EnemyItem = 0 then
      cbEnemyItemDropped.Enabled := False
    else
      cbEnemyItemDropped.Enabled := True;
    txtX.Enabled := True;
    txtY.Enabled := True;
    cmdSet.Enabled := True;
    cmdPreview.Enabled := True;
  end
  else if CVROM.Enemies[Enemy].EnemyType = etCandleNoXEditing then
  begin
    if CVROM.Enemies[Enemy].EnemyItem = 0 then
      cbEnemyItemDropped.Enabled := False
    else
      cbEnemyItemDropped.Enabled := True;
    txtX.Enabled := False;
    txtY.Enabled := True;
    cmdSet.Enabled := True;
    cmdPreview.Enabled := True;
  end
  else if CVROM.Enemies[Enemy].EnemyType = etEnemy then
  begin
    if Enemy < $45 then
    begin
      if CVROM.Enemies[Enemy].EnemyItem = 0 then
          cbEnemyItemDropped.Enabled := False
      else
        cbEnemyItemDropped.Enabled := True;
      txtX.Enabled := True;
      txtY.Enabled := True;
      cmdSet.Enabled := True;
      cmdPreview.Enabled := True;
    end
    else
    begin
      cbEnemyItemDropped.Enabled := False;
      txtX.Enabled := False;
      txtY.Enabled := False;
      cmdSet.Enabled := False;
      cmdPreview.Enabled := False;
    end;
  end;
end;

procedure TfrmGlobalEnemyDataEditor.cmdPreviewClick(Sender: TObject);
var
  EnemyPreview : TfrmEnemyPreview;
begin
  EnemyPreview := TfrmEnemyPreview.Create(self);
  try
    EnemyPreview.EnemyID := lvwGlobalEnemyData.ItemIndex;
    EnemyPreview.ShowModal;
  finally
    FreeAndNil(EnemyPreview);
  end;

end;

procedure TfrmGlobalEnemyDataEditor.cmdOKClick(Sender: TObject);
begin
  CVROM.SaveEnemyPosData;
  CVROM.LoadEnemyPosData;
end;

procedure TfrmGlobalEnemyDataEditor.cmdSetClick(Sender: TObject);
var
  TempItemIndex : Integer;
begin
  if txtX.Enabled = true then
    CVROM.Enemies[lvwGlobalEnemyData.ItemIndex].X := StrToInt('$' + txtX.Text);

  if txtY.Enabled = true then
    CVROM.Enemies[lvwGlobalEnemyData.ItemIndex].Y := StrToInt('$' + txtY.Text);

  if cbEnemyItemDropped.Enabled = true then
  begin
    if CVROM.Enemies[lvwGlobalEnemyData.ItemIndex].EnemyType = etEnemy then
      CVROM.Enemies[lvwGlobalEnemyData.ItemIndex].EnemyItem := StrToInt('$' + EnemyArr[cbEnemyItemDropped.ItemIndex,0])
    else
      CVROM.Enemies[lvwGlobalEnemyData.ItemIndex].EnemyItem := StrToInt('$' + CandleArr[cbEnemyItemDropped.ItemIndex,0]);
  end;
  TempItemIndex := lvwGlobalEnemyData.ItemIndex;
  PopulateListview();
  lvwGlobalEnemyData.ItemIndex := TempItemIndex;
  lvwGlobalEnemyData.Items[lvwGlobalEnemyData.ItemIndex].MakeVisible(True);
end;

procedure TfrmGlobalEnemyDataEditor.FormCreate(Sender: TObject);
begin
  ID := 0;
end;

end.
