unit fKeyboardLayouts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmKeyboardLayouts = class(TForm)
    cmdOk: TButton;
    mmoKeyboardLayouts: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKeyboardLayouts: TfrmKeyboardLayouts;

implementation

{$R *.dfm}

end.
