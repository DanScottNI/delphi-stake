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

unit fEnemyEd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmEnemyEditor = class(TForm)
    cbEnemyCandle: TComboBox;
    lblEnemyCandle: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    cmdEdit: TButton;
    cmdClearEnemyList: TButton;
    lvwEnemies: TListView;
    cmdPreview: TButton;
    cmdClear: TButton;
    grpEnemyData: TGroupBox;
    lblPointerOffset: TLabel;
    lblPointer: TLabel;
    lblOffset: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmdEditClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdClearEnemyListClick(Sender: TObject);
    procedure cmdReloadEnemyDataClick(Sender: TObject);
    procedure lvwEnemiesClick(Sender: TObject);
    procedure cmdPreviewClick(Sender: TObject);
    procedure cmdClearClick(Sender: TObject);
  private

    EnemyNames : TStringList;
    procedure DisplayEnemyData;

    procedure LoadEnemyNames;
    procedure CompleteEnemyDataDetails;
    { Private declarations }

  public
    LevelNumber : Byte;
    PointNumber : Byte;
    { Public declarations }
  end;

var
  frmEnemyEditor: TfrmEnemyEditor;

implementation

uses uglobal, fEnemyPreview, uEnemyType;

{$R *.dfm}

procedure TfrmEnemyEditor.FormShow(Sender: TObject);
begin
  CompleteEnemyDataDetails();
  LoadEnemyNames();
  DisplayEnemyData();
end;

procedure TfrmEnemyEditor.LoadEnemyNames();
var
  i,x,result : Integer;
begin
  for i := 0 to CVROM.Enemies.Count - 1 do
  begin
    if CVROM.Enemies[i].EnemyType = etNone then
      cbEnemyCandle.Items.Add(IntToHex(i,2) + ' - None')
    else if (CVROM.Enemies[i].EnemyType = etCandle) or (CVROM.Enemies[i].EnemyType = etCandleNoXEditing) then
    begin
      for x := 0 to high(CandleArr) do
      begin
        result := -1;
        if CandleArr[x,0] = IntToHex(CVROM.Enemies[i].EnemyItem,2) then
        begin
          cbEnemyCandle.Items.Add(IntToHex(i,2) + ' - Candle - ' + CandleArr[x,1] + ' (' + IntToHex(CVROM.Enemies[i].Y,2) + ')');
          result := x;
          break;
        end;
      end;
      if result = -1 then
        cbEnemyCandle.Items.Add(IntToHex(i,2) + ' - Candle - $' + IntToHex(CVROM.Enemies[i].EnemyItem,2) + ' (' + IntToHex(CVROM.Enemies[i].Y,2) + ')');
    end
    else if (CVROM.Enemies[i].EnemyType = etCandleStand) then
    begin
      for x := 0 to high(CandleArr) do
      begin
        result := -1;
        if CandleArr[x,0] = IntToHex(CVROM.Enemies[i].EnemyItem,2) then
        begin
          cbEnemyCandle.Items.Add(IntToHex(i,2) + ' - Candle stand - ' + CandleArr[x,1] + ' (' + IntToHex(CVROM.Enemies[i].Y,2) + ')');
          result := x;
          break;
        end;
      end;
      if result = -1 then
        cbEnemyCandle.Items.Add(IntToHex(i,2) + ' - Candle stand - $' + IntToHex(CVROM.Enemies[i].EnemyItem,2) + ' (' + IntToHex(CVROM.Enemies[i].Y,2) + ')');
    end
    else if CVROM.Enemies[i].EnemyType = etEnemy then
    begin
      for x := 0 to high(EnemyArr) do
      begin
        result := -1;
        if EnemyArr[x,0] = IntToHex(CVROM.Enemies[i].EnemyItem,2) then
        begin
          cbEnemyCandle.Items.Add(IntToHex(i,2) + ' - Enemy - ' + EnemyArr[x,1] + ' (' + IntToHex(CVROM.Enemies[i].Y,2) + ')');
          result := x;
          break;
        end;
      end;
      if result = -1 then
        cbEnemyCandle.Items.Add(IntToHex(i,2) + ' - Enemy - $' + IntToHex(CVROM.Enemies[i].EnemyItem,2) + ' (' + IntToHex(CVROM.Enemies[i].Y,2) + ')');
    end


  end;
  cbEnemyCandle.ItemIndex := 0;
end;

procedure TfrmEnemyEditor.DisplayEnemyData();
var
  i,x : Integer;
  SubItemToAdd : String;
