unit ulunarcompress;

interface
  uses forms, windows;

  function LunarIPSCreate(hwnd : Hwnd; IPSFileName : PChar; ROMFileName : PChar; ROM2FileName : PChar;  Flags : LongWord) : longint;stdcall;
  function LunarVersion():Cardinal;stdcall;
implementation

  function LunarIPSCreate; external 'Lunar Compress.dll';
  function LunarVersion;external 'Lunar Compress.dll';

end.
