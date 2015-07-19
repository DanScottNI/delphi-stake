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

unit fEnemyFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEnemyType, ExtCtrls;

type
  TfrmEnemyFilter = class(TForm)
    lblItemDropped: TLabel;
    cbItemDroppedEnemy: TComboBox;
    scrIndex: TScrollBar;
    lblEnemyQuadrant: TLabel;
    rdgEnemyCandle: TRadioGroup;
    lblIndex: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbItemDroppedEnemyChange(Sender: TObject);
    procedure scrIndexChange(Sender: TObject);
    procedure rdgEnemyCandleClick(Sender: TObject);
  private
    procedure SetScrollBarMax;
    { Private declarations }
  public
    EnemyType : TEnemyType;
    ItemDropped : Integer;
    Index : Integer;
    procedure EnemyQuadrant(pID : integer);
    { Public declarations }
  end;

var
  frmEnemyFilter: TfrmEnemyFilter;

implementation

uses fStake, uglobal;

{$R *.dfm}

procedure TfrmEnemyFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
  frmStake.SetMapEditingModeOn;
end;

procedure TfrmEnemyFilter.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  EnemyType := etCandle;
  Index :=1;
  rdgEnemyCandle.ItemIndex := 0;
  for i :=0 to high(CandleArr) do
  begin
    cbItemDroppedEnemy.Items.Add('$'+ CandleArr[i,0] + ' - ' + CandleArr[i,1]);

  end;
  ItemDropped := StrToInt('$' + CandleArr[0,0]);
  cbItemDroppedEnemy.ItemIndex := 0;
  SetScrollBarMax();
end;

procedure TfrmEnemyFilter.cbItemDroppedEnemyChange(Sender: TObject);
begin
  if (EnemyType = etCandle) then
  begin
    ItemDropped := StrToInt('$'+ CandleArr[cbItemDroppedEnemy.ItemIndex,0]);
    SetScrollBarMax();
  end
  else if (EnemyType = etCandlestand) then
  begin
    ItemDropped := StrToInt('$'+ CandleArr[cbItemDroppedEnemy.ItemIndex,0]);
    SetScrollBarMax();
  end
  else if EnemyType = etEnemy then
  begin
    ItemDropped := StrToInt('$'+ EnemyArr[cbItemDroppedEnemy.ItemIndex,0]);
    SetScrollBarMax();
  end;
  frmStake.DrawLevelData();
end;

procedure TfrmEnemyFilter.scrIndexChange(Sender: TObject);
begin
  Index := scrIndex.Position;
  frmStake.DrawLevelData;
end;

procedure TfrmEnemyFilter.SetScrollBarMax();
begin
  if EnemyType = etCandle then
  begin
    if CVROM.Enemies.NumberOfCandlesFilter(ItemDropped) > 16 then
    begin
      scrIndex.Position := 1;
      scrIndex.Max :=  (CVROM.Enemies.NumberOfCandlesFilter(ItemDropped) div 16) + 1;
    end
    else
    begin
      scrIndex.Position := 1;
      scrIndex.Max :=1;
    end;
  end
  else if EnemyType = etCandleStand then
  begin
    if CVROM.Enemies.NumberOfCandlestandsFilter(ItemDropped) > 16 then
    begin
      scrIndex.Position := 1;
      scrIndex.Max :=  (CVROM.Enemies.NumberOfCandlestandsFilter(ItemDropped) div 16) + 1;
    end
    else
    begin
      scrIndex.Position := 1;
      scrIndex.Max :=1;
    end;
  end
  else if EnemyType = etEnemy then
  begin
    if CVROM.Enemies.NumberOfEnemiesFilter(ItemDropped) > 16 then
    begin
      scrIndex.Position := 1;
      scrIndex.Max :=  (CVROM.Enemies.NumberOfEnemiesFilter(ItemDropped) div 16) + 1;
    end
    else
    begin
      scrIndex.Position := 1;
      scrIndex.Max :=1;
    end;
  end;
end;

procedure TfrmEnemyFilter.EnemyQuadrant(pID: integer);
var
  i : Integer;
  res : Integer;
begin
  res := 0;
  if pID = -1 then
  begin
    lblEnemyQuadrant.Caption := 'Candle in this column: ' + chr(13) + chr(10) + 'None';
  end
  else if EnemyType = etEnemy then
  begin
    for i := 0 to high(EnemyArr) do
    begin
      if StrToInt('$' + EnemyArr[i,0]) = pID then
      begin
        res := i;
        break;
      end;
    end;
    lblEnemyQuadrant.Caption := 'Enemy in this column: ' + chr(13) + chr(10) + EnemyArr[res,1];
  end
  else
  begin
    for i := 0 to high(CandleArr) do
    begin
      if StrToInt('$' + CandleArr[i,0]) = pID then
      begin
        res := i;
        break;
      end;
    end;
    lblEnemyQuadrant.Caption := 'Candle in this column: ' + chr(13) + chr(10) + CandleArr[res,1];
  end;
end;

procedure TfrmEnemyFilter.rdgEnemyCandleClick(Sender: TObject);
var
  i : Integer;
begin
  cbItemDroppedEnemy.Items.Clear;
  if rdgEnemyCandle.ItemIndex = 0 then
  begin
    EnemyType := etCandle;
    for i :=0 to high(CandleArr) do
    begin
      cbItemDroppedEnemy.Items.Add('$'+ CandleArr[i,0] + ' - ' + CandleArr[i,1]);
    end;
    ItemDropped := StrToInt('$' + CandleArr[0,0]);
    cbItemDroppedEnemy.ItemIndex := 0;
    SetScrollBarMax();
  end
  else if rdgEnemyCandle.ItemIndex = 1 then
  begin
    EnemyType := etCandleStand;
    for i :=0 to high(CandleArr) do
    begin
      cbItemDroppedEnemy.Items.Add('$'+ CandleArr[i,0] + ' - ' + CandleArr[i,1]);
    end;
    ItemDropped := StrToInt('$' + CandleArr[0,0]);
    cbItemDroppedEnemy.ItemIndex := 0;
    SetScrollBarMax();
  end
  else if rdgEnemyCandle.ItemIndex = 2 then
  begin
    EnemyType := etEnemy;

    for i :=0 to high(EnemyArr) do
    begin
      if EnemyArr[i,0] <> '00' then
        cbItemDroppedEnemy.Items.Add('$'+ EnemyArr[i,0] + ' - ' + EnemyArr[i,1]);
    end;
    ItemDropped := StrToInt('$' + EnemyArr[0,0]);
    cbItemDroppedEnemy.ItemIndex := 0;
    SetScrollBarMax();
  end;
  Index := 1;


  frmStake.DrawLevelData();

end;

end.
