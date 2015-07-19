object frmKeyboardLayouts: TfrmKeyboardLayouts
  Left = 254
  Top = 173
  BorderStyle = bsDialog
  Caption = 'Keyboard Layouts'
  ClientHeight = 311
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cmdOk: TButton
    Left = 344
    Top = 280
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object mmoKeyboardLayouts: TMemo
    Left = 8
    Top = 8
    Width = 409
    Height = 265
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Page Up        - Go to next level'
      'Page Down      - Go to previous level'
      'Ctrl + C       - Castle Introduction Editor'
      'Ctrl + D       - Character Damage Settings'
      'Ctrl + E       - Raw Enemy Editor'
      'Ctrl + G       - Global Enemy Editor'
      'Ctrl + I       - Title Screen Editor'
      'Ctrl + J       - Go to level dialog'
      'Ctrl + M       - Music Pointer Editor'
      'Ctrl + O       - Open ROM'
      'Ctrl + P       - Palette Editor'
      'Ctrl + R       - ROM Properties'
      'Ctrl + S       - Save ROM'
      'Ctrl + T       - TSA editor'
      'Ctrl + V       - Import Level'
      'Ctrl + W       - Close ROM'
      'Ctrl + X       - Exit'
      'Ctrl + Alt + E - Ending Editor'
      'Ctrl + Alt + G - Stage Properties'
      'Ctrl + Alt + I - ROM Patches'
      'Ctrl + Alt + P - Preferences'
      'Ctrl + Alt + S - Save ROM as IPS'
      'Ctrl + Alt + T - Sound Effect Toggler'
      'Ctrl + Alt + V - Export Level'
      'F2             - Map Editing Mode'
      'F3             - Object Editing Mode'
      'F4             - Enemy Editing Mode'
      'F5             - View Black Bar'
      'F6             - Enable Gridlines'
      'F7             - Screen Selector'
      'F9             - Add New Stair'
      'F10            - Add New Breakable Block'
      'F12            - Launches Associated Emulator'
      'Shift + F2     - View Stairs'
      'Shift + F3     - View Entrances'
      'Shift + F4     - View Doors'
      'Shift + F5     - View Breakable Blocks'
      'Shift + F6     - View Spike Crushers'
      'Shift + F7     - View Floating Platforms'
      'Shift + F8     - Turn all view options on'
      'Shift + F9     - Turn all view options off')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
