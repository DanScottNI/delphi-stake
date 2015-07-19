unit uglobal;

interface

uses cCVROM, cconfig;

var
  // This is the main object that should be accessed to
  // do anything in the ROM. Totally against the principles
  // of Object-Orientated Programming, but the whole point
  // of programming methodologies is to make things easier
  // for the programmer. At least that is what I believe.
  CVROM : TCVROM;
  // Another global variable used to configure the various options
  // in Stake.
  StakeOptions : TStakeConfiguration;
  // This array consists of all the names of the known enemies
  EnemyArr : Array [0..27,0..1] of String;
  // This array consists of all the powerups that can be got from
  // candlestands/candles.
  CandleArr : Array [0..15,0..1] of String;

Const
  // A constant that is used to place the same text in the
  // application's caption/about box/etc.
  APPLICATIONNAME : String = 'Stake v1.1.2 ~ The Castlevania Editor';
implementation

end.
