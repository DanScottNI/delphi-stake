object frmPatches: TfrmPatches
  Left = 291
  Top = 221
  HelpContext = 1010
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ROM Patches'
  ClientHeight = 374
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvwROMPatches: TListView
    Left = 8
    Top = 8
    Width = 577
    Height = 297
    Columns = <
      item
        Caption = 'Title'
        Width = 200
      end
      item
        Caption = 'Description'
        Width = 350
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object cmdApply: TButton
    Left = 464
    Top = 312
    Width = 123
    Height = 25
    Caption = '&Apply Patch'
    TabOrder = 1
    OnClick = cmdApplyClick
  end
  object cmdOk: TButton
    Left = 512
    Top = 344
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
end