begin
  lvwEnemies.Items.Clear;

  for i := 0 to CVROM.EnemyDataSize - 1 do
  begin
    with lvwEnemies.Items.Add do
    begin

      Caption := IntToHex(i,2);
      if i mod 2 = 0 then
        SubItems.Add('Enemy')
      else
        SubItems.Add('Candle');
      if CVROM.Enemies[CVROM.EnemyData[i]].EnemyType = etNone then
        SubItems.Add('None')
      else if CVROM.Enemies[CVROM.EnemyData[i]].EnemyType = etEnemy then
      begin
        for x :=0 to high(EnemyArr) do
        begin
          if EnemyArr[x,0] = IntToHex(CVROM.Enemies[CVROM.EnemyData[i]].EnemyItem,2) then
          begin
            SubItemToAdd :=IntToHex(CVROM.EnemyData[i],2) + ' ~ Enemy ~ ' + EnemyArr[x,1];
            SubItems.Add(SubItemToAdd);
            break;
          end;
        end;
        if SubItems.Count =1 then
          SubItems.Add(IntToHex(CVROM.Enemies[CVROM.EnemyData[i]].EnemyItem,2));
      end
      else if (CVROM.Enemies[CVROM.EnemyData[i]].EnemyType = etCandle) or (CVROM.Enemies[CVROM.EnemyData[i]].EnemyType = etCandleNoXEditing) or (CVROM.Enemies[CVROM.EnemyData[i]].EnemyType = etCandleStand) then
      begin
        for x :=0 to high(CandleArr) do
        begin
          if CandleArr[x,0] = IntToHex(CVROM.Enemies[CVROM.EnemyData[i]].EnemyItem,2) then
          begin
            SubItemToAdd :=IntToHex(CVROM.EnemyData[i],2);
            if (CVROM.Enemies[CVROM.EnemyData[i]].EnemyType = etCandle) or (CVROM.Enemies[CVROM.EnemyData[i]].EnemyType = etCandleNoXEditing) then
              SubItemToAdd := SubItemToAdd + ' ~ Candle ~ '
            else if CVROM.Enemies[CVROM.EnemyData[i]].EnemyType = etCandleStand then
              SubItemToAdd := SubItemToAdd + ' ~ Candle stand ~ ';
            SubItemToAdd := SubItemToAdd + CandleArr[x,1];
            SubItems.Add(SubItemToAdd);
            break;
          end;
        end;
        if SubItems.Count =1 then
          SubItems.Add(IntToHex(CVROM.Enemies[CVROM.EnemyData[i]].EnemyItem,2));
      end;

//      SubItems.Add(EnemyNames[EnemyData[i]]);
      SubItems.Add(IntToHex(CVROM.Enemies[CVROM.EnemyData[i]].Y,2));

    end;
  end;
end;

procedure TfrmEnemyEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(EnemyNames);
end;

procedure TfrmEnemyEditor.cmdEditClick(Sender: TObject);
var
  TempItemIndex : Integer;
begin
  if lvwEnemies.ItemIndex > -1 then
  begin
    CVROM.EnemyData[lvwEnemies.ItemIndex] := cbEnemyCandle.ItemIndex;
    TempItemIndex := lvwEnemies.ItemIndex;
    DisplayEnemyData();
    lvwEnemies.ItemIndex := TempItemIndex;
    lvwEnemies.Items[lvwEnemies.ItemIndex].MakeVisible(True);

  end;
end;

procedure TfrmEnemyEditor.cmdOKClick(Sender: TObject);
begin
  CVROM.SaveEnemyData();
end;

procedure TfrmEnemyEditor.cmdClearEnemyListClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to CVROM.EnemyDataSize -1 do
    CVROM.EnemyData[i] := 0;
  DisplayEnemyData();
end;

procedure TfrmEnemyEditor.cmdReloadEnemyDataClick(Sender: TObject);
begin
  LoadEnemyNames();
  DisplayEnemyData();
end;

procedure TfrmEnemyEditor.lvwEnemiesClick(Sender: TObject);
begin
  cbEnemyCandle.ItemIndex := CVROM.EnemyData[lvwEnemies.ItemIndex];
end;

procedure TfrmEnemyEditor.cmdPreviewClick(Sender: TObject);
var
  EnemyPreview : TfrmEnemyPreview;
begin
  EnemyPreview := TfrmEnemyPreview.Create(self);
  try
    if lvwEnemies.ItemIndex > -1 then
      EnemyPreview.EnemyID := CVROM.EnemyData[lvwEnemies.ItemIndex];
    EnemyPreview.ShowModal;
  finally
    FreeAndNil(EnemyPreview);
  end;

end;



procedure TfrmEnemyEditor.cmdClearClick(Sender: TObject);
var
  TempItemIndex : Integer;
begin
  if lvwEnemies.ItemIndex > -1 then
  begin
    CVROM.EnemyData[lvwEnemies.ItemIndex] := 0;
    TempItemIndex := lvwEnemies.ItemIndex;
    DisplayEnemyData();
    lvwEnemies.ItemIndex := TempItemIndex;
    lvwEnemies.Items[lvwEnemies.ItemIndex].MakeVisible(True);
  end;
end;

procedure TfrmEnemyEditor.CompleteEnemyDataDetails();
begin
  lblPointerOffset.Caption := 'Pointer Offset: ' + '$' + IntToHex(CVROM.Levels[CVROM.Level].GetEnemyDataPointerOffset(CVROM.ScreenID),1);
  lblPointer.Caption := 'Pointer: ' + '$' + CVROM.Levels[CVROM.Level].GetEnemyDataPointer(CVROM.ScreenID);
  lblOffset.Caption := 'Offset: ' + '$' + IntToHex(CVROM.Levels[CVROM.Level].GetEnemyDataOffset(CVROM.ScreenID),1);
end;

end.
